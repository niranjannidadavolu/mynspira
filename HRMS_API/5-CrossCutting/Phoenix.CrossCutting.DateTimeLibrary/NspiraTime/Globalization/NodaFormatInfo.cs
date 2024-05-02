// Copyright 2011 The Noda Time Authors. All rights reserved.
// Use of this source code is governed by the Apache License 2.0,
// as found in the LICENSE.txt file.

using System.Collections.Concurrent;
using System.Collections.ObjectModel;
using System.Globalization;
using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Annotations;
using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Calendars;
using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Text;
using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Text.Patterns;
using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.TimeZones;
using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Utility;

namespace Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Globalization
{
    /// <summary>
    /// A <see cref="IFormatProvider"/> for Noda Time types, usually initialised from a <see cref="System.Globalization.CultureInfo"/>.
    /// This provides a single place defining how NodaTime values are formatted and displayed, depending on the culture.
    /// </summary>
    /// <remarks>
    /// Currently this is "shallow-immutable" - although none of these properties can be changed, the
    /// CultureInfo itself may be mutable. If the CultureInfo is mutated after initialization, results are not
    /// guaranteed: some aspects of the CultureInfo may be extracted at initialization time, others may be
    /// extracted on first demand but cached, and others may be extracted on-demand each time.
    /// </remarks>
    /// <threadsafety>Instances which use read-only CultureInfo instances are immutable,
    /// and may be used freely between threads. Instances with mutable cultures should not be shared between threads
    /// without external synchronization.
    /// See the thread safety section of the user guide for more information.</threadsafety>
    internal sealed class NodaFormatInfo
    {
        // Names that we can use to check for broken Mono behaviour.
        // The cloning is *also* to work around a Mono bug, where even read-only cultures can change...
        // See https://xamarin.github.io/bugzilla-archives/32/3279/bug.html
        private static readonly string[] ShortInvariantMonthNames = (string[]) CultureInfo.InvariantCulture.DateTimeFormat.AbbreviatedMonthNames.Clone();
        private static readonly string[] LongInvariantMonthNames = (string[]) CultureInfo.InvariantCulture.DateTimeFormat.MonthNames.Clone();

        // The lock guarding the various fields which are (optionally) lazily initialized.
        // When this is null, all fields will have been initialized in the constructor, so
        // no checking is required.
        private readonly object? fieldLock = new object();

        #region Patterns
        private FixedFormatInfoPatternParser<Duration>? durationPatternParser;
        private FixedFormatInfoPatternParser<Offset>? offsetPatternParser;
        private FixedFormatInfoPatternParser<Instant>? instantPatternParser;
        private FixedFormatInfoPatternParser<LocalTime>? localTimePatternParser;
        private FixedFormatInfoPatternParser<LocalDate>? localDatePatternParser;
        private FixedFormatInfoPatternParser<LocalDateTime>? localDateTimePatternParser;
        private FixedFormatInfoPatternParser<OffsetDateTime>? offsetDateTimePatternParser;
        private FixedFormatInfoPatternParser<OffsetDate>? offsetDatePatternParser;
        private FixedFormatInfoPatternParser<OffsetTime>? offsetTimePatternParser;
        private FixedFormatInfoPatternParser<ZonedDateTime>? zonedDateTimePatternParser;
        private FixedFormatInfoPatternParser<AnnualDate>? annualDatePatternParser;
        private FixedFormatInfoPatternParser<YearMonth>? yearMonthPatternParser;
        #endregion

        /// <summary>
        /// A NodaFormatInfo wrapping the invariant culture.
        /// </summary>
        // Note: this must occur below the pattern parsers, to make type initialization work...
        public static readonly NodaFormatInfo InvariantInfo = new NodaFormatInfo(CultureInfo.InvariantCulture, initializeEagerly: true);

