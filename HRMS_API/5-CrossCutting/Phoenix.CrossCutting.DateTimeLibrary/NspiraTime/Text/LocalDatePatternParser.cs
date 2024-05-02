// Copyright 2011 The Noda Time Authors. All rights reserved.
// Use of this source code is governed by the Apache License 2.0,
// as found in the LICENSE.txt file.

using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Calendars;
using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Globalization;
using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Text.Patterns;
using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Utility;

namespace Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Text
{
    /// <summary>
    /// Parser for patterns of <see cref="LocalDate"/> values.
    /// </summary>
    internal sealed class LocalDatePatternParser : IPatternParser<LocalDate>
    {
        private readonly LocalDate templateValue;
        private readonly int twoDigitYearMax;

        private static readonly Dictionary<char, CharacterHandler<LocalDate, LocalDateParseBucket>> PatternCharacterHandlers =
            new Dictionary<char, CharacterHandler<LocalDate, LocalDateParseBucket>>
        {
            { '%', SteppedPatternBuilder<LocalDate, LocalDateParseBucket>.HandlePercent },
            { '\'', SteppedPatternBuilder<LocalDate, LocalDateParseBucket>.HandleQuote },
            { '\"', SteppedPatternBuilder<LocalDate, LocalDateParseBucket>.HandleQuote },
            { '\\', SteppedPatternBuilder<LocalDate, LocalDateParseBucket>.HandleBackslash },
            { '/', (pattern, builder) => builder.AddLiteral(builder.FormatInfo.DateSeparator, ParseResult<LocalDate>.DateSeparatorMismatch) },
            { 'y', DatePatternHelper.CreateYearOfEraHandler<LocalDate, LocalDateParseBucket>(value => value.YearOfEra, (bucket, value) => bucket.YearOfEra = value) },
            { 'u', SteppedPatternBuilder<LocalDate, LocalDateParseBucket>.HandlePaddedField
                       (4, PatternFields.Year, -9999, 9999, value => value.Year, (bucket, value) => bucket.Year = value) },
            { 'M', DatePatternHelper.CreateMonthOfYearHandler<LocalDate, LocalDateParseBucket>
                        (value => value.Month, (bucket, value) => bucket.MonthOfYearText = value, (bucket, value) => bucket.MonthOfYearNumeric = value) },
            { 'd', DatePatternHelper.CreateDayHandler<LocalDate, LocalDateParseBucket>
                        (value => value.Day, value => (int) value.DayOfWeek, (bucket, value) => bucket.DayOfMonth = value, (bucket, value) => bucket.DayOfWeek = value) },
            { 'c', DatePatternHelper.CreateCalendarHandler<LocalDate, LocalDateParseBucket>(value => value.Calendar, (bucket, value) => bucket.Calendar = value) },
            { 'g', DatePatternHelper.CreateEraHandler<LocalDate, LocalDateParseBucket>(date => date.Era, bucket => bucket) },
        };

        internal LocalDatePatternParser(LocalDate templateValue, int twoDigitYearMax)
        {
            Preconditions.CheckArgumentRange(nameof(twoDigitYearMax), twoDigitYearMax, 0, 99);
            this.templateValue = templateValue;
            this.twoDigitYearMax = twoDigitYearMax;
        }

        // Note: public to implement the interface. It does no harm, and it's simpler than using explicit
        // interface implementation.
        public IPattern<LocalDate> ParsePattern(string patternText, NodaFormatInfo formatInfo)
        {
            // Nullity check is performed in LocalDatePattern.
            if (patternText.Length == 0)
            {
                throw new InvalidPatternException(TextErrorMessages.FormatStringEmpty);
            }

            if (patternText.Length == 1)
            {
                return patternText[0] switch
                {
                    // Invariant standard patterns return cached implementations.
                    'R' => LocalDatePattern.Patterns.IsoPatternImpl,
                    'r' => LocalDatePattern.Patterns.FullRoundtripPatternImpl,
                    // Other standard patterns expand the pattern text to the appropriate custom pattern.
                    // Note: we don't just recurse, as otherwise a ShortDatePattern of 'd' (for example) would cause a stack overflow.
                    'd' => ParseNoStandardExpansion(formatInfo.DateTimeFormat.ShortDatePattern),
                    'D' => ParseNoStandardExpansion(formatInfo.DateTimeFormat.LongDatePattern),
                    'M' => ParseNoStandardExpansion(formatInfo.DateTimeFormat.MonthDayPattern),
                    // Unknown standard patterns fail.
                    _ => throw new InvalidPatternException(TextErrorMessages.UnknownStandardFormat, patternText, typeof(LocalDate))
                };
            }
            return ParseNoStandardExpansion(patternText);

            IPattern<LocalDate> ParseNoStandardExpansion(string patternTextLocal)
            {
                var patternBuilder = new SteppedPatternBuilder<LocalDate, LocalDateParseBucket>(formatInfo,
                    () => new LocalDateParseBucket(templateValue, twoDigitYearMax));
                patternBuilder.ParseCustomPattern(patternTextLocal, PatternCharacterHandlers);
                patternBuilder.ValidateUsedFields();
                return patternBuilder.Build(templateValue);
            }
        }

