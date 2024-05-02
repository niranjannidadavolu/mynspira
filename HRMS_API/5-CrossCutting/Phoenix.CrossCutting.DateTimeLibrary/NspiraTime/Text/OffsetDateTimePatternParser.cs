// Copyright 2013 The Noda Time Authors. All rights reserved.
// Use of this source code is governed by the Apache License 2.0,
// as found in the LICENSE.txt file.

using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Globalization;
using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Text.Patterns;
using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Utility;

namespace Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Text
{
    internal sealed class OffsetDateTimePatternParser : IPatternParser<OffsetDateTime>
    {
        private readonly OffsetDateTime templateValue;
        private readonly int twoDigitYearMax;

        private static readonly Dictionary<char, CharacterHandler<OffsetDateTime, OffsetDateTimeParseBucket>> PatternCharacterHandlers =
            new Dictionary<char, CharacterHandler<OffsetDateTime, OffsetDateTimeParseBucket>>
        {
            { '%', SteppedPatternBuilder<OffsetDateTime, OffsetDateTimeParseBucket>.HandlePercent },
            { '\'', SteppedPatternBuilder<OffsetDateTime, OffsetDateTimeParseBucket>.HandleQuote },
            { '\"', SteppedPatternBuilder<OffsetDateTime, OffsetDateTimeParseBucket>.HandleQuote },
            { '\\', SteppedPatternBuilder<OffsetDateTime, OffsetDateTimeParseBucket>.HandleBackslash },
            { '/', (pattern, builder) => builder.AddLiteral(builder.FormatInfo.DateSeparator, ParseResult<OffsetDateTime>.DateSeparatorMismatch) },
            { 'T', (pattern, builder) => builder.AddLiteral('T', ParseResult<OffsetDateTime>.MismatchedCharacter) },
            { 'y', DatePatternHelper.CreateYearOfEraHandler<OffsetDateTime, OffsetDateTimeParseBucket>(value => value.YearOfEra, (bucket, value) => bucket.Date.YearOfEra = value) },
            { 'u', SteppedPatternBuilder<OffsetDateTime, OffsetDateTimeParseBucket>.HandlePaddedField
                       (4, PatternFields.Year, -9999, 9999, value => value.Year, (bucket, value) => bucket.Date.Year = value) },
            { 'M', DatePatternHelper.CreateMonthOfYearHandler<OffsetDateTime, OffsetDateTimeParseBucket>
                        (value => value.Month, (bucket, value) => bucket.Date.MonthOfYearText = value, (bucket, value) => bucket.Date.MonthOfYearNumeric = value) },
            { 'd', DatePatternHelper.CreateDayHandler<OffsetDateTime, OffsetDateTimeParseBucket>
                        (value => value.Day, value => (int) value.DayOfWeek, (bucket, value) => bucket.Date.DayOfMonth = value, (bucket, value) => bucket.Date.DayOfWeek = value) },
            { '.', TimePatternHelper.CreatePeriodHandler<OffsetDateTime, OffsetDateTimeParseBucket>(9, value => value.NanosecondOfSecond, (bucket, value) => bucket.Time.FractionalSeconds = value) },
            { ';', TimePatternHelper.CreateCommaDotHandler<OffsetDateTime, OffsetDateTimeParseBucket>(9, value => value.NanosecondOfSecond, (bucket, value) => bucket.Time.FractionalSeconds = value) },
            { ':', (pattern, builder) => builder.AddLiteral(builder.FormatInfo.TimeSeparator, ParseResult<OffsetDateTime>.TimeSeparatorMismatch) },
            { 'h', SteppedPatternBuilder<OffsetDateTime, OffsetDateTimeParseBucket>.HandlePaddedField
                       (2, PatternFields.Hours12, 1, 12, value => value.ClockHourOfHalfDay, (bucket, value) => bucket.Time.Hours12 = value) },
            { 'H', SteppedPatternBuilder<OffsetDateTime, OffsetDateTimeParseBucket>.HandlePaddedField
                       (2, PatternFields.Hours24, 0, 24, value => value.Hour, (bucket, value) => bucket.Time.Hours24 = value) },
            { 'm', SteppedPatternBuilder<OffsetDateTime, OffsetDateTimeParseBucket>.HandlePaddedField
                       (2, PatternFields.Minutes, 0, 59, value => value.Minute, (bucket, value) => bucket.Time.Minutes = value) },
            { 's', SteppedPatternBuilder<OffsetDateTime, OffsetDateTimeParseBucket>.HandlePaddedField
                       (2, PatternFields.Seconds, 0, 59, value => value.Second, (bucket, value) => bucket.Time.Seconds = value) },
            { 'f', TimePatternHelper.CreateFractionHandler<OffsetDateTime, OffsetDateTimeParseBucket>(9, value => value.NanosecondOfSecond, (bucket, value) => bucket.Time.FractionalSeconds = value) },
            { 'F', TimePatternHelper.CreateFractionHandler<OffsetDateTime, OffsetDateTimeParseBucket>(9, value => value.NanosecondOfSecond, (bucket, value) => bucket.Time.FractionalSeconds = value) },
            { 't', TimePatternHelper.CreateAmPmHandler<OffsetDateTime, OffsetDateTimeParseBucket>(time => time.Hour, (bucket, value) => bucket.Time.AmPm = value) },
            { 'c', DatePatternHelper.CreateCalendarHandler<OffsetDateTime, OffsetDateTimeParseBucket>(value => value.LocalDateTime.Calendar, (bucket, value) => bucket.Date.Calendar = value) },
            { 'g', DatePatternHelper.CreateEraHandler<OffsetDateTime, OffsetDateTimeParseBucket>(value => value.Era, bucket => bucket.Date) },
            { 'o', HandleOffset },
            { 'l', (cursor, builder) => builder.AddEmbeddedLocalPartial(cursor, bucket => bucket.Date, bucket => bucket.Time, value => value.Date, value => value.TimeOfDay, value => value.LocalDateTime) },
        };