        // Justification for max size: CultureInfo.GetCultures(CultureTypes.AllCultures) returned:
        // - 378 cultures on Windows 8 in mid-2013
        // - 832 cultures on Windows 10 in late-2016
        // - 869 or 888 on Windows 11 in early-2024 (net471 and net60/net80 respectively)
        // It's unlikely that they'll all be used by any particular application,
        // but the cost per entry is very small, so we might as well allow for all non-customized
        // cultures (and if fewer cultures are used, there's no cost anyway).
        private static readonly Cache<CultureInfo, NodaFormatInfo> Cache = new Cache<CultureInfo, NodaFormatInfo>
            (1000, culture => new NodaFormatInfo(culture, initializeEagerly: true), new ReferenceEqualityComparer<CultureInfo>());

        private IReadOnlyList<string>? longMonthNames;
        private IReadOnlyList<string>? longMonthGenitiveNames;
        private IReadOnlyList<string>? longDayNames;
        private IReadOnlyList<string>? shortMonthNames;
        private IReadOnlyList<string>? shortMonthGenitiveNames;
        private IReadOnlyList<string>? shortDayNames;

        private readonly ConcurrentDictionary<Era, EraDescription> eraDescriptions;

        /// <summary>
        /// Initializes a new instance of the <see cref="NodaFormatInfo" /> class based solely
        /// on a <see cref="System.Globalization.CultureInfo"/>.
        /// </summary>
        /// <param name="cultureInfo">The culture info to use.</param>
        /// <param name="initializeEagerly">Whether or not to fully initialize eagerly. If this is true,
        /// more work is done on construction, but avoids locks during usage.</param>
        [VisibleForTesting]
        internal NodaFormatInfo(CultureInfo cultureInfo, bool initializeEagerly)
            // If cultureInfo is null, this will throw before we get to the DateTimeFormatInfo being null.
            : this(cultureInfo, cultureInfo?.DateTimeFormat!, initializeEagerly)
        {
        }

        /// <summary>
        /// Initializes a new instance of the <see cref="NodaFormatInfo" /> class based on
        /// potentially disparate <see cref="System.Globalization.CultureInfo"/> and
        /// <see cref="DateTimeFormatInfo"/> instances.
        /// </summary>
        /// <param name="cultureInfo">The culture info to use for text comparisons and resource lookups.</param>
        /// <param name="dateTimeFormat">The date/time format to use for format strings etc.</param>
        /// <param name="initializeEagerly">Whether or not to fully initialize eagerly. If this is true,
        /// more work is done on construction, but avoids locks during usage.</param>
        [VisibleForTesting]
        internal NodaFormatInfo(CultureInfo cultureInfo, DateTimeFormatInfo dateTimeFormat, bool initializeEagerly)
        {
            Preconditions.CheckNotNull(cultureInfo, nameof(cultureInfo));
            Preconditions.CheckNotNull(dateTimeFormat, nameof(dateTimeFormat));
            CultureInfo = cultureInfo;
            DateTimeFormat = dateTimeFormat;
            eraDescriptions = new ConcurrentDictionary<Era, EraDescription>();

            if (initializeEagerly)
            {
                // fieldLock will have been assigned a reference, so the code below
                // will take the lock and initialize each field. We could potentially
                // avoid the initial object allocation and lock on "this" during the initialization,
                // but the benefit is tiny in the context of initializing the various pattern parsers,
                // and it avoids having to worry about any chance of deadlocks if we
                // accidentally publish "this" too early. (That really shouldn't happen,
                // but using a new object feels slightly safer.)

                EnsureMonthsInitialized();
                EnsureDaysInitialized();
                Initialize(DurationPatternParser);
                Initialize(OffsetPatternParser);
                Initialize(InstantPatternParser);
                Initialize(LocalTimePatternParser);
                Initialize(LocalDatePatternParser);
                Initialize(LocalDateTimePatternParser);
                Initialize(OffsetDateTimePatternParser);
                Initialize(OffsetDatePatternParser);
                Initialize(OffsetTimePatternParser);
                Initialize(ZonedDateTimePatternParser);
                Initialize(AnnualDatePatternParser);
                Initialize(YearMonthPatternParser);

                // Reset fieldLock to null, to indicate that we don't need
                // to take a lock again post-construction.
                fieldLock = null;

                void Initialize(object _) { }
            }
        }

