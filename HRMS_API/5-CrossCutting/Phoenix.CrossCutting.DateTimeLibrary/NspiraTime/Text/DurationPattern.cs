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
    /// Represents a pattern for parsing and formatting <see cref="Duration"/> values.
    /// </summary>
    /// <threadsafety>
    /// When used with a read-only <see cref="CultureInfo" />, this type is immutable and instances
    /// may be shared freely between threads. We recommend only using read-only cultures for patterns, although this is
    /// not currently enforced.
    /// </threadsafety>
    [Immutable] // Well, assuming an immutable culture...
    public sealed class DurationPattern : IPattern<Duration>
    {
        /// <summary>
        /// Gets the general pattern for durations using the invariant culture, with a format string of "-D:hh:mm:ss.FFFFFFFFF".
        /// This pattern round-trips. This corresponds to the "o" standard pattern.
        /// </summary>
        /// <value>The general pattern for durations using the invariant culture.</value>
        public static DurationPattern Roundtrip => Patterns.RoundtripPatternImpl;

        /// <summary>
        /// Gets a pattern for durations using the invariant culture, with a format string of "-H:mm:ss.FFFFFFFFF".
        /// This pattern round-trips, and is the pattern that NodaTime.Serialization.JsonNet uses by default.
        /// This corresponds to the "j" standard pattern.
        /// </summary>
        /// <value>The pattern for durations using the invariant culture. This is the pattern that NodaTime.Serialization.JsonNet uses by default.</value>
        public static DurationPattern JsonRoundtrip => Patterns.JsonRoundtripPatternImpl;

        internal static readonly PatternBclSupport<Duration> BclSupport = new PatternBclSupport<Duration>("o", fi => fi.DurationPatternParser);

        // Nested class for ease of type initialization
        internal static class Patterns
        {
            internal static readonly DurationPattern RoundtripPatternImpl = CreateWithInvariantCulture("-D:hh:mm:ss.FFFFFFFFF");
            internal static readonly DurationPattern JsonRoundtripPatternImpl = CreateWithInvariantCulture("-H:mm:ss.FFFFFFFFF");
        }

        private readonly IPattern<Duration> pattern;

        /// <summary>
        /// Gets the pattern text for this pattern, as supplied on creation.
        /// </summary>
        /// <value>The pattern text for this pattern, as supplied on creation.</value>
        public string PatternText { get; }

        private DurationPattern(string patternText, IPattern<Duration> pattern)
        {
            this.PatternText = patternText;
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
        public ParseResult<Duration> Parse([SpecialNullHandling] string text) => pattern.Parse(text);

        /// <summary>
        /// Formats the given duration as text according to the rules of this pattern.
        /// </summary>
        /// <param name="value">The duration to format.</param>
        /// <returns>The duration formatted according to this pattern.</returns>
        public string Format(Duration value) => pattern.Format(value);

        /// <summary>
        /// Formats the given value as text according to the rules of this pattern,
        /// appending to the given <see cref="StringBuilder"/>.
        /// </summary>
        /// <param name="value">The value to format.</param>
        /// <param name="builder">The <c>StringBuilder</c> to append to.</param>
        /// <returns>The builder passed in as <paramref name="builder"/>.</returns>
        public StringBuilder AppendFormat(Duration value, StringBuilder builder) => pattern.AppendFormat(value, builder);

        /// <summary>
        /// Creates a pattern for the given pattern text and format info.
        /// </summary>
        /// <param name="patternText">Pattern text to create the pattern for</param>
        /// <param name="formatInfo">Localization information</param>
        /// <returns>A pattern for parsing and formatting offsets.</returns>
        /// <exception cref="InvalidPatternException">The pattern text was invalid.</exception>
        private static DurationPattern Create(string patternText, NodaFormatInfo formatInfo)
        {
            Preconditions.CheckNotNull(patternText, nameof(patternText));
            Preconditions.CheckNotNull(formatInfo, nameof(formatInfo));
            var pattern = formatInfo.DurationPatternParser.ParsePattern(patternText);
            return new DurationPattern(patternText, pattern);
        }

        /// <summary>
        /// Creates a pattern for the given pattern text and culture.
        /// </summary>
        /// <remarks>
        /// See the user guide for the available pattern text options.
        /// </remarks>
        /// <param name="patternText">Pattern text to create the pattern for</param>
        /// <param name="cultureInfo">The culture to use in the pattern</param>
        /// <returns>A pattern for parsing and formatting offsets.</returns>
        /// <exception cref="InvalidPatternException">The pattern text was invalid.</exception>
        public static DurationPattern Create(string patternText, [ValidatedNotNull] CultureInfo cultureInfo) =>
            Create(patternText, NodaFormatInfo.GetFormatInfo(cultureInfo));

        /// <summary>
        /// Creates a pattern for the given pattern text in the current thread's current culture.
        /// </summary>
        /// <remarks>
        /// See the user guide for the available pattern text options. Note that the current culture
        /// is captured at the time this method is called - it is not captured at the point of parsing
        /// or formatting values.
        /// </remarks>
        /// <param name="patternText">Pattern text to create the pattern for</param>
        /// <returns>A pattern for parsing and formatting offsets.</returns>
        /// <exception cref="InvalidPatternException">The pattern text was invalid.</exception>
        public static DurationPattern CreateWithCurrentCulture(string patternText) =>
            Create(patternText, NodaFormatInfo.CurrentInfo);

        /// <summary>
        /// Creates a pattern for the given pattern text in the invariant culture.
        /// </summary>
        /// <remarks>
        /// See the user guide for the available pattern text options. Note that the current culture
        /// is captured at the time this method is called - it is not captured at the point of parsing
        /// or formatting values.
        /// </remarks>
        /// <param name="patternText">Pattern text to create the pattern for</param>
        /// <returns>A pattern for parsing and formatting offsets.</returns>
        /// <exception cref="InvalidPatternException">The pattern text was invalid.</exception>
        public static DurationPattern CreateWithInvariantCulture(string patternText) =>
            Create(patternText, NodaFormatInfo.InvariantInfo);

        /// <summary>
        /// Creates a pattern for the same original pattern text as this pattern, but with the specified
        /// culture.
        /// </summary>
        /// <param name="cultureInfo">The culture to use in the new pattern.</param>
        /// <returns>A new pattern with the given culture.</returns>
        public DurationPattern WithCulture([ValidatedNotNull] CultureInfo cultureInfo) =>
            Create(PatternText, NodaFormatInfo.GetFormatInfo(cultureInfo));
    }
}
