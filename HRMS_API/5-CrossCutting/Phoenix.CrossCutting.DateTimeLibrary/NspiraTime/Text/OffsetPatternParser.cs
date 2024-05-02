// Copyright 2011 The Noda Time Authors. All rights reserved.
// Use of this source code is governed by the Apache License 2.0,
// as found in the LICENSE.txt file.

using System.Diagnostics;
using System.Text;
using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Globalization;
using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Text.Patterns;
using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Utility;

namespace Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Text
{
    internal sealed class OffsetPatternParser : IPatternParser<Offset>
    {
        private static readonly Dictionary<char, CharacterHandler<Offset, OffsetParseBucket>> PatternCharacterHandlers =
            new Dictionary<char, CharacterHandler<Offset, OffsetParseBucket>>
        {
            { '%', SteppedPatternBuilder<Offset, OffsetParseBucket>.HandlePercent },
            { '\'', SteppedPatternBuilder<Offset, OffsetParseBucket>.HandleQuote },
            { '\"', SteppedPatternBuilder<Offset, OffsetParseBucket>.HandleQuote },
            { '\\', SteppedPatternBuilder<Offset, OffsetParseBucket>.HandleBackslash },
            { ':', (pattern, builder) => builder.AddLiteral(builder.FormatInfo.TimeSeparator, ParseResult<Offset>.TimeSeparatorMismatch) },
            { 'h', (pattern, builder) => { throw new InvalidPatternException(TextErrorMessages.Hour12PatternNotSupported, typeof(Offset)); } },
            { 'H', SteppedPatternBuilder<Offset, OffsetParseBucket>.HandlePaddedField
                       (2, PatternFields.Hours24, 0, 23, GetPositiveHours, (bucket, value) => bucket.Hours = value) },
            { 'm', SteppedPatternBuilder<Offset, OffsetParseBucket>.HandlePaddedField
                       (2, PatternFields.Minutes, 0, 59, GetPositiveMinutes, (bucket, value) => bucket.Minutes = value) },
            { 's', SteppedPatternBuilder<Offset, OffsetParseBucket>.HandlePaddedField
                       (2, PatternFields.Seconds, 0, 59, GetPositiveSeconds, (bucket, value) => bucket.Seconds = value) },
            { '+', HandlePlus },
            { '-', HandleMinus },
            { 'Z', (ignored1, ignored2) => { throw new InvalidPatternException(TextErrorMessages.ZPrefixNotAtStartOfPattern); } }
        };

        // These are used to compute the individual (always-positive) components of an offset.
        // For example, an offset of "three and a half hours behind UTC" would have a "positive hours" value
        // of 3, and a "positive minutes" value of 30. The sign is computed elsewhere.
        private static int GetPositiveHours(Offset offset) => Math.Abs(offset.Milliseconds) / NodaConstants.MillisecondsPerHour;

        private static int GetPositiveMinutes(Offset offset) => (Math.Abs(offset.Milliseconds) % NodaConstants.MillisecondsPerHour) / NodaConstants.MillisecondsPerMinute;

        private static int GetPositiveSeconds(Offset offset) => (Math.Abs(offset.Milliseconds) % NodaConstants.MillisecondsPerMinute) / NodaConstants.MillisecondsPerSecond;

        // Note: public to implement the interface. It does no harm, and it's simpler than using explicit
        // interface implementation.
        public IPattern<Offset> ParsePattern(string patternText, NodaFormatInfo formatInfo) => ParsePartialPattern(patternText, formatInfo);

        private IPartialPattern<Offset> ParsePartialPattern(string patternText, NodaFormatInfo formatInfo)
        {
            // Nullity check is performed in OffsetPattern.
            if (patternText.Length == 0)
            {
                throw new InvalidPatternException(TextErrorMessages.FormatStringEmpty);
            }

            if (patternText.Length == 1)
            {
                switch (patternText[0])
                {
                    case 'g':
                        return new CompositePatternBuilder<Offset>
                        {
                            { ParsePartialPattern(formatInfo.OffsetPatternLong, formatInfo), offset => true },
                            { ParsePartialPattern(formatInfo.OffsetPatternMedium, formatInfo), HasZeroSeconds },
                            { ParsePartialPattern(formatInfo.OffsetPatternShort, formatInfo), HasZeroSecondsAndMinutes },
                        }.BuildAsPartial();
                    case 'G':
                        return new ZPrefixPattern(ParsePartialPattern("g", formatInfo));
                    case 'i':
                        return new CompositePatternBuilder<Offset>
                        {
                            { ParsePartialPattern(formatInfo.OffsetPatternLongNoPunctuation, formatInfo), offset => true },
                            { ParsePartialPattern(formatInfo.OffsetPatternMediumNoPunctuation, formatInfo), HasZeroSeconds },
                            { ParsePartialPattern(formatInfo.OffsetPatternShortNoPunctuation, formatInfo), HasZeroSecondsAndMinutes },
                        }.BuildAsPartial();
                    case 'I':
                        return new ZPrefixPattern(ParsePartialPattern("i", formatInfo));
                    case 'l':
                        patternText = formatInfo.OffsetPatternLong;
                        break;
                    case 'm':
                        patternText = formatInfo.OffsetPatternMedium;
                        break;
                    case 's':
                        patternText = formatInfo.OffsetPatternShort;
                        break;
                    case 'L':
                        patternText = formatInfo.OffsetPatternLongNoPunctuation;
                        break;
                    case 'M':
                        patternText = formatInfo.OffsetPatternMediumNoPunctuation;
                        break;
                    case 'S':
                        patternText = formatInfo.OffsetPatternShortNoPunctuation;
                        break;
                    default:
                        throw new InvalidPatternException(TextErrorMessages.UnknownStandardFormat, patternText, typeof(Offset));
                }
            }
            // This is the only way we'd normally end up in custom parsing land for Z on its own.
            if (patternText == "%Z")
            {
                throw new InvalidPatternException(TextErrorMessages.EmptyZPrefixedOffsetPattern);
            }

            // Handle Z-prefix by stripping it, parsing the rest as a normal pattern, then building a special pattern
            // which decides whether or not to delegate.
            // Note that patternText is guaranteed not to be empty due to the check at the start.
            // (And assuming we don't add any standard => custom pattern expansions that result in an empty pattern.)
            bool zPrefix = patternText[0] == 'Z';

            var patternBuilder = new SteppedPatternBuilder<Offset, OffsetParseBucket>(formatInfo, () => new OffsetParseBucket());
            patternBuilder.ParseCustomPattern(zPrefix ? patternText.Substring(1) : patternText, PatternCharacterHandlers);
            // No need to validate field combinations here, but we do need to do something a bit special
            // for Z-handling.
            IPartialPattern<Offset> pattern = patternBuilder.Build(Offset.FromHoursAndMinutes(5, 30));
            return zPrefix ? new ZPrefixPattern(pattern) : pattern;
        }