        private void EnsureMonthsInitialized()
        {
            if (fieldLock is null)
            {
                return;
            }
            lock (fieldLock)
            {
                if (longMonthNames != null)
                {
                    return;
                }
                // Turn month names into 1-based read-only lists
                longMonthNames = ConvertMonthArray(DateTimeFormat.MonthNames);
                shortMonthNames = ConvertMonthArray(DateTimeFormat.AbbreviatedMonthNames);
                longMonthGenitiveNames = ConvertGenitiveMonthArray(longMonthNames, DateTimeFormat.MonthGenitiveNames, LongInvariantMonthNames);
                shortMonthGenitiveNames = ConvertGenitiveMonthArray(shortMonthNames, DateTimeFormat.AbbreviatedMonthGenitiveNames, ShortInvariantMonthNames);
            }
        }

        /// <summary>
        /// The BCL returns arrays of month names starting at 0; we want a read-only list starting at 1 (with 0 as an empty string).
        /// </summary>
        private static IReadOnlyList<string> ConvertMonthArray(string[] monthNames)
        {
            List<string> list = new List<string>(monthNames);
            list.Insert(0, "");
            return new ReadOnlyCollection<string>(list);
        }

        private void EnsureDaysInitialized()
        {
            if (fieldLock is null)
            {
                return;
            }
            lock (fieldLock)
            {
                if (longDayNames != null)
                {
                    return;
                }
                longDayNames = ConvertDayArray(DateTimeFormat.DayNames);
                shortDayNames = ConvertDayArray(DateTimeFormat.AbbreviatedDayNames);
            }
        }

        /// <summary>
        /// The BCL returns arrays of week names starting at 0 as Sunday; we want a read-only list starting at 1 (with 0 as an empty string)
        /// and with 7 as Sunday.
        /// </summary>
        private static IReadOnlyList<string> ConvertDayArray(string[] dayNames)
        {
            List<string> list = new List<string>(dayNames);
            list.Add(dayNames[0]);
            list[0] = "";
            return new ReadOnlyCollection<string>(list);
        }

        /// <summary>
        /// Checks whether any of the genitive names differ from the non-genitive names, and returns
        /// either a reference to the non-genitive names or a converted list as per ConvertMonthArray.
        /// </summary>
        /// <remarks>
        /// <para>
        /// Mono uses the invariant month names for the genitive month names by default, so we'll assume that
        /// if we see an invariant name, that *isn't* deliberately a genitive month name. A non-invariant culture
        /// which decided to have genitive month names exactly matching the invariant ones would be distinctly odd.
        /// See https://xamarin.github.io/bugzilla-archives/32/3278/bug.html for more details and progress.
        /// </para>
        /// <para>
        /// Mono 3.0.6 has an exciting and different bug, where all the abbreviated genitive month names are just numbers ("1" etc).
        /// So again, if we detect that, we'll go back to the non-genitive version.
        /// See https://xamarin.github.io/bugzilla-archives/11/11361/bug.html for more details and progress.
        /// </para>
        /// </remarks>
        private static IReadOnlyList<string> ConvertGenitiveMonthArray(IReadOnlyList<string> nonGenitiveNames, string[] bclNames, string[] invariantNames)
        {
            if (int.TryParse(bclNames[0], NumberStyles.Integer, CultureInfo.InvariantCulture, out var _))
            {
                return nonGenitiveNames;
            }
            for (int i = 0; i < bclNames.Length; i++)
            {
                if (bclNames[i] != nonGenitiveNames[i + 1] && bclNames[i] != invariantNames[i])
                {
                    return ConvertMonthArray(bclNames);
                }
            }
            return nonGenitiveNames;
        }

        /// <summary>
        /// Gets the culture info associated with this format provider. This is used
        /// for resource lookups and text comparisons.
        /// </summary>
        public CultureInfo CultureInfo { get; }

        /// <summary>
        /// Gets the text comparison information associated with this format provider.
        /// </summary>
        public CompareInfo CompareInfo => CultureInfo.CompareInfo;

