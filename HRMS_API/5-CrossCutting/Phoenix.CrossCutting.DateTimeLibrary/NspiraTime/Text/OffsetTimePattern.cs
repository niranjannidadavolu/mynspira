// Copyright 2017 The Noda Time Authors. All rights reserved.
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
    /// Represents a pattern for parsing and formatting <see cref="OffsetTime"/> values.
    /// </summary>
    /// <threadsafety>
    /// When used with a read-only <see cref="CultureInfo" />, this type is immutable and instances
    /// may be shared freely between threads. We recommend only using read-only cultures for patterns, although this is
    /// not currently enforced.
    /// </threadsafety>
    [Immutable] // Well, assuming an immutable culture...
    public sealed class OffsetTimePattern : IPattern<OffsetTime>
    {
        internal static readonly OffsetTime DefaultTemplateValue = LocalTime.Midnight.WithOffset(Offset.Zero);

        /// <summary>
        /// Gets an invariant offset time pattern based on ISO-8601 (down to the second), including offset from UTC.
        /// </summary>
        /// <remarks>
        /// This corresponds to a custom pattern of "HH':'mm':'sso&lt;G&gt;". It is available as the "G"
        /// standard pattern (even though it is invariant).
        /// </remarks>
        /// <value>An invariant offset time pattern based on ISO-8601 (down to the second), including offset from UTC.</value>
        public static OffsetTimePattern GeneralIso => Patterns.GeneralIsoPatternImpl;

        /// <summary>
        /// Gets an invariant offset time pattern based on ISO-8601 (down to the nanosecond), including offset from UTC.
        /// </summary>
        /// <remarks>
        /// This corresponds to a custom pattern of "HH':'mm':'ss;FFFFFFFFFo&lt;G&gt;".
        /// This will round-trip all values, and is available as the "o" standard pattern.
        /// </remarks>
        /// <value>An invariant offset time pattern based on ISO-8601 (down to the nanosecond), including offset from UTC.</value>
        public static OffsetTimePattern ExtendedIso => Patterns.ExtendedIsoPatternImpl;

        /// <summary>
        /// Gets an invariant offset time pattern based on RFC 3339 (down to the nanosecond), including offset from UTC
        /// as hours and minutes only.
        /// </summary>
        /// <remarks>
        /// The minutes part of the offset is always included, but any sub-minute component
        /// of the offset is lost. An offset of zero is formatted as 'Z', but all of 'Z', '+00:00' and '-00:00' are parsed
        /// the same way. The RFC 3339 meaning of '-00:00' is not supported by Noda Time.
        /// Note that parsing is case-sensitive (so 'T' and 'Z' must be upper case).
        /// This pattern corresponds to a custom pattern of
        /// "HH':'mm':'ss;FFFFFFFFFo&lt;Z+HH:mm&gt;".
        /// </remarks>
        /// <value>An invariant offset time pattern based on RFC 3339 (down to the nanosecond), including offset from UTC
        /// as hours and minutes only.</value>
        public static OffsetTimePattern Rfc3339 => Patterns.Rfc3339PatternImpl;

        /// <summary>
        /// Class whose existence is solely to avoid type initialization order issues, most of which stem
        /// from needing NodaFormatInfo.InvariantInfo...
        /// </summary>
        internal static class Patterns
        {
            internal static readonly OffsetTimePattern GeneralIsoPatternImpl = Create("HH':'mm':'sso<G>", NodaFormatInfo.InvariantInfo, DefaultTemplateValue);
            internal static readonly OffsetTimePattern ExtendedIsoPatternImpl = Create("HH':'mm':'ss;FFFFFFFFFo<G>", NodaFormatInfo.InvariantInfo, DefaultTemplateValue);
            internal static readonly OffsetTimePattern Rfc3339PatternImpl = Create("HH':'mm':'ss;FFFFFFFFFo<Z+HH:mm>", NodaFormatInfo.InvariantInfo, DefaultTemplateValue);
            internal static readonly PatternBclSupport<OffsetTime> BclSupport = new PatternBclSupport<OffsetTime>("G", fi => fi.OffsetTimePatternParser);
        }

        private readonly IPattern<OffsetTime> pattern;

        /// <summary>
        /// Gets the pattern text for this pattern, as supplied on creation.
        /// </summary>
        /// <value>The pattern text for this pattern, as supplied on creation.</value>
        public string PatternText { get; }

        // Visible for testing
        /// <summary>
        /// Gets the localization information used in this pattern.
        /// </summary>
        internal NodaFormatInfo FormatInfo { get; }

        /// <summary>
        /// Gets the value used as a template for parsing: any field values unspecified
        /// in the pattern are taken from the template.
        /// </summary>
        /// <value>The value used as a template for parsing.</value>
        public OffsetTime TemplateValue { get; }

        private OffsetTimePattern(string patternText, NodaFormatInfo formatInfo, OffsetTime templateValue,
            IPattern<OffsetTime> pattern)
        {
            this.PatternText = patternText;
            this.FormatInfo = formatInfo;
            this.TemplateValue = templateValue;
            this.pattern = pattern;
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
        public ParseResult<OffsetTime> Parse([SpecialNullHandling] string text) => pattern.Parse(text);

        /// <summary>
        /// Formats the given offset time as text according to the rules of this pattern.
        /// </summary>
        /// <param name="value">The offset time to format.</param>
        /// <returns>The offset time formatted according to this pattern.</returns>
        public string Format(OffsetTime value) => pattern.Format(value);

        /// <summary>
        /// Formats the given value as text according to the rules of this pattern,
        /// appending to the given <see cref="StringBuilder"/>.
        /// </summary>
        /// <param name="value">The value to format.</param>
        /// <param name="builder">The <c>StringBuilder</c> to append to.</param>
        /// <returns>The builder passed in as <paramref name="builder"/>.</returns>
        public StringBuilder AppendFormat(OffsetTime value, StringBuilder builder) => pattern.AppendFormat(value, builder);

        /// <summary>
        /// Creates a pattern for the given pattern text, format info, and template value.
        /// </summary>
        /// <param name="patternText">Pattern text to create the pattern for</param>
        /// <param name="formatInfo">The format info to use in the pattern</param>
        /// <param name="templateValue">Template value to use for unspecified fields</param>
        /// <returns>A pattern for parsing and formatting offset times.</returns>
        /// <exception cref="InvalidPatternException">The pattern text was invalid.</exception>
        private static OffsetTimePattern Create(string patternText, NodaFormatInfo formatInfo,
            OffsetTime templateValue)
        {
            Preconditions.CheckNotNull(patternText, nameof(patternText));
            Preconditions.CheckNotNull(formatInfo, nameof(formatInfo));
            var pattern = new OffsetTimePatternParser(templateValue).ParsePattern(patternText, formatInfo);
            return new OffsetTimePattern(patternText, formatInfo, templateValue, pattern);
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
        public static OffsetTimePattern Create(string patternText, [ValidatedNotNull] CultureInfo cultureInfo, OffsetTime templateValue) =>
            Create(patternText, NodaFormatInfo.GetFormatInfo(cultureInfo), templateValue);

        /// <summary>
        /// Creates a pattern for the given pattern text in the invariant culture, using the default
        /// template value of midnight January 1st 2000 at an offset of 0.
        /// </summary>
        /// <remarks>
        /// See the user guide for the available pattern text options.
        /// </remarks>
        /// <param name="patternText">Pattern text to create the pattern for</param>
        /// <returns>A pattern for parsing and formatting local times.</returns>
        /// <exception cref="InvalidPatternException">The pattern text was invalid.</exception>
        public static OffsetTimePattern CreateWithInvariantCulture(string patternText) =>
            Create(patternText, NodaFormatInfo.InvariantInfo, DefaultTemplateValue);

        /// <summary>
        /// Creates a pattern for the given pattern text in the current culture, using the default
        /// template value of midnight January 1st 2000 at an offset of 0.
        /// </summary>
        /// <remarks>
        /// See the user guide for the available pattern text options. Note that the current culture
        /// is captured at the time this method is called - it is not captured at the point of parsing
        /// or formatting values.
        /// </remarks>
        /// <param name="patternText">Pattern text to create the pattern for</param>
        /// <returns>A pattern for parsing and formatting local times.</returns>
        /// <exception cref="InvalidPatternException">The pattern text was invalid.</exception>
        public static OffsetTimePattern CreateWithCurrentCulture(string patternText) =>
            Create(patternText, NodaFormatInfo.CurrentInfo, DefaultTemplateValue);

        /// <summary>
        /// Creates a pattern for the same original localization information as this pattern, but with the specified
        /// pattern text.
        /// </summary>
        /// <param name="patternText">The pattern text to use in the new pattern.</param>
        /// <returns>A new pattern with the given pattern text.</returns>
        public OffsetTimePattern WithPatternText(string patternText) =>
            Create(patternText, FormatInfo, TemplateValue);

        /// <summary>
        /// Creates a pattern for the same original pattern text as this pattern, but with the specified
        /// localization information.
        /// </summary>
        /// <param name="formatInfo">The localization information to use in the new pattern.</param>
        /// <returns>A new pattern with the given localization information.</returns>
        private OffsetTimePattern WithFormatInfo(NodaFormatInfo formatInfo) =>
            Create(PatternText, formatInfo, TemplateValue);

        /// <summary>
        /// Creates a pattern for the same original pattern text as this pattern, but with the specified
        /// culture.
        /// </summary>
        /// <param name="cultureInfo">The culture to use in the new pattern.</param>
        /// <returns>A new pattern with the given culture.</returns>
        public OffsetTimePattern WithCulture([ValidatedNotNull] CultureInfo cultureInfo) =>
            WithFormatInfo(NodaFormatInfo.GetFormatInfo(cultureInfo));

        /// <summary>
        /// Creates a pattern for the same original pattern text and culture as this pattern, but with
        /// the specified template value.
        /// </summary>
        /// <param name="newTemplateValue">The template value to use in the new pattern.</param>
        /// <returns>A new pattern with the given template value.</returns>
        public OffsetTimePattern WithTemplateValue(OffsetTime newTemplateValue) =>
            Create(PatternText, FormatInfo, newTemplateValue);
    }
}
