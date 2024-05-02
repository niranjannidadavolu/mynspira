﻿// Copyright 2013 The Noda Time Authors. All rights reserved.
// Use of this source code is governed by the Apache License 2.0,
// as found in the LICENSE.txt file.

using System.Diagnostics;
using System.Numerics;
using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Globalization;
using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Text.Patterns;
using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Utility;
using static Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.NodaConstants;

namespace Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Text
{
    internal sealed class DurationPatternParser : IPatternParser<Duration>
    {
        private static readonly Dictionary<char, CharacterHandler<Duration, DurationParseBucket>> PatternCharacterHandlers =
            new Dictionary<char, CharacterHandler<Duration, DurationParseBucket>>
        {
            { '%', SteppedPatternBuilder<Duration, DurationParseBucket>.HandlePercent },
            { '\'', SteppedPatternBuilder<Duration, DurationParseBucket>.HandleQuote },
            { '\"', SteppedPatternBuilder<Duration, DurationParseBucket>.HandleQuote },
            { '\\', SteppedPatternBuilder<Duration, DurationParseBucket>.HandleBackslash },
            { '.', TimePatternHelper.CreatePeriodHandler<Duration, DurationParseBucket>(9, GetPositiveNanosecondOfSecond, (bucket, value) => bucket.AddNanoseconds(value)) },
            { ':', (pattern, builder) => builder.AddLiteral(builder.FormatInfo.TimeSeparator, ParseResult<Duration>.TimeSeparatorMismatch) },
            { 'D', CreateDayHandler() },
            { 'H', CreateTotalHandler(PatternFields.Hours24, NanosecondsPerHour, HoursPerDay, 402653184L) },
            { 'h', CreatePartialHandler(PatternFields.Hours24, NanosecondsPerHour, HoursPerDay) },
            { 'M', CreateTotalHandler(PatternFields.Minutes, NanosecondsPerMinute, MinutesPerDay, 24159191040L) },
            { 'm', CreatePartialHandler(PatternFields.Minutes, NanosecondsPerMinute, MinutesPerHour) },
            { 'S', CreateTotalHandler(PatternFields.Seconds, NanosecondsPerSecond, SecondsPerDay, 1449551462400L) },
            { 's', CreatePartialHandler(PatternFields.Seconds, NanosecondsPerSecond, SecondsPerMinute) },
            { 'f', TimePatternHelper.CreateFractionHandler<Duration, DurationParseBucket>(9, GetPositiveNanosecondOfSecond, (bucket, value) => bucket.AddNanoseconds(value)) },
            { 'F', TimePatternHelper.CreateFractionHandler<Duration, DurationParseBucket>(9, GetPositiveNanosecondOfSecond, (bucket, value) => bucket.AddNanoseconds(value)) },
            { '+', HandlePlus },
            { '-', HandleMinus },
        };

        // Note: public to implement the interface. It does no harm, and it's simpler than using explicit
        // interface implementation.
        public IPattern<Duration> ParsePattern(string patternText, NodaFormatInfo formatInfo)
        {
            Preconditions.CheckNotNull(patternText, nameof(patternText));
            if (patternText.Length == 0)
            {
                throw new InvalidPatternException(TextErrorMessages.FormatStringEmpty);
            }

            if (patternText.Length == 1)
            {
                return patternText[0] switch
                {
                    'o' => DurationPattern.Patterns.RoundtripPatternImpl,
                    'j' => DurationPattern.Patterns.JsonRoundtripPatternImpl,
                    _ => throw new InvalidPatternException(TextErrorMessages.UnknownStandardFormat, patternText, typeof(Duration))
                };
            }

            var patternBuilder = new SteppedPatternBuilder<Duration, DurationParseBucket>(formatInfo,
                () => new DurationParseBucket());
            patternBuilder.ParseCustomPattern(patternText, PatternCharacterHandlers);
            // Somewhat random sample, admittedly...
            return patternBuilder.Build(Duration.FromHours(1) + Duration.FromMinutes(30) + Duration.FromSeconds(5) + Duration.FromMilliseconds(500));
        }

        private static int GetPositiveNanosecondOfSecond(Duration duration)
        {
            return (int) (Math.Abs(duration.NanosecondOfDay) % NanosecondsPerSecond);
        }

        private static CharacterHandler<Duration, DurationParseBucket> CreateTotalHandler
            (PatternFields field, long nanosecondsPerUnit, int unitsPerDay, long maxValue)
        {
            return (pattern, builder) =>
            {
                // Needs to be big enough for 1449551462400 seconds
                int count = pattern.GetRepeatCount(13);
                // AddField would throw an inappropriate exception here, so handle it specially.
                if ((builder.UsedFields & PatternFields.TotalDuration) != 0)
                {
                    throw new InvalidPatternException(TextErrorMessages.MultipleCapitalDurationFields);
                }
                builder.AddField(field, pattern.Current);
                builder.AddField(PatternFields.TotalDuration, pattern.Current);
                builder.AddParseInt64ValueAction(count, 13, pattern.Current, 0, maxValue, (bucket, value) => bucket.AddUnits(value, nanosecondsPerUnit));
                builder.AddFormatAction((value, sb) => FormatHelper.LeftPadNonNegativeInt64(GetPositiveNanosecondUnits(value, nanosecondsPerUnit, unitsPerDay), count, sb));
            };
        }