        // Note: when adding a new property here, it *must* be initialized in the constructor in the "initializeEagerly" branch.
        internal FixedFormatInfoPatternParser<Duration> DurationPatternParser => EnsureFixedFormatInitialized(ref durationPatternParser, () => new DurationPatternParser());
        internal FixedFormatInfoPatternParser<Offset> OffsetPatternParser => EnsureFixedFormatInitialized(ref offsetPatternParser, () => new OffsetPatternParser());
        internal FixedFormatInfoPatternParser<Instant> InstantPatternParser => EnsureFixedFormatInitialized(ref instantPatternParser, () => new InstantPatternParser(InstantPattern.DefaultTemplateValue, LocalDatePattern.DefaultTwoDigitYearMax));
        internal FixedFormatInfoPatternParser<LocalTime> LocalTimePatternParser => EnsureFixedFormatInitialized(ref localTimePatternParser, () => new LocalTimePatternParser(LocalTime.Midnight));
        internal FixedFormatInfoPatternParser<LocalDate> LocalDatePatternParser => EnsureFixedFormatInitialized(ref localDatePatternParser, () => new LocalDatePatternParser(LocalDatePattern.DefaultTemplateValue, LocalDatePattern.DefaultTwoDigitYearMax));
        internal FixedFormatInfoPatternParser<LocalDateTime> LocalDateTimePatternParser => EnsureFixedFormatInitialized(ref localDateTimePatternParser, () => new LocalDateTimePatternParser(LocalDateTimePattern.DefaultTemplateValue, LocalDatePattern.DefaultTwoDigitYearMax));
        internal FixedFormatInfoPatternParser<OffsetDateTime> OffsetDateTimePatternParser => EnsureFixedFormatInitialized(ref offsetDateTimePatternParser, () => new OffsetDateTimePatternParser(OffsetDateTimePattern.DefaultTemplateValue, LocalDatePattern.DefaultTwoDigitYearMax));
        internal FixedFormatInfoPatternParser<OffsetDate> OffsetDatePatternParser => EnsureFixedFormatInitialized(ref offsetDatePatternParser, () => new OffsetDatePatternParser(OffsetDatePattern.DefaultTemplateValue, LocalDatePattern.DefaultTwoDigitYearMax));
        internal FixedFormatInfoPatternParser<OffsetTime> OffsetTimePatternParser => EnsureFixedFormatInitialized(ref offsetTimePatternParser, () => new OffsetTimePatternParser(OffsetTimePattern.DefaultTemplateValue));
        internal FixedFormatInfoPatternParser<ZonedDateTime> ZonedDateTimePatternParser => EnsureFixedFormatInitialized(ref zonedDateTimePatternParser, () => new ZonedDateTimePatternParser(ZonedDateTimePattern.DefaultTemplateValue, Resolvers.StrictResolver, null, LocalDatePattern.DefaultTwoDigitYearMax));
        internal FixedFormatInfoPatternParser<AnnualDate> AnnualDatePatternParser => EnsureFixedFormatInitialized(ref annualDatePatternParser, () => new AnnualDatePatternParser(AnnualDatePattern.DefaultTemplateValue));
        internal FixedFormatInfoPatternParser<YearMonth> YearMonthPatternParser => EnsureFixedFormatInitialized(ref yearMonthPatternParser, () => new YearMonthPatternParser(YearMonthPattern.DefaultTemplateValue, LocalDatePattern.DefaultTwoDigitYearMax));

        private FixedFormatInfoPatternParser<T> EnsureFixedFormatInitialized<T>(ref FixedFormatInfoPatternParser<T>? field,
            Func<IPatternParser<T>> patternParserFactory)
        {
            if (fieldLock is null)
            {
                return field!;
            }
            lock (fieldLock)
            {
                if (field != null)
                {
                    return field;
                }
            }
            // Construct the cache outside the lock to avoid possible deadlocks. The locally constructed
            // version is ignored if another thread has set the field in-between: this returns a consistent result,
            // but can occasionally perform redundant work.
            var localConstruction = new FixedFormatInfoPatternParser<T>(patternParserFactory(), this);
            lock (fieldLock)
            {
                if (field is null)
                {
                    field = localConstruction;
                }
                return field!;
            }
        }

