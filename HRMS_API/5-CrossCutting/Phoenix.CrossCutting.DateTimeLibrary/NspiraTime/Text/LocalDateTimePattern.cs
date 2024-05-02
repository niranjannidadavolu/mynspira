// Copyright 2011 The Noda Time Authors. All rights reserved.
// Use of this source code is governed by the Apache License 2.0,
// as found in the LICENSE.txt file.

using System.Globalization;
using System.Text;
using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Annotations;
using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Globalization;
using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Text.Patterns;
using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Utility;

namespace Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Text
{
    /// <summary>
    /// Represents a pattern for parsing and formatting <see cref="LocalDateTime"/> values.
    /// </summary>
    /// <threadsafety>
    /// When used with a read-only <see cref="CultureInfo" />, this type is immutable and instances
    /// may be shared freely between threads. We recommend only using read-only cultures for patterns, although this is
    /// not currently enforced.
    /// </threadsafety>
    [Immutable] // Well, assuming an immutable culture...
    public sealed class LocalDateTimePattern : IPattern<LocalDateTime>
    {
        internal static readonly LocalDateTime DefaultTemplateValue = new LocalDateTime(2000, 1, 1, 0, 0);

        private const string DefaultFormatPattern = "G"; // General (long time)

        internal static readonly PatternBclSupport<LocalDateTime> BclSupport =
            new PatternBclSupport<LocalDateTime>(DefaultFormatPattern, fi => fi.LocalDateTimePatternParser);

        /// <summary>
        /// Gets an invariant local date/time pattern which is ISO-8601 compatible, down to the second.
        /// This corresponds to the text pattern "uuuu'-'MM'-'dd'T'HH':'mm':'ss".
        /// </summary>
        /// <remarks>
        /// This pattern corresponds to the 's' standard pattern ("shorter sortable").
        /// </remarks>
        /// <value>An invariant local date/time pattern which is ISO-8601 compatible, down to the second.</value>
        public static LocalDateTimePattern GeneralIso => Patterns.GeneralIsoPatternImpl;

        /// <summary>
        /// Gets an invariant local date/time pattern which is ISO-8601 compatible, providing up to 9 decimal places
        /// of sub-second accuracy. (These digits are omitted when unnecessary.)
        /// This corresponds to the text pattern "uuuu'-'MM'-'dd'T'HH':'mm':'ss;FFFFFFFFF".
        /// </summary>
        /// <remarks>
        /// This pattern corresponds to the 'S' standard pattern ("longer sortable").
        /// </remarks>
        /// <value>An invariant local date/time pattern which is ISO-8601 compatible, providing up to 9 decimal places
        /// of sub-second accuracy.</value>
        public static LocalDateTimePattern ExtendedIso => Patterns.ExtendedIsoPatternImpl;

        /// <summary>
        /// Gets an invariant local date/time pattern which is ISO-8601 compatible, providing up to 7 decimal places
        /// of sub-second accuracy which are always present (including trailing zeroes). This is compatible with the
        /// BCL round-trip formatting of <see cref="DateTime"/> values with a kind of "unspecified".
        /// This corresponds to the text pattern "uuuu'-'MM'-'dd'T'HH':'mm':'ss'.'fffffff". It does not necessarily
        /// round-trip all <c>LocalDateTime</c> values as it will lose sub-tick information. Use
        /// <see cref="FullRoundtripWithoutCalendar"/> for full precision.
        /// </summary>
        /// <remarks>
        /// This pattern corresponds to the 'o' and 'O' standard patterns.
        /// </remarks>
        /// <value>An invariant local date/time pattern which is ISO-8601 compatible, providing up to 7 decimal places
        /// of sub-second accuracy which are always present (including trailing zeroes).</value>
        public static LocalDateTimePattern BclRoundtrip => Patterns.BclRoundtripPatternImpl;