        /// <summary>
        /// Returns true if the offset is representable just in hours and minutes (no seconds).
        /// </summary>
        private static bool HasZeroSeconds(Offset offset) => (offset.Seconds % NodaConstants.SecondsPerMinute) == 0;
        /// <summary>
        /// Returns true if the offset is representable just in hours (no minutes or seconds).
        /// </summary>
        private static bool HasZeroSecondsAndMinutes(Offset offset) => (offset.Seconds % NodaConstants.SecondsPerHour) == 0;

        /// <summary>
        /// Pattern which optionally delegates to another, but both parses and formats Offset.Zero as "Z".
        /// </summary>
        private sealed class ZPrefixPattern : IPartialPattern<Offset>
        {
            private readonly IPartialPattern<Offset> fullPattern;

            internal ZPrefixPattern(IPartialPattern<Offset> fullPattern)
            {
                this.fullPattern = fullPattern;
            }

            public ParseResult<Offset> Parse(string text) => text == "Z" ? ParseResult<Offset>.ForValue(Offset.Zero) : fullPattern.Parse(text);

            public string Format(Offset value) => value == Offset.Zero ? "Z" : fullPattern.Format(value);

            public ParseResult<Offset> ParsePartial(ValueCursor cursor)
            {
                if (cursor.Current == 'Z')
                {
                    cursor.MoveNext();
                    return ParseResult<Offset>.ForValue(Offset.Zero);
                }
                return fullPattern.ParsePartial(cursor);
            }

            public StringBuilder AppendFormat(Offset value, StringBuilder builder)
            {
                Preconditions.CheckNotNull(builder, nameof(builder));
                return value == Offset.Zero ? builder.Append('Z') : fullPattern.AppendFormat(value, builder);
            }
        }

        #region Character handlers
        private static void HandlePlus(PatternCursor pattern, SteppedPatternBuilder<Offset, OffsetParseBucket> builder)
        {
            builder.AddField(PatternFields.Sign, pattern.Current);
            builder.AddRequiredSign((bucket, positive) => bucket.IsNegative = !positive, offset => offset.Milliseconds >= 0);
        }

        private static void HandleMinus(PatternCursor pattern, SteppedPatternBuilder<Offset, OffsetParseBucket> builder)
        {
            builder.AddField(PatternFields.Sign, pattern.Current);
            builder.AddNegativeOnlySign((bucket, positive) => bucket.IsNegative = !positive, offset => offset.Milliseconds >= 0);
        }
        #endregion

        /// <summary>
        /// Provides a container for the interim parsed pieces of an <see cref="Offset" /> value.
        /// </summary>
        [DebuggerStepThrough]
        private sealed class OffsetParseBucket : ParseBucket<Offset>
        {
            /// <summary>
            /// The hours in the range [0, 23].
            /// </summary>
            internal int Hours;

            /// <summary>
            /// The minutes in the range [0, 59].
            /// </summary>
            internal int Minutes;

            /// <summary>
            /// The seconds in the range [0, 59].
            /// </summary>
            internal int Seconds;

            /// <summary>
            /// Gets a value indicating whether this instance is negative.
            /// </summary>
            /// <value>
            /// <c>true</c> if this instance is negative; otherwise, <c>false</c>.
            /// </value>
            public bool IsNegative;

            /// <summary>
            /// Calculates the value from the parsed pieces.
            /// </summary>
            internal override ParseResult<Offset> CalculateValue(PatternFields usedFields, string text)
            {
                int seconds = Hours * NodaConstants.SecondsPerHour +
                    Minutes * NodaConstants.SecondsPerMinute +
                    Seconds;
                if (IsNegative)
                {
                    seconds = -seconds;
                }
                return ParseResult<Offset>.ForValue(Offset.FromSeconds(seconds));
            }
        }
    }
}