        /// <summary>
        /// Returns a read-only list of the names of the months for the default calendar for this culture.
        /// See the usage guide for caveats around the use of these names for other calendars.
        /// Element 0 of the list is null, to allow a more natural mapping from (say) 1 to the string "January".
        /// </summary>
        public IReadOnlyList<string> LongMonthNames { get { EnsureMonthsInitialized(); return longMonthNames!; } }
        /// <summary>
        /// Returns a read-only list of the abbreviated names of the months for the default calendar for this culture.
        /// See the usage guide for caveats around the use of these names for other calendars.
        /// Element 0 of the list is null, to allow a more natural mapping from (say) 1 to the string "Jan".
        /// </summary>
        public IReadOnlyList<string> ShortMonthNames { get { EnsureMonthsInitialized(); return shortMonthNames!; } }
        /// <summary>
        /// Returns a read-only list of the names of the months for the default calendar for this culture.
        /// See the usage guide for caveats around the use of these names for other calendars.
        /// Element 0 of the list is null, to allow a more natural mapping from (say) 1 to the string "January".
        /// The genitive form is used for month text where the day of month also appears in the pattern.
        /// If the culture does not use genitive month names, this property will return the same reference as
        /// <see cref="LongMonthNames"/>.
        /// </summary>
        public IReadOnlyList<string> LongMonthGenitiveNames { get { EnsureMonthsInitialized(); return longMonthGenitiveNames!; } }
        /// <summary>
        /// Returns a read-only list of the abbreviated names of the months for the default calendar for this culture.
        /// See the usage guide for caveats around the use of these names for other calendars.
        /// Element 0 of the list is null, to allow a more natural mapping from (say) 1 to the string "Jan".
        /// The genitive form is used for month text where the day also appears in the pattern.
        /// If the culture does not use genitive month names, this property will return the same reference as
        /// <see cref="ShortMonthNames"/>.
        /// </summary>
        public IReadOnlyList<string> ShortMonthGenitiveNames { get { EnsureMonthsInitialized(); return shortMonthGenitiveNames!; } }
        /// <summary>
        /// Returns a read-only list of the names of the days of the week for the default calendar for this culture.
        /// See the usage guide for caveats around the use of these names for other calendars.
        /// Element 0 of the list is null, and the other elements correspond with the index values returned from
        /// <see cref="LocalDateTime.DayOfWeek"/> and similar properties.
        /// </summary>
        public IReadOnlyList<string> LongDayNames { get { EnsureDaysInitialized(); return longDayNames!; } }
        /// <summary>
        /// Returns a read-only list of the abbreviated names of the days of the week for the default calendar for this culture.
        /// See the usage guide for caveats around the use of these names for other calendars.
        /// Element 0 of the list is null, and the other elements correspond with the index values returned from
        /// <see cref="LocalDateTime.DayOfWeek"/> and similar properties.
        /// </summary>
        public IReadOnlyList<string> ShortDayNames { get { EnsureDaysInitialized(); return shortDayNames!; } }

        /// <summary>
        /// Gets the BCL date time format associated with this formatting information.
        /// </summary>
        /// <remarks>
        /// This is usually the <see cref="DateTimeFormatInfo"/> from <see cref="CultureInfo"/>,
        /// but in some cases they're different: if a DateTimeFormatInfo is provided with no
        /// CultureInfo, that's used for format strings but the invariant culture is used for
        /// text comparisons and culture lookups for non-BCL formats (such as Offset) and for error messages.
        /// </remarks>
        public DateTimeFormatInfo DateTimeFormat { get; }

        /// <summary>
        /// Gets the time separator.
        /// </summary>
        public string TimeSeparator => DateTimeFormat.TimeSeparator;

        /// <summary>
        /// Gets the date separator.
        /// </summary>
        public string DateSeparator => DateTimeFormat.DateSeparator;

        /// <summary>
        /// Gets the AM designator.
        /// </summary>
        public string AMDesignator => DateTimeFormat.AMDesignator;

