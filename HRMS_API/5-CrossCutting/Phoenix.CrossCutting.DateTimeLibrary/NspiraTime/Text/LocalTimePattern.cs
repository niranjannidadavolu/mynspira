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
    /// Represents a pattern for parsing and formatting <see cref="LocalTime"/> values.
    /// </summary>
    /// <threadsafety>
    /// When used with a read-only <see cref="CultureInfo" />, this type is immutable and instances
    /// may be shared freely between threads. We recommend only using read-only cultures for patterns, although this is
    /// not currently enforced.
    /// </threadsafety>
    [Immutable] // Well, assuming an immutable culture...
    public sealed class LocalTimePattern : IPattern<LocalTime>
    {
        /// <summary>
        /// Gets an invariant local time pattern which is ISO-8601 compatible, providing up to 9 decimal places.
        /// (These digits are omitted when unnecessary.)
        /// This corresponds to the text pattern "HH':'mm':'ss;FFFFFFFFF".
        /// </summary>
        /// <remarks>
        /// This pattern corresponds to the 'o' standard pattern.
        /// </remarks>
        /// <value>An invariant local time pattern which is ISO-8601 compatible, providing up to 9 decimal places.</value>
        public static LocalTimePattern ExtendedIso => Patterns.ExtendedIsoPatternImpl;

        /// <summary>
        /// Gets an invariant local time pattern which is ISO-8601 compatible, providing exactly 9 decimal places.
        /// This corresponds to the text pattern "HH':'mm':'ss;fffffffff".
        /// </summary>
        /// <remarks>
        /// This pattern corresponds to the 'O' standard pattern.
        /// </remarks>
        /// <value>An invariant local time pattern which is ISO-8601 compatible, providing exactly 9 decimal places.</value>
        public static LocalTimePattern LongExtendedIso => Patterns.LongExtendedIsoPatternImpl;

        /// <summary>
        /// Gets an invariant local time pattern which is ISO-8601 compatible, with precision of just seconds.
        /// This corresponds to the text pattern "HH':'mm':'ss".
        /// </summary>
        /// <value>An invariant local time pattern which is ISO-8601 compatible, with no sub-second precision.</value>
        public static LocalTimePattern GeneralIso => Patterns.GeneralIsoPatternImpl;

        /// <summary>
        /// Gets an invariant local time pattern which is ISO-8601 compatible, with precision of just minutes.
        /// This corresponds to the text pattern "HH':'mm".
        /// </summary>
        /// <value>An invariant local time pattern which is ISO-8601 compatible, with no sub-minute precision.</value>
        public static LocalTimePattern HourMinuteIso => Patterns.HourMinuteIsoPatternImpl;

        /// <summary>
        /// Gets an invariant local time pattern which is ISO-8601 compatible, with a precision of just hours.
        /// This corresponds to the text pattern "HH".
        /// </summary>
        /// <value>An invariant local time pattern which is ISO-8601 compatible, with no sub-hour precision.</value>
        public static LocalTimePattern HourIso => Patterns.HourIsoPatternImpl;

        /// <summary>
        /// Gets an invariant local time pattern which can parse any ISO-8601 compatible value
        /// (in extended format, that is, with separators), regardless of precision.
        /// Valid values include "just hours", "hours and minutes", "hours, minutes and seconds",
        /// and values with fractions of seconds (as far as nanoseconds).
        /// </summary>
        /// <remarks>
        /// This is expressed as an <see cref="IPattern{LocalTime}"/> rather than a <see cref="LocalTimePattern"/>,
        /// as it has no single pattern text.
        /// </remarks>
        /// <value>An invariant local time pattern which is ISO-8601 compatible for all precisions.</value>
        public static IPattern<LocalTime> VariablePrecisionIso => Patterns.VariablePrecisionIsoPatternImpl;

        private const string DefaultFormatPattern = "T"; // Long

        internal static readonly PatternBclSupport<LocalTime> BclSupport =
            new PatternBclSupport<LocalTime>(DefaultFormatPattern, fi => fi.LocalTimePatternParser);

        /// <summary>
        /// Class whose existence is solely to avoid type initialization order issues, most of which stem
        /// from needing NodaFormatInfo.InvariantInfo...
        /// </summary>
        internal static class Patterns
        {
            internal static readonly LocalTimePattern ExtendedIsoPatternImpl = CreateWithInvariantCulture("HH':'mm':'ss;FFFFFFFFF");
            internal static readonly LocalTimePattern LongExtendedIsoPatternImpl = CreateWithInvariantCulture("HH':'mm':'ss;fffffffff");
            internal static readonly LocalTimePattern GeneralIsoPatternImpl = CreateWithInvariantCulture("HH':'mm':'ss");
            internal static readonly LocalTimePattern HourIsoPatternImpl = CreateWithInvariantCulture("HH");
            internal static readonly LocalTimePattern HourMinuteIsoPatternImpl = CreateWithInvariantCulture("HH':'mm");
            internal static readonly IPattern<LocalTime> VariablePrecisionIsoPatternImpl = new CompositePatternBuilder<LocalTime>
            {
                { ExtendedIsoPatternImpl, time => true },
                { HourMinuteIsoPatternImpl, time => time.Second == 0 && time.NanosecondOfSecond == 0 },
                { HourIsoPatternImpl, time => time.Minute == 0 && time.Second == 0 && time.NanosecondOfSecond == 0 },
            }.Build();
        }

        /// <summary>
        /// Returns the pattern that this object delegates to. Mostly useful to avoid this public class
        /// implementing an internal interface.
        /// </summary>
        internal IPartialPattern<LocalTime> UnderlyingPattern { get; }

        /// <summary>
        /// Gets the pattern text for this pattern, as supplied on creation.
        /// </summary>
        /// <value>The pattern text for this pattern, as supplied on creation.</value>
        public string PatternText { get; }

        /// <summary>
        /// Gets the localization information used in this pattern.
        /// </summary>
        private NodaFormatInfo FormatInfo { get; }

        /// <summary>
        /// Gets the value used as a template for parsing: any field values unspecified
        /// in the pattern are taken from the template.
        /// </summary>
        /// <value>The value used as a template for parsing.</value>
        public LocalTime TemplateValue { get; }

        private LocalTimePattern(string patternText, NodaFormatInfo formatInfo, LocalTime templateValue, IPartialPattern<LocalTime> pattern)
        {
            PatternText = patternText;
            FormatInfo = formatInfo;
            TemplateValue = templateValue;
            UnderlyingPattern = pattern;
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
        public ParseResult<LocalTime> Parse([SpecialNullHandling] string text) => UnderlyingPattern.Parse(text);

        /// <summary>
        /// Formats the given local time as text according to the rules of this pattern.
        /// </summary>
        /// <param name="value">The local time to format.</param>
        /// <returns>The local time formatted according to this pattern.</returns>
        public string Format(LocalTime value) => UnderlyingPattern.Format(value);

        /// <summary>
        /// Formats the given value as text according to the rules of this pattern,
        /// appending to the given <see cref="StringBuilder"/>.
        /// </summary>
        /// <param name="value">The value to format.</param>
        /// <param name="builder">The <c>StringBuilder</c> to append to.</param>
        /// <returns>The builder passed in as <paramref name="builder"/>.</returns>
        public StringBuilder AppendFormat(LocalTime value, StringBuilder builder) => UnderlyingPattern.AppendFormat(value, builder);

        /// <summary>
        /// Creates a pattern for the given pattern text, format info, and template value.
        /// </summary>
        /// <param name="patternText">Pattern text to create the pattern for</param>
        /// <param name="formatInfo">The format info to use in the pattern</param>
        /// <param name="templateValue">Template value to use for unspecified fields</param>
        /// <returns>A pattern for parsing and formatting local times.</returns>
        /// <exception cref="InvalidPatternException">The pattern text was invalid.</exception>
        internal static LocalTimePattern Create(string patternText, NodaFormatInfo formatInfo,
            LocalTime templateValue)
        {
            Preconditions.CheckNotNull(patternText, nameof(patternText));
            Preconditions.CheckNotNull(formatInfo, nameof(formatInfo));
            // Use the "fixed" parser for the common case of the default template value.
            var pattern = templateValue == LocalTime.Midnight
                ? formatInfo.LocalTimePatternParser.ParsePattern(patternText)
                : new LocalTimePatternParser(templateValue).ParsePattern(patternText, formatInfo);
            // If ParsePattern returns a standard pattern instance, we need to get the underlying partial pattern.
            // (Alternatively, we could just return it directly, instead of creating a new object.)
            pattern = (pattern as LocalTimePattern)?.UnderlyingPattern ?? pattern;
            var partialPattern = (IPartialPattern<LocalTime>) pattern;
            return new LocalTimePattern(patternText, formatInfo, templateValue, partialPattern);
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
        /// <returns>A pattern for parsing and formatting local times.</returns>
        /// <exception cref="InvalidPatternException">The pattern text was invalid.</exception>
        public static LocalTimePattern Create(string patternText, [ValidatedNotNull] CultureInfo cultureInfo, LocalTime templateValue) =>
            Create(patternText, NodaFormatInfo.GetFormatInfo(cultureInfo), templateValue);

        /// <summary>
        /// Creates a pattern for the given pattern text and culture, with a template value of midnight.
        /// </summary>
        /// <remarks>
        /// See the user guide for the available pattern text options.
        /// </remarks>
        /// <param name="patternText">Pattern text to create the pattern for</param>
        /// <param name="cultureInfo">The culture to use in the pattern</param>
        /// <returns>A pattern for parsing and formatting local times.</returns>
        /// <exception cref="InvalidPatternException">The pattern text was invalid.</exception>
        public static LocalTimePattern Create(string patternText, CultureInfo cultureInfo) =>
            Create(patternText, cultureInfo, LocalTime.Midnight);

        /// <summary>
        /// Creates a pattern for the given pattern text in the current thread's current culture.
        /// </summary>
        /// <remarks>
        /// See the user guide for the available pattern text options. Note that the current culture
        /// is captured at the time this method is called - it is not captured at the point of parsing
        /// or formatting values.
        /// </remarks>
        /// <param name="patternText">Pattern text to create the pattern for</param>
        /// <returns>A pattern for parsing and formatting local times.</returns>
        /// <exception cref="InvalidPatternException">The pattern text was invalid.</exception>
        public static LocalTimePattern CreateWithCurrentCulture(string patternText) =>
            Create(patternText, NodaFormatInfo.CurrentInfo, LocalTime.Midnight);

        /// <summary>
        /// Creates a pattern for the given pattern text in the invariant culture.
        /// </summary>
        /// <remarks>
        /// See the user guide for the available pattern text options. Note that the current culture
        /// is captured at the time this method is called - it is not captured at the point of parsing
        /// or formatting values.
        /// </remarks>
        /// <param name="patternText">Pattern text to create the pattern for</param>
        /// <returns>A pattern for parsing and formatting local times.</returns>
        /// <exception cref="InvalidPatternException">The pattern text was invalid.</exception>
        public static LocalTimePattern CreateWithInvariantCulture(string patternText) =>
            Create(patternText, NodaFormatInfo.InvariantInfo, LocalTime.Midnight);

        /// <summary>
        /// Creates a pattern for the same original pattern text as this pattern, but with the specified
        /// localization information.
        /// </summary>
        /// <param name="formatInfo">The localization information to use in the new pattern.</param>
        /// <returns>A new pattern with the given localization information.</returns>
        private LocalTimePattern WithFormatInfo(NodaFormatInfo formatInfo) =>
            Create(PatternText, formatInfo, TemplateValue);

        /// <summary>
        /// Creates a pattern for the same original pattern text as this pattern, but with the specified
        /// culture.
        /// </summary>
        /// <param name="cultureInfo">The culture to use in the new pattern.</param>
        /// <returns>A new pattern with the given culture.</returns>
        public LocalTimePattern WithCulture([ValidatedNotNull] CultureInfo cultureInfo) =>
            WithFormatInfo(NodaFormatInfo.GetFormatInfo(cultureInfo));

        /// <summary>
        /// Creates a pattern like this one, but with the specified template value.
        /// </summary>
        /// <param name="newTemplateValue">The template value for the new pattern, used to fill in unspecified fields.</param>
        /// <returns>A new pattern with the given template value.</returns>
        public LocalTimePattern WithTemplateValue(LocalTime newTemplateValue) =>
            Create(PatternText, FormatInfo, newTemplateValue);
    }
}