        /// <summary>
        /// Gets an invariant local date/time pattern which round trips values, but doesn't include the calendar system.
        /// It provides up to 9 decimal places of sub-second accuracy which are always present (including trailing zeroes).
        /// This corresponds to the text pattern "uuuu'-'MM'-'dd'T'HH':'mm':'ss'.'fffffffff". It will
        /// round-trip all <see cref="LocalDateTime"/> values if the calendar system of the template value is the same
        /// as the calendar system of the original value.
        /// </summary>
        /// <remarks>
        /// This pattern corresponds to the 'r' standard pattern.
        /// </remarks>
        /// <value>An invariant local date/time pattern which is ISO-8601 compatible, providing up to 7 decimal places
        /// of sub-second accuracy which are always present (including trailing zeroes).</value>
        public static LocalDateTimePattern FullRoundtripWithoutCalendar => Patterns.FullRoundtripWithoutCalendarImpl;

        /// <summary>
        /// Gets an invariant local date/time pattern which round trips values including the calendar system.
        /// This corresponds to the text pattern "uuuu'-'MM'-'dd'T'HH':'mm':'ss'.'fffffffff '('c')'".
        /// </summary>
        /// <remarks>
        /// This pattern corresponds to the 'R' standard pattern.
        /// </remarks>
        /// <value>An invariant local date/time pattern which round trips values including the calendar system.</value>
        public static LocalDateTimePattern FullRoundtrip => Patterns.FullRoundtripPatternImpl;

        /// <summary>
        /// Gets an invariant local date/time pattern which is ISO-8601 compatible, with precision of just minutes.
        /// This corresponds to the text pattern "uuuu'-'MM'-'dd'T'HH':'mm".
        /// </summary>
        /// <value>An invariant local time pattern which is ISO-8601 compatible, with no sub-minute precision.</value>
        public static LocalDateTimePattern DateHourMinuteIso => Patterns.DateHourMinuteIsoPatternImpl;

        /// <summary>
        /// Gets an invariant local date/time pattern which is ISO-8601 compatible, with a precision of just hours.
        /// This corresponds to the text pattern "uuuu'-'MM'-'dd'T'HH".
        /// </summary>
        /// <value>An invariant local time pattern which is ISO-8601 compatible, with no sub-hour precision.</value>
        public static LocalDateTimePattern DateHourIso => Patterns.DateHourIsoPatternImpl;

        /// <summary>
        /// Gets an invariant local date/time pattern which can parse any ISO-8601 compatible value with a calendar date
        /// (in extended format, that is, with separators), regardless of precision in the time part.
        /// Valid values for time include "just hours", "hours and minutes", "hours, minutes and seconds",
        /// and values with fractions of seconds (as far as nanoseconds). The time part must be present, however; this pattern
        /// will not parse date-only values. (It will also not parse ordinal dates or week dates, as described in ISO-8601.)
        /// </summary>
        /// <remarks>
        /// This is expressed as an <see cref="IPattern{LocalDateTime}"/> rather than a <see cref="LocalDateTimePattern"/>,
        /// as it has no single pattern text.
        /// </remarks>
        /// <value>An invariant local date/time pattern which is ISO-8601 compatible for all time precisions.</value>
        public static IPattern<LocalDateTime> VariablePrecisionIso => Patterns.VariablePrecisionIsoPatternImpl;