        /// <summary>
        /// Gets the PM designator.
        /// </summary>
        public string PMDesignator => DateTimeFormat.PMDesignator;

        /// <summary>
        /// Returns the names for the given era in this culture.
        /// </summary>
        /// <param name="era">The era to find the names of.</param>
        /// <returns>A read-only list of names for the given era, or an empty list if
        /// the era is not known in this culture.</returns>
        public IReadOnlyList<string> GetEraNames(Era era)
        {
            Preconditions.CheckNotNull(era, nameof(era));
            return GetEraDescription(era).AllNames;
        }

        /// <summary>
        /// Returns the primary name for the given era in this culture.
        /// </summary>
        /// <param name="era">The era to find the primary name of.</param>
        /// <returns>The primary name for the given era, or an empty string if the era name is not known.</returns>
        public string GetEraPrimaryName(Era era)
        {
            Preconditions.CheckNotNull(era, nameof(era));
            return GetEraDescription(era).PrimaryName;
        }

        private EraDescription GetEraDescription(Era era) => eraDescriptions.GetOrAdd(era, key => EraDescription.ForEra(key, CultureInfo));

        /// <summary>
        /// Gets the <see cref="NodaFormatInfo" /> object for the current thread.
        /// </summary>
        public static NodaFormatInfo CurrentInfo => GetInstance(CultureInfo.CurrentCulture);

        /// <summary>
        /// Gets the <see cref="Offset" /> "l" pattern.
        /// </summary>
        public string OffsetPatternLong => PatternResources.ResourceManager.GetString("OffsetPatternLong", CultureInfo)!;

        /// <summary>
        /// Gets the <see cref="Offset" /> "m" pattern.
        /// </summary>
        public string OffsetPatternMedium => PatternResources.ResourceManager.GetString("OffsetPatternMedium", CultureInfo)!;

        /// <summary>
        /// Gets the <see cref="Offset" /> "s" pattern.
        /// </summary>
        public string OffsetPatternShort => PatternResources.ResourceManager.GetString("OffsetPatternShort", CultureInfo)!;

        /// <summary>
        /// Gets the <see cref="Offset" /> "L" pattern.
        /// </summary>
        public string OffsetPatternLongNoPunctuation => PatternResources.ResourceManager.GetString("OffsetPatternLongNoPunctuation", CultureInfo)!;

        /// <summary>
        /// Gets the <see cref="Offset" /> "M" pattern.
        /// </summary>
        public string OffsetPatternMediumNoPunctuation => PatternResources.ResourceManager.GetString("OffsetPatternMediumNoPunctuation", CultureInfo)!;

        /// <summary>
        /// Gets the <see cref="Offset" /> "S" pattern.
        /// </summary>
        public string OffsetPatternShortNoPunctuation => PatternResources.ResourceManager.GetString("OffsetPatternShortNoPunctuation", CultureInfo)!;

        /// <summary>
        /// Clears the cache. Only used for test purposes.
        /// </summary>
        internal static void ClearCache() => Cache.Clear();

        /// <summary>
        /// Gets the <see cref="NodaFormatInfo" /> for the given <see cref="CultureInfo" />.
        /// </summary>
        /// <remarks>
        /// This method maintains a cache of results for read-only cultures.
        /// </remarks>
        /// <param name="cultureInfo">The culture info.</param>
        /// <returns>The <see cref="NodaFormatInfo" />. Will never be null.</returns>
        internal static NodaFormatInfo GetFormatInfo(CultureInfo cultureInfo)
        {
            Preconditions.CheckNotNull(cultureInfo, nameof(cultureInfo));
            if (cultureInfo == CultureInfo.InvariantCulture)
            {
                return InvariantInfo;
            }
            // Never cache (or consult the cache) for non-read-only cultures.
            // We don't initialize eagerly in this case, to preserve previous behavior -
            // and as we expect such instances to be reused relatively rarely.
            if (!cultureInfo.IsReadOnly)
            {
                return new NodaFormatInfo(cultureInfo, initializeEagerly: false);
            }
            return Cache.GetOrAdd(cultureInfo);
        }