        internal OffsetDateTimePatternParser(OffsetDateTime templateValue, int twoDigitYearMax)
        {
            Preconditions.CheckArgumentRange(nameof(twoDigitYearMax), twoDigitYearMax, 0, 99);
            this.templateValue = templateValue;
            this.twoDigitYearMax = twoDigitYearMax;
        }

        // Note: public to implement the interface. It does no harm, and it's simpler than using explicit
        // interface implementation.
        public IPattern<OffsetDateTime> ParsePattern(string patternText, NodaFormatInfo formatInfo)
        {
            // Nullity check is performed in OffsetDateTimePattern.
            if (patternText.Length == 0)
            {
                throw new InvalidPatternException(TextErrorMessages.FormatStringEmpty);
            }

            // Handle standard patterns
            if (patternText.Length == 1)
            {
                return patternText[0] switch
                {
                    'G' => OffsetDateTimePattern.Patterns.GeneralIsoPatternImpl,
                    'o' => OffsetDateTimePattern.Patterns.ExtendedIsoPatternImpl,
                    'r' => OffsetDateTimePattern.Patterns.FullRoundtripPatternImpl,
                    _ => throw new InvalidPatternException(TextErrorMessages.UnknownStandardFormat, patternText, typeof(OffsetDateTime))
                };
            }

            var patternBuilder = new SteppedPatternBuilder<OffsetDateTime, OffsetDateTimeParseBucket>(formatInfo, () => new OffsetDateTimeParseBucket(templateValue, twoDigitYearMax));
            patternBuilder.ParseCustomPattern(patternText, PatternCharacterHandlers);
            patternBuilder.ValidateUsedFields();
            // Need to reconstruct the template value from the bits...
            return patternBuilder.Build(templateValue);
        }

        private static void HandleOffset(PatternCursor pattern,
            SteppedPatternBuilder<OffsetDateTime, OffsetDateTimeParseBucket> builder)
        {
            builder.AddField(PatternFields.EmbeddedOffset, pattern.Current);
            string embeddedPattern = pattern.GetEmbeddedPattern();
            var offsetPattern = OffsetPattern.Create(embeddedPattern, builder.FormatInfo).UnderlyingPattern;
            builder.AddEmbeddedPattern(offsetPattern, (bucket, offset) => bucket.Offset = offset, zdt => zdt.Offset);
        }

        private sealed class OffsetDateTimeParseBucket : ParseBucket<OffsetDateTime>
        {
            internal readonly LocalDatePatternParser.LocalDateParseBucket Date;
            internal readonly LocalTimePatternParser.LocalTimeParseBucket Time;
            internal Offset Offset;

            internal OffsetDateTimeParseBucket(OffsetDateTime templateValue, int twoDigitYearMax)
            {
                Date = new LocalDatePatternParser.LocalDateParseBucket(templateValue.Date, twoDigitYearMax);
                Time = new LocalTimePatternParser.LocalTimeParseBucket(templateValue.TimeOfDay);
                Offset = templateValue.Offset;
            }

            internal override ParseResult<OffsetDateTime> CalculateValue(PatternFields usedFields, string text)
            {
                var localResult = LocalDateTimePatternParser.LocalDateTimeParseBucket.CombineBuckets(usedFields, Date, Time, text);
                if (!localResult.Success)
                {
                    return localResult.ConvertError<OffsetDateTime>();
                }

                var localDateTime = localResult.Value;
                return ParseResult<OffsetDateTime>.ForValue(localDateTime.WithOffset(Offset));
            }
        }
    }
}
