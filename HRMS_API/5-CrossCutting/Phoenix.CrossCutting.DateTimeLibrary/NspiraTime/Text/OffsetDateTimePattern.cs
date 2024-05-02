// Copyright 2013 The Noda Time Authors. All rights reserved.
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
    /// Represents a pattern for parsing and formatting <see cref="OffsetDateTime"/> values.
    /// </summary>
    /// <threadsafety>
    /// When used with a read-only <see cref="CultureInfo" />, this type is immutable and instances
    /// may be shared freely between threads. We recommend only using read-only cultures for patterns, although this is
    /// not currently enforced.
    /// </threadsafety>
    [Immutable] // Well, assuming an immutable culture...
    public sealed class OffsetDateTimePattern : IPattern<OffsetDateTime>
    {
        internal static readonly OffsetDateTime DefaultTemplateValue = new LocalDateTime(2000, 1, 1, 0, 0).WithOffset(Offset.Zero);

        /// <summary>
        /// Gets an invariant offset date/time pattern based on ISO-8601 (down to the second), including offset from UTC.
        /// </summary>
        /// <remarks>
        /// The calendar system is not parsed or formatted as part of this pattern. It corresponds to a custom pattern of
        /// "uuuu'-'MM'-'dd'T'HH':'mm':'sso&lt;G&gt;". This pattern is available as the "G"
        /// standard pattern (even though it is invariant).
        /// </remarks>
        /// <value>An invariant offset date/time pattern based on ISO-8601 (down to the second), including offset from UTC.</value>
        public static OffsetDateTimePattern GeneralIso => Patterns.GeneralIsoPatternImpl;

        /// <summary>
        /// Gets an invariant offset date/time pattern based on ISO-8601 (down to the nanosecond), including offset from UTC.
        /// </summary>
        /// <remarks>
        /// The calendar system is not parsed or formatted as part of this pattern. It corresponds to a custom pattern of
        /// "uuuu'-'MM'-'dd'T'HH':'mm':'ss;FFFFFFFFFo&lt;G&gt;". This will round-trip any values
        /// in the ISO calendar, and is available as the "o" standard pattern.
        /// </remarks>
        /// <value>An invariant offset date/time pattern based on ISO-8601 (down to the nanosecond), including offset from UTC.</value>
        public static OffsetDateTimePattern ExtendedIso => Patterns.ExtendedIsoPatternImpl;

        /// <summary>
        /// Gets an invariant offset date/time pattern based on RFC 3339 (down to the nanosecond), including offset from UTC
        /// as hours and minutes only.
        /// </summary>
        /// <remarks>
        /// The minutes part of the offset is always included, but any sub-minute component
        /// of the offset is lost. An offset of zero is formatted as 'Z', but all of 'Z', '+00:00' and '-00:00' are parsed
        /// the same way. The RFC 3339 meaning of '-00:00' is not supported by Noda Time.
        /// Note that parsing is case-sensitive (so 'T' and 'Z' must be upper case).
        /// The calendar system is not parsed or formatted as part of this pattern. It corresponds to a custom pattern of
        /// "uuuu'-'MM'-'dd'T'HH':'mm':'ss;FFFFFFFFFo&lt;Z+HH:mm&gt;".
        /// </remarks>
        /// <value>An invariant offset date/time pattern based on RFC 3339 (down to the nanosecond), including offset from UTC
        /// as hours and minutes only.</value>
        public static OffsetDateTimePattern Rfc3339 => Patterns.Rfc3339PatternImpl;

        /// <summary>
        /// Gets an invariant offset date/time pattern based on ISO-8601 (down to the nanosecond)
        /// including offset from UTC and calendar ID.
        /// </summary>
        /// <remarks>
        /// The returned pattern corresponds to a custom pattern of
        /// "uuuu'-'MM'-'dd'T'HH':'mm':'ss;FFFFFFFFFo&lt;G&gt; '('c')'". This will round-trip any value in any calendar,
        /// and is available as the "r" standard pattern.
        /// </remarks>
        /// <value>An invariant offset date/time pattern based on ISO-8601 (down to the nanosecond)
        /// including offset from UTC and calendar ID.</value>
        public static OffsetDateTimePattern FullRoundtrip => Patterns.FullRoundtripPatternImpl;

        /// <summary>
        /// Class whose existence is solely to avoid type initialization order issues, most of which stem
        /// from needing NodaFormatInfo.InvariantInfo...
        /// </summary>
        internal static class Patterns
        {
            internal static readonly OffsetDateTimePattern GeneralIsoPatternImpl = Create("uuuu'-'MM'-'dd'T'HH':'mm':'sso<G>", NodaFormatInfo.InvariantInfo, DefaultTemplateValue, LocalDatePattern.DefaultTwoDigitYearMax);
            internal static readonly OffsetDateTimePattern ExtendedIsoPatternImpl = Create("uuuu'-'MM'-'dd'T'HH':'mm':'ss;FFFFFFFFFo<G>", NodaFormatInfo.InvariantInfo, DefaultTemplateValue, LocalDatePattern.DefaultTwoDigitYearMax);
            internal static readonly OffsetDateTimePattern Rfc3339PatternImpl = Create("uuuu'-'MM'-'dd'T'HH':'mm':'ss;FFFFFFFFFo<Z+HH:mm>", NodaFormatInfo.InvariantInfo, DefaultTemplateValue, LocalDatePattern.DefaultTwoDigitYearMax);
            internal static readonly OffsetDateTimePattern FullRoundtripPatternImpl = Create("uuuu'-'MM'-'dd'T'HH':'mm':'ss;FFFFFFFFFo<G> '('c')'", NodaFormatInfo.InvariantInfo, DefaultTemplateValue, LocalDatePattern.DefaultTwoDigitYearMax);
            internal static readonly PatternBclSupport<OffsetDateTime> BclSupport = new PatternBclSupport<OffsetDateTime>("G", fi => fi.OffsetDateTimePatternParser);
        }

        private readonly IPattern<OffsetDateTime> pattern;

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
        public OffsetDateTime TemplateValue { get; }

        /// <summary>
        /// Maximum two-digit-year in the template to treat as the current century.
        /// If the value parsed is higher than this, the result is adjusted to the previous century.
        /// This value defaults to 30. To create a pattern with a different value, use <see cref="WithTwoDigitYearMax(int)"/>.
        /// </summary>
        /// <value>The value used for the maximum two-digit-year, in the range 0-99 inclusive.</value>
        public int TwoDigitYearMax { get; }

        private OffsetDateTimePattern(string patternText, NodaFormatInfo formatInfo, OffsetDateTime templateValue, int twoDigitYearMax,
            IPattern<OffsetDateTime> pattern)
        {
            this.PatternText = patternText;
            this.FormatInfo = formatInfo;
            this.TemplateValue = templateValue;
            this.TwoDigitYearMax = twoDigitYearMax;
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
        public ParseResult<OffsetDateTime> Parse([SpecialNullHandling] string text) => pattern.Parse(text);

        /// <summary>
        /// Formats the given offset date/time as text according to the rules of this pattern.
        /// </summary>
        /// <param name="value">The offset date/time to format.</param>
        /// <returns>The offset date/time formatted according to this pattern.</returns>
        public string Format(OffsetDateTime value) => pattern.Format(value);

        /// <summary>
        /// Formats the given value as text according to the rules of this pattern,
        /// appending to the given <see cref="StringBuilder"/>.
        /// </summary>
        /// <param name="value">The value to format.</param>
        /// <param name="builder">The <c>StringBuilder</c> to append to.</param>
        /// <returns>The builder passed in as <paramref name="builder"/>.</returns>
        public StringBuilder AppendFormat(OffsetDateTime value, StringBuilder builder) => pattern.AppendFormat(value, builder);

        /// <summary>
        /// Creates a pattern for the given pattern text, format info, and template value.
        /// </summary>
        /// <param name="patternText">Pattern text to create the pattern for</param>
        /// <param name="formatInfo">The format info to use in the pattern</param>
        /// <param name="templateValue">Template value to use for unspecified fields</param>
        /// <param name="twoDigitYearMax">Maximum two-digit-year in the template to treat as the current century.</param>
        /// <returns>A pattern for parsing and formatting offset date/times.</returns>
        /// <exception cref="InvalidPatternException">The pattern text was invalid.</exception>
        private static OffsetDateTimePattern Create(string patternText, NodaFormatInfo formatInfo,
            OffsetDateTime templateValue, int twoDigitYearMax)
        {
            Preconditions.CheckNotNull(patternText, nameof(patternText));
            Preconditions.CheckNotNull(formatInfo, nameof(formatInfo));
            var pattern = new OffsetDateTimePatternParser(templateValue, twoDigitYearMax).ParsePattern(patternText, formatInfo);
            return new OffsetDateTimePattern(patternText, formatInfo, templateValue, twoDigitYearMax, pattern);
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
        public static OffsetDateTimePattern Create(string patternText, [ValidatedNotNull] CultureInfo cultureInfo, OffsetDateTime templateValue) =>
            Create(patternText, NodaFormatInfo.GetFormatInfo(cultureInfo), templateValue, LocalDatePattern.DefaultTwoDigitYearMax);

        /// <summary>
        /// Creates a pattern for the given pattern text in the invariant culture, using the default
        /// template value of midnight January 1st 2000 at an offset of 0.
        /// </summary>
        /// <remarks>
        /// See the user guide for the available pattern text options.
        /// </remarks>
        /// <param name="patternText">Pattern text to create the pattern for</param>
        /// <returns>A pattern for parsing and formatting local date/times.</returns>
        /// <exception cref="InvalidPatternException">The pattern text was invalid.</exception>
        public static OffsetDateTimePattern CreateWithInvariantCulture(string patternText) =>
            Create(patternText, NodaFormatInfo.InvariantInfo, DefaultTemplateValue, LocalDatePattern.DefaultTwoDigitYearMax);

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
        /// <returns>A pattern for parsing and formatting local date/times.</returns>
        /// <exception cref="InvalidPatternException">The pattern text was invalid.</exception>
        public static OffsetDateTimePattern CreateWithCurrentCulture(string patternText) =>
            Create(patternText, NodaFormatInfo.CurrentInfo, DefaultTemplateValue, LocalDatePattern.DefaultTwoDigitYearMax);

        /// <summary>
        /// Creates a pattern for the same original localization information as this pattern, but with the specified
        /// pattern text.
        /// </summary>
        /// <param name="patternText">The pattern text to use in the new pattern.</param>
        /// <returns>A new pattern with the given pattern text.</returns>
        public OffsetDateTimePattern WithPatternText(string patternText) =>
            Create(patternText, FormatInfo, TemplateValue, TwoDigitYearMax);

        /// <summary>
        /// Creates a pattern for the same original pattern text as this pattern, but with the specified
        /// localization information.
        /// </summary>
        /// <param name="formatInfo">The localization information to use in the new pattern.</param>
        /// <returns>A new pattern with the given localization information.</returns>
        private OffsetDateTimePattern WithFormatInfo(NodaFormatInfo formatInfo) =>
            Create(PatternText, formatInfo, TemplateValue, TwoDigitYearMax);

        /// <summary>
        /// Creates a pattern for the same original pattern text as this pattern, but with the specified
        /// culture.
        /// </summary>
        /// <param name="cultureInfo">The culture to use in the new pattern.</param>
        /// <returns>A new pattern with the given culture.</returns>
        public OffsetDateTimePattern WithCulture([ValidatedNotNull] CultureInfo cultureInfo) =>
            WithFormatInfo(NodaFormatInfo.GetFormatInfo(cultureInfo));

        /// <summary>
        /// Creates a pattern for the same original pattern text and culture as this pattern, but with
        /// the specified template value.
        /// </summary>
        /// <param name="newTemplateValue">The template value to use in the new pattern.</param>
        /// <returns>A new pattern with the given template value.</returns>
        public OffsetDateTimePattern WithTemplateValue(OffsetDateTime newTemplateValue) =>
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
        public OffsetDateTimePattern WithCalendar(CalendarSystem calendar) =>
            WithTemplateValue(TemplateValue.WithCalendar(calendar));

        /// <summary>
        /// Creates a pattern like this one, but with a different <see cref="TwoDigitYearMax"/> value.
        /// </summary>
        /// <param name="twoDigitYearMax">The value to use for <see cref="TwoDigitYearMax"/> in the new pattern, in the range 0-99 inclusive.</param>
        /// <returns>A new pattern with the specified maximum two-digit-year.</returns>
        public OffsetDateTimePattern WithTwoDigitYearMax(int twoDigitYearMax) =>
            Create(PatternText, FormatInfo, TemplateValue, twoDigitYearMax);
    }
}