        /// <summary>
        /// Class whose existence is solely to avoid type initialization order issues, most of which stem
        /// from needing NodaFormatInfo.InvariantInfo...
        /// </summary>
        internal static class Patterns
        {
            internal static readonly LocalDateTimePattern GeneralIsoPatternImpl = CreateWithInvariantCulture("uuuu'-'MM'-'dd'T'HH':'mm':'ss");
            internal static readonly LocalDateTimePattern ExtendedIsoPatternImpl = CreateWithInvariantCulture("uuuu'-'MM'-'dd'T'HH':'mm':'ss;FFFFFFFFF");
            internal static readonly LocalDateTimePattern BclRoundtripPatternImpl = CreateWithInvariantCulture("uuuu'-'MM'-'dd'T'HH':'mm':'ss'.'fffffff");
            internal static readonly LocalDateTimePattern FullRoundtripWithoutCalendarImpl = CreateWithInvariantCulture("uuuu'-'MM'-'dd'T'HH':'mm':'ss'.'fffffffff");
            internal static readonly LocalDateTimePattern FullRoundtripPatternImpl = CreateWithInvariantCulture("uuuu'-'MM'-'dd'T'HH':'mm':'ss'.'fffffffff '('c')'");
            internal static readonly LocalDateTimePattern DateHourIsoPatternImpl = CreateWithInvariantCulture("uuuu'-'MM'-'dd'T'HH");
            internal static readonly LocalDateTimePattern DateHourMinuteIsoPatternImpl = CreateWithInvariantCulture("uuuu'-'MM'-'dd'T'HH':'mm");
            internal static readonly IPattern<LocalDateTime> VariablePrecisionIsoPatternImpl = new CompositePatternBuilder<LocalDateTime>
            {
                { ExtendedIsoPatternImpl, time => true },
                { DateHourMinuteIsoPatternImpl, time => time.Second == 0 && time.NanosecondOfSecond == 0 },
                { DateHourIsoPatternImpl, time => time.Minute == 0 && time.Second == 0 && time.NanosecondOfSecond == 0 },
            }.Build();
        }

        /// <summary>
        /// Gets the pattern text for this pattern, as supplied on creation.
        /// </summary>
        /// <value>The pattern text for this pattern, as supplied on creation.</value>
        public string PatternText { get; }

        /// <summary>
        /// Gets the localization information used in this pattern.
        /// </summary>
        /// <value>The localization information used in this pattern.</value>
        private NodaFormatInfo FormatInfo { get; }

        /// <summary>
        /// Get the value used as a template for parsing: any field values unspecified
        /// in the pattern are taken from the template.
        /// </summary>
        /// <value>The value used as a template for parsing.</value>
        public LocalDateTime TemplateValue { get; }

        /// <summary>
        /// Maximum two-digit-year in the template to treat as the current century.
        /// If the value parsed is higher than this, the result is adjusted to the previous century.
        /// This value defaults to 30. To create a pattern with a different value, use <see cref="WithTwoDigitYearMax(int)"/>.
        /// </summary>
        /// <value>The value used for the maximum two-digit-year, in the range 0-99 inclusive.</value>
        public int TwoDigitYearMax { get; }

        /// <summary>
        /// Returns the pattern that this object delegates to. Mostly useful to avoid this public class
        /// implementing an internal interface.
        /// </summary>
        internal IPartialPattern<LocalDateTime> UnderlyingPattern { get; }

        private LocalDateTimePattern(string patternText, NodaFormatInfo formatInfo, LocalDateTime templateValue, int twoDigitYearMax,
            IPartialPattern<LocalDateTime> pattern)
        {
            PatternText = patternText;
            FormatInfo = formatInfo;
            UnderlyingPattern = pattern;
            TemplateValue = templateValue;
            TwoDigitYearMax = twoDigitYearMax;
        }

        /// <summary>
        /// Parses the given text value according to the rules of this pattern.
        /// </summary>
        /// <remarks>
        /// This method never throws an exception (barring a bug in Noda Time itself). Even errors such as
        /// the argument being null are wrapped in a parse result.
        /// </remarks>
        /// <param name="text">The text value to parse.</param>
        /// <returns>The result of parsing, which may be successful or unsuccessful.</returns>
        public ParseResult<LocalDateTime> Parse([SpecialNullHandling] string text) => UnderlyingPattern.Parse(text);

        /// <summary>
        /// Formats the given local date/time as text according to the rules of this pattern.
        /// </summary>
        /// <param name="value">The local date/time to format.</param>
        /// <returns>The local date/time formatted according to this pattern.</returns>
        public string Format(LocalDateTime value) => UnderlyingPattern.Format(value);