        /// <summary>
        /// Bucket to put parsed values in, ready for later result calculation. This type is also used
        /// by LocalDateTimePattern to store and calculate values.
        /// </summary>
        internal sealed class LocalDateParseBucket : ParseBucket<LocalDate>
        {
            internal readonly LocalDate TemplateValue;
            internal int TwoDigitYearMax;

            internal CalendarSystem Calendar;
            internal int Year;
            private Era? Era;
            internal int YearOfEra;
            internal int MonthOfYearNumeric;
            internal int MonthOfYearText;
            internal int DayOfMonth;
            internal int DayOfWeek;

            internal LocalDateParseBucket(LocalDate templateValue, int twoDigitYearMax)
            {
                this.TemplateValue = templateValue;
                // Only fetch this once.
                this.Calendar = templateValue.Calendar;
                this.TwoDigitYearMax = twoDigitYearMax;
            }

            internal ParseResult<TResult>? ParseEra<TResult>(NodaFormatInfo formatInfo, ValueCursor cursor)
            {
                var compareInfo = formatInfo.CompareInfo;
                foreach (var era in Calendar.Eras)
                {
                    foreach (string eraName in formatInfo.GetEraNames(era))
                    {
                        if (cursor.MatchCaseInsensitive(eraName, compareInfo, true))
                        {
                            Era = era;
                            return null;
                        }
                    }
                }
                return ParseResult<TResult>.MismatchedText(cursor, 'g');
            }

            internal override ParseResult<LocalDate> CalculateValue(PatternFields usedFields, string text) =>
                CalculateValue(usedFields, text, typeof(LocalDate));

            internal ParseResult<LocalDate> CalculateValue(PatternFields usedFields, string text, Type eventualResultType)
            {
                // Optimization for very, very common case.
                if (usedFields == (PatternFields.Year | PatternFields.MonthOfYearNumeric | PatternFields.DayOfMonth) &&
                    Calendar == CalendarSystem.Iso)
                {
                    return CalculateSimpleIsoValue(text);
                }

                if (usedFields.HasAny(PatternFields.EmbeddedDate))
                {
                    return ParseResult<LocalDate>.ForValue(new LocalDate(Year, MonthOfYearNumeric, DayOfMonth, Calendar));
                }
                // This will set Year if necessary
                ParseResult<LocalDate>? failure = DetermineYear(usedFields, text, eventualResultType);
                if (failure != null)
                {
                    return failure;
                }
                // This will set MonthOfYearNumeric if necessary
                failure = DetermineMonth(usedFields, text);
                if (failure != null)
                {
                    return failure;
                }

                int day = usedFields.HasAny(PatternFields.DayOfMonth) ? DayOfMonth : TemplateValue.Day;
                if (day > Calendar.GetDaysInMonth(Year, MonthOfYearNumeric))
                {
                    return ParseResult<LocalDate>.DayOfMonthOutOfRange(text, day, MonthOfYearNumeric, Year);
                }

                // Avoid further revalidation.
                LocalDate value = new LocalDate(new YearMonthDayCalendar(Year, MonthOfYearNumeric, day, Calendar.Ordinal));

                if (usedFields.HasAny(PatternFields.DayOfWeek) && DayOfWeek != (int) value.DayOfWeek)
                {
                    return ParseResult<LocalDate>.InconsistentDayOfWeekTextValue(text);
                }

                return ParseResult<LocalDate>.ForValue(value);
            }

            /// <summary>
            /// Optimized computation for a pattern with an ISO calendar template value,
            /// and year/month/day fields.
            /// </summary>
            private ParseResult<LocalDate> CalculateSimpleIsoValue(string text)
            {
                int day = DayOfMonth;
                int month = MonthOfYearNumeric;
                // Note: year is always valid, as it's already validated to be in the range -9999 to 9999.

                if (month > 12)
                {
                    return ParseResult<LocalDate>.MonthOutOfRange(text, MonthOfYearNumeric, Year);
                }
                // If we've been asked for day 1-28, we're definitely okay regardless of month.
                // If it's 29-31, we need to check.
                // If it's over 31, it's definitely wrong.
                if (day > 31 || (day > 28 && day > Calendar.GetDaysInMonth(Year, MonthOfYearNumeric)))
                {
                    return ParseResult<LocalDate>.DayOfMonthOutOfRange(text, day, MonthOfYearNumeric, Year);
                }

                var value = new LocalDate(new YearMonthDayCalendar(Year, month, day, CalendarOrdinal.Iso));
                return ParseResult<LocalDate>.ForValue(value);
            }