        /// <summary>
        /// Gets the <see cref="NodaFormatInfo" /> for the given <see cref="IFormatProvider" />. If the
        /// format provider is null then the format object for the current thread is returned. If it's
        /// a CultureInfo, that's used for everything. If it's a DateTimeFormatInfo, that's used for
        /// format strings, day names etc but the invariant culture is used for text comparisons and
        /// resource lookups. Otherwise, <see cref="ArgumentException"/> is thrown.
        /// </summary>
        /// <param name="provider">The <see cref="IFormatProvider" />.</param>
        /// <exception cref="ArgumentException">The format provider cannot be used for Noda Time.</exception>
        /// <returns>The <see cref="NodaFormatInfo" />. Will never be null.</returns>
        public static NodaFormatInfo GetInstance(IFormatProvider? provider) => provider switch
        {
            null => GetFormatInfo(CurrentInfo.CultureInfo),
            CultureInfo cultureInfo => GetFormatInfo(cultureInfo),
            // Note: no caching for this case. It's a corner case anyway... we could add a cache later
            // if users notice a problem.
            DateTimeFormatInfo dateTimeFormatInfo => new NodaFormatInfo(CultureInfo.InvariantCulture, dateTimeFormatInfo, initializeEagerly: false),
            _ => throw new ArgumentException($"Cannot use provider of type {provider.GetType().FullName} in Noda Time", nameof(provider))
        };

        /// <summary>
        /// Returns a <see cref="System.String" /> that represents this instance.
        /// </summary>
        public override string ToString() => $"NodaFormatInfo[{CultureInfo.Name}]";

        /// <summary>
        /// The description for an era: the primary name and all possible names.
        /// </summary>
        private class EraDescription
        {
            internal string PrimaryName { get; }
            internal ReadOnlyCollection<string> AllNames { get; }

            private EraDescription(string primaryName, ReadOnlyCollection<string> allNames)
            {
                this.PrimaryName = primaryName;
                this.AllNames = allNames;
            }

            internal static EraDescription ForEra(Era era, CultureInfo cultureInfo)
            {
                string pipeDelimited = PatternResources.ResourceManager.GetString(era.ResourceIdentifier, cultureInfo)!;
                string primaryName;
                string[] allNames;
                if (pipeDelimited is null)
                {
                    allNames = Array.Empty<string>();
                    primaryName = "";
                }
                else
                {
                    // If the BCL has provided an era name other than the one we'd consider to be the primary one, make *that*
                    // the primary one for formatting.
                    // TODO: Achieve the same result without the string allocations.
                    string? eraNameFromCulture = GetEraNameFromBcl(era, cultureInfo);
                    if (eraNameFromCulture != null && !pipeDelimited.StartsWith(eraNameFromCulture + "|", StringComparison.Ordinal))
                    {
                        pipeDelimited = $"{eraNameFromCulture}|{pipeDelimited}";
                    }
                    allNames = pipeDelimited.Split('|');
                    primaryName = allNames[0];
                    // Order by length, descending to avoid early out (e.g. parsing BCE as BC and then having a spare E)
                    Array.Sort(allNames, (x, y) => y.Length.CompareTo(x.Length));
                }
                return new EraDescription(primaryName, new ReadOnlyCollection<string>(allNames));
            }

            /// <summary>
            /// Returns the name of the era within a culture according to the BCL, if this is known and we're confident that
            /// it's correct. (The selection here seems small, but it covers most cases.) This isn't ideal, but it's better
            /// than nothing, and fixes an issue where non-English BCL cultures have "gg" in their patterns.
            /// </summary>
            private static string? GetEraNameFromBcl(Era era, CultureInfo culture)
            {
                var calendar = culture.DateTimeFormat.Calendar;
                bool getEraFromCalendar =
                    (era == Era.Common && calendar is GregorianCalendar) ||
                    (era == Era.AnnoPersico && calendar is PersianCalendar) ||
                    (era == Era.AnnoHegirae && (calendar is HijriCalendar || calendar is UmAlQuraCalendar));
                return getEraFromCalendar ? culture.DateTimeFormat.GetEraName(1) : null;
            }
        }
    }
}