        /// <summary>
        /// Formats the given value as text according to the rules of this pattern,
        /// appending to the given <see cref="StringBuilder"/>.
        /// </summary>
        /// <param name="value">The value to format.</param>
        /// <param name="builder">The <c>StringBuilder</c> to append to.</param>
        /// <returns>The builder passed in as <paramref name="builder"/>.</returns>
        public StringBuilder AppendFormat(LocalDateTime value, StringBuilder builder) => UnderlyingPattern.AppendFormat(value, builder);

        /// <summary>
        /// Creates a pattern for the given pattern text, format info, and template value.
        /// </summary>
        /// <param name="patternText">Pattern text to create the pattern for</param>
        /// <param name="formatInfo">The format info to use in the pattern</param>
        /// <param name="templateValue">Template value to use for unspecified fields</param>
        /// <param name="twoDigitYearMax">Maximum two-digit-year in the template to treat as the current century.</param>
        /// <returns>A pattern for parsing and formatting local date/times.</returns>
        /// <exception cref="InvalidPatternException">The pattern text was invalid.</exception>
        internal static LocalDateTimePattern Create(string patternText, NodaFormatInfo formatInfo,
            LocalDateTime templateValue, int twoDigitYearMax)
        {
            Preconditions.CheckNotNull(patternText, nameof(patternText));
            Preconditions.CheckNotNull(formatInfo, nameof(formatInfo));
            // Use the "fixed" parser for the common case of the default template value.
            var pattern = templateValue == DefaultTemplateValue && twoDigitYearMax == LocalDatePattern.DefaultTwoDigitYearMax
                ? formatInfo.LocalDateTimePatternParser.ParsePattern(patternText)
                : new LocalDateTimePatternParser(templateValue, twoDigitYearMax).ParsePattern(patternText, formatInfo);
            // If ParsePattern returns a standard pattern instance, we need to get the underlying partial pattern.
            pattern = (pattern as LocalDateTimePattern)?.UnderlyingPattern ?? pattern;
            var partialPattern = (IPartialPattern<LocalDateTime>) pattern;
            return new LocalDateTimePattern(patternText, formatInfo, templateValue, twoDigitYearMax, partialPattern);
        }

        /// <summary>
        /// Creates a pattern for the given pattern text, culture, and template value.
        /// </summary>
        /// <remarks>
        /// See the user guide for the available pattern text options.
        /// </remarks>
        /// <param name="patternText">Pattern text to create the pattern for</param>
        /// <param name="cultureInfo">The culture to use in the pattern</param>
        /// <param name="templateValue">Template value to use for unspecified fields</param>
        /// <returns>A pattern for parsing and formatting local date/times.</returns>
        /// <exception cref="InvalidPatternException">The pattern text was invalid.</exception>
        public static LocalDateTimePattern Create(string patternText, [ValidatedNotNull] CultureInfo cultureInfo,
            LocalDateTime templateValue) =>
            Create(patternText, NodaFormatInfo.GetFormatInfo(cultureInfo), templateValue, LocalDatePattern.DefaultTwoDigitYearMax);

        /// <summary>
        /// Creates a pattern for the given pattern text and culture, with a template value of midnight on 2000-01-01.
        /// </summary>
        /// <remarks>
        /// See the user guide for the available pattern text options.
        /// </remarks>
        /// <param name="patternText">Pattern text to create the pattern for</param>
        /// <param name="cultureInfo">The culture to use in the pattern</param>
        /// <returns>A pattern for parsing and formatting local date/times.</returns>
        /// <exception cref="InvalidPatternException">The pattern text was invalid.</exception>
        public static LocalDateTimePattern Create(string patternText, CultureInfo cultureInfo) =>
            Create(patternText, cultureInfo, DefaultTemplateValue);