            /// <summary>
            /// Work out the year, based on fields of:
            /// - Year
            /// - YearOfEra
            /// - YearTwoDigits (implies YearOfEra)
            /// - Era
            /// 
            /// If the year is specified, that trumps everything else - any other fields
            /// are just used for checking.
            /// 
            /// If nothing is specified, the year of the template value is used.
            /// 
            /// If just the era is specified, the year of the template value is used,
            /// and the specified era is checked against it. (Hopefully no-one will
            /// expect to get useful information from a format string with era but no year...)
            /// 
            /// Otherwise, we have the year of era (possibly only two digits) and possibly the
            /// era. If the era isn't specified, take it from the template value.
            /// Finally, if we only have two digits, then use either the century of the template
            /// value or the previous century if the year-of-era is greater than TwoDigitYearMax...
            /// and if the template value isn't in the first century already.
            /// 
            /// Phew.
            /// </summary>
            private ParseResult<LocalDate>? DetermineYear(PatternFields usedFields, string text, Type eventualResultType)
            {
                if (usedFields.HasAny(PatternFields.Year))
                {
                    if (Year > Calendar.MaxYear || Year < Calendar.MinYear)
                    {
                        return ParseResult<LocalDate>.FieldValueOutOfRangePostParse(text, Year, 'u', eventualResultType);
                    }

                    if (usedFields.HasAny(PatternFields.Era) && Era != Calendar.GetEra(Year))
                    {
                        return ParseResult<LocalDate>.InconsistentValues(text, 'g', 'u', eventualResultType);
                    }

                    if (usedFields.HasAny(PatternFields.YearOfEra))
                    {
                        int yearOfEraFromYear = Calendar.GetYearOfEra(Year);
                        if (usedFields.HasAny(PatternFields.YearTwoDigits))
                        {
                            // We're only checking the last two digits
                            yearOfEraFromYear = yearOfEraFromYear % 100;
                        }
                        if (yearOfEraFromYear != YearOfEra)
                        {
                            return ParseResult<LocalDate>.InconsistentValues(text, 'y', 'u', eventualResultType);
                        }
                    }
                    return null;
                }

                // Use the year from the template value, possibly checking the era.
                if (!usedFields.HasAny(PatternFields.YearOfEra))
                {
                    Year = TemplateValue.Year;
                    return usedFields.HasAny(PatternFields.Era) && Era != Calendar.GetEra(Year)
                        ? ParseResult<LocalDate>.InconsistentValues(text, 'g', 'u', eventualResultType) : null;
                }

                if (!usedFields.HasAny(PatternFields.Era))
                {
                    Era = TemplateValue.Era;
                }

                // After this point, Era is definitely non-null.

                if (usedFields.HasAny(PatternFields.YearTwoDigits))
                {
                    int century = TemplateValue.YearOfEra / 100;
                    if (YearOfEra > TwoDigitYearMax && century > 1)
                    {
                        century--;
                    }
                    YearOfEra += century * 100;
                }

                if (YearOfEra < Calendar.GetMinYearOfEra(Era!) ||
                    YearOfEra > Calendar.GetMaxYearOfEra(Era!))
                {
                    return ParseResult<LocalDate>.YearOfEraOutOfRange(text, YearOfEra, Era!, Calendar);
                }
                Year = Calendar.GetAbsoluteYear(YearOfEra, Era!);
                return null;
            }

            private ParseResult<LocalDate>? DetermineMonth(PatternFields usedFields, string text)
            {
                switch (usedFields & (PatternFields.MonthOfYearNumeric | PatternFields.MonthOfYearText))
                {
                    case PatternFields.MonthOfYearNumeric:
                        // No-op
                        break;
                    case PatternFields.MonthOfYearText:
                        MonthOfYearNumeric = MonthOfYearText;
                        break;
                    case PatternFields.MonthOfYearNumeric | PatternFields.MonthOfYearText:
                        if (MonthOfYearNumeric != MonthOfYearText)
                        {
                            return ParseResult<LocalDate>.InconsistentMonthValues(text);
                        }
                        // No need to change MonthOfYearNumeric - this was just a check
                        break;
                    case 0:
                        MonthOfYearNumeric = TemplateValue.Month;
                        break;
                }
                if (MonthOfYearNumeric > Calendar.GetMonthsInYear(Year))
                {
                    return ParseResult<LocalDate>.MonthOutOfRange(text, MonthOfYearNumeric, Year);
                }
                return null;
            }
        }
    }
}