        private static CharacterHandler<Duration, DurationParseBucket> CreateDayHandler()
        {
            return (pattern, builder) =>
            {
                int count = pattern.GetRepeatCount(8); // Enough for 16777216
                // AddField would throw an inappropriate exception here, so handle it specially.
                if ((builder.UsedFields & PatternFields.TotalDuration) != 0)
                {
                    throw new InvalidPatternException(TextErrorMessages.MultipleCapitalDurationFields);
                }
                builder.AddField(PatternFields.DayOfMonth, pattern.Current);
                builder.AddField(PatternFields.TotalDuration, pattern.Current);
                builder.AddParseValueAction(count, 8, pattern.Current, 0, 16777216, (bucket, value) => bucket.AddDays(value));
                builder.AddFormatLeftPad(count, duration =>
                {
                    int days = duration.FloorDays;
                    if (days >= 0)
                    {
                        return days;
                    }
                    // Round towards 0.
                    return duration.NanosecondOfFloorDay == 0 ? -days : -(days + 1);
                },
                assumeNonNegative: true,
                assumeFitsInCount: false);
            };
        }

        private static CharacterHandler<Duration, DurationParseBucket> CreatePartialHandler
            (PatternFields field, long nanosecondsPerUnit, int unitsPerContainer)
        {
            return (pattern, builder) =>
            {
                int count = pattern.GetRepeatCount(2);
                builder.AddField(field, pattern.Current);
                builder.AddParseValueAction(count, 2, pattern.Current, 0, unitsPerContainer - 1,
                    (bucket, value) => bucket.AddUnits(value, nanosecondsPerUnit));
                // This is never used for anything larger than a day, so the day part is irrelevant.
                builder.AddFormatLeftPad(count,
                    duration => (int) (((Math.Abs(duration.NanosecondOfDay) / nanosecondsPerUnit)) % unitsPerContainer),
                    assumeNonNegative: true,
                    assumeFitsInCount: count == 2);
            };
        }

        private static void HandlePlus(PatternCursor pattern, SteppedPatternBuilder<Duration, DurationParseBucket> builder)
        {
            builder.AddField(PatternFields.Sign, pattern.Current);
            builder.AddRequiredSign((bucket, positive) => bucket.IsNegative = !positive, duration => duration.FloorDays >= 0);
        }

        private static void HandleMinus(PatternCursor pattern, SteppedPatternBuilder<Duration, DurationParseBucket> builder)
        {
            builder.AddField(PatternFields.Sign, pattern.Current);
            builder.AddNegativeOnlySign((bucket, positive) => bucket.IsNegative = !positive, duration => duration.FloorDays >= 0);
        }

        private static long GetPositiveNanosecondUnits(Duration duration, long nanosecondsPerUnit, int unitsPerDay)
        {
            // The property is declared as an int, but we it as a long to force 64-bit arithmetic when multiplying.
            long floorDays = duration.FloorDays;
            if (floorDays >= 0)
            {
                return floorDays * unitsPerDay + duration.NanosecondOfFloorDay / nanosecondsPerUnit;
            }
            else
            {
                long nanosecondOfDay = duration.NanosecondOfDay;
                // If it's not an exact number of days, FloorDays will overshoot (negatively) by 1.
                long negativeValue = nanosecondOfDay == 0
                    ? floorDays * unitsPerDay
                    : (floorDays + 1) * unitsPerDay + nanosecondOfDay / nanosecondsPerUnit;
                return -negativeValue;
            }
        }

        /// <summary>
        /// Provides a container for the interim parsed pieces of an <see cref="Offset" /> value.
        /// </summary>
        [DebuggerStepThrough]
        private sealed class DurationParseBucket : ParseBucket<Duration>
        {
            private static readonly BigInteger BigIntegerNanosecondsPerDay = NanosecondsPerDay;

            // Note: While we *could* try to optimize this to not use BigInteger, this approach is really simple.
            internal bool IsNegative { get; set; }
            private BigInteger currentNanos;

            internal void AddNanoseconds(long nanoseconds)
            {
                this.currentNanos += nanoseconds;
            }

            internal void AddDays(int days)
            {
                currentNanos += days * BigIntegerNanosecondsPerDay;
            }

            internal void AddUnits(long units, BigInteger nanosecondsPerUnit)
            {
                currentNanos += units * nanosecondsPerUnit;
            }

            /// <summary>
            /// Calculates the value from the parsed pieces.
            /// </summary>
            internal override ParseResult<Duration> CalculateValue(PatternFields usedFields, string text)
            {
                if (IsNegative)
                {
                    currentNanos = -currentNanos;
                }
                if (currentNanos < Duration.MinNanoseconds || currentNanos > Duration.MaxNanoseconds)
                {
                    return ParseResult<Duration>.ForInvalidValuePostParse(text, TextErrorMessages.OverallValueOutOfRange,
                        typeof(Duration));
                }
                return ParseResult<Duration>.ForValue(Duration.FromNanoseconds(currentNanos));
            }
        }
    }
}