        /// <summary>
        /// Creates a pattern for the given pattern text in the current thread's current culture.
        /// </summary>
        /// <remarks>
        /// See the user guide for the available pattern text options. Note that the current culture
        /// is captured at the time this method is called - it is not captured at the point of parsing
        /// or formatting values.
        /// </remarks>
        /// <param name="patternText">Pattern text to create the pattern for</param>
        /// <returns>A pattern for parsing and formatting local date/times.</returns>
        /// <exception cref="InvalidPatternException">The pattern text was invalid.</exception>
        public static LocalDateTimePattern CreateWithCurrentCulture(string patternText) =>
            Create(patternText, NodaFormatInfo.CurrentInfo, DefaultTemplateValue, LocalDatePattern.DefaultTwoDigitYearMax);

        /// <summary>
        /// Creates a pattern for the given pattern text in the invariant culture.
        /// </summary>
        /// <remarks>
        /// See the user guide for the available pattern text options.
        /// </remarks>
        /// <param name="patternText">Pattern text to create the pattern for</param>
        /// <returns>A pattern for parsing and formatting local date/times.</returns>
        /// <exception cref="InvalidPatternException">The pattern text was invalid.</exception>
        public static LocalDateTimePattern CreateWithInvariantCulture(string patternText) =>
            Create(patternText, NodaFormatInfo.InvariantInfo, DefaultTemplateValue, LocalDatePattern.DefaultTwoDigitYearMax);

        /// <summary>
        /// Creates a pattern for the same original pattern text as this pattern, but with the specified
        /// localization information.
        /// </summary>
        /// <param name="formatInfo">The localization information to use in the new pattern.</param>
        /// <returns>A new pattern with the given localization information.</returns>
        private LocalDateTimePattern WithFormatInfo(NodaFormatInfo formatInfo) =>
            Create(PatternText, formatInfo, TemplateValue, TwoDigitYearMax);

        /// <summary>
        /// Creates a pattern for the same original pattern text as this pattern, but with the specified
        /// culture.
        /// </summary>
        /// <param name="cultureInfo">The culture to use in the new pattern.</param>
        /// <returns>A new pattern with the given culture.</returns>
        public LocalDateTimePattern WithCulture([ValidatedNotNull] CultureInfo cultureInfo) =>
            WithFormatInfo(NodaFormatInfo.GetFormatInfo(cultureInfo));

        /// <summary>
        /// Creates a pattern like this one, but with the specified template value.
        /// </summary>
        /// <param name="newTemplateValue">The template value for the new pattern, used to fill in unspecified fields.</param>
        /// <returns>A new pattern with the given template value.</returns>
        public LocalDateTimePattern WithTemplateValue(LocalDateTime newTemplateValue) =>
            Create(PatternText, FormatInfo, newTemplateValue, TwoDigitYearMax);

        /// <summary>
        /// Creates a pattern like this one, but with the template value modified to use
        /// the specified calendar system.
        /// </summary>
        /// <remarks>
        /// <para>
        /// Care should be taken in two (relatively rare) scenarios. Although the default template value
        /// is supported by all Noda Time calendar systems, if a pattern is created with a different
        /// template value and then this method is called with a calendar system which doesn't support that
        /// date, an exception will be thrown. Additionally, if the pattern only specifies some date fields,
        /// it's possible that the new template value will not be suitable for all values.
        /// </para>
        /// </remarks>
        /// <param name="calendar">The calendar system to convert the template value into.</param>
        /// <returns>A new pattern with a template value in the specified calendar system.</returns>
        public LocalDateTimePattern WithCalendar(CalendarSystem calendar) =>
            WithTemplateValue(TemplateValue.WithCalendar(calendar));

        /// <summary>
        /// Creates a pattern like this one, but with a different <see cref="TwoDigitYearMax"/> value.
        /// </summary>
        /// <param name="twoDigitYearMax">The value to use for <see cref="TwoDigitYearMax"/> in the new pattern, in the range 0-99 inclusive.</param>
        /// <returns>A new pattern with the specified maximum two-digit-year.</returns>
        public LocalDateTimePattern WithTwoDigitYearMax(int twoDigitYearMax) =>
            Create(PatternText, FormatInfo, TemplateValue, twoDigitYearMax);
    }
}
