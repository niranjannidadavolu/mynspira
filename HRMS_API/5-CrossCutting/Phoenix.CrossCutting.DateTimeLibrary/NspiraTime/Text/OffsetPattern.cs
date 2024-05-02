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
    /// Represents a pattern for parsing and formatting <see cref="Offset"/> values.
    /// </summary>
    /// <threadsafety>
    /// When used with a read-only <see cref="CultureInfo" />, this type is immutable and instances
    /// may be shared freely between threads. We recommend only using read-only cultures for patterns, although this is
    /// not currently enforced.
    /// </threadsafety>
    [Immutable] // Well, assuming an immutable culture...
    public sealed class OffsetPattern : IPattern<Offset>
    {
        /// <summary>
        /// The "general" offset pattern (e.g. +HH, +HH:mm, +HH:mm:ss, +HH:mm:ss.fff) for the invariant culture.
        /// </summary>
        /// <value>The "general" offset pattern for the invariant culture.</value>
        public static OffsetPattern GeneralInvariant { get; } = CreateWithInvariantCulture("g");

        /// <summary>
        /// The "general" offset pattern (e.g. +HH, +HH:mm, +HH:mm:ss, +HH:mm:ss.fff) for the invariant culture,
        /// but producing (and allowing) Z as a value for a zero offset.
        /// </summary>
        /// <value>The "general" offset pattern for the invariant culture but producing (and allowing) Z as a value for a zero offset.</value>
        public static OffsetPattern GeneralInvariantWithZ { get; } = CreateWithInvariantCulture("G");

        private const string DefaultFormatPattern = "g";

        internal static readonly PatternBclSupport<Offset> BclSupport = new PatternBclSupport<Offset>(DefaultFormatPattern, fi => fi.OffsetPatternParser);

        /// <summary>
        /// Gets the pattern text for this pattern, as supplied on creation.
        /// </summary>
        /// <value>The pattern text for this pattern, as supplied on creation.</value>
        public string PatternText { get; }

        /// <summary>
        /// Returns the pattern that this object delegates to. Mostly useful to avoid this public class
        /// implementing an internal interface.
        /// </summary>
        internal IPartialPattern<Offset> UnderlyingPattern { get; }

        private OffsetPattern(string patternText, IPartialPattern<Offset> pattern)
        {
            this.PatternText = patternText;
            this.UnderlyingPattern = pattern;
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
        public ParseResult<Offset> Parse([SpecialNullHandling] string text) => UnderlyingPattern.Parse(text);

        /// <summary>
        /// Formats the given offset as text according to the rules of this pattern.
        /// </summary>
        /// <param name="value">The offset to format.</param>
        /// <returns>The offset formatted according to this pattern.</returns>
        public string Format(Offset value) => UnderlyingPattern.Format(value);

        /// <summary>
        /// Formats the given value as text according to the rules of this pattern,
        /// appending to the given <see cref="StringBuilder"/>.
        /// </summary>
        /// <param name="value">The value to format.</param>
        /// <param name="builder">The <c>StringBuilder</c> to append to.</param>
        /// <returns>The builder passed in as <paramref name="builder"/>.</returns>
        public StringBuilder AppendFormat(Offset value, StringBuilder builder) => UnderlyingPattern.AppendFormat(value, builder);

        /// <summary>
        /// Creates a pattern for the given pattern text and format info.
        /// </summary>
        /// <param name="patternText">Pattern text to create the pattern for</param>
        /// <param name="formatInfo">Localization information</param>
        /// <returns>A pattern for parsing and formatting offsets.</returns>
        /// <exception cref="InvalidPatternException">The pattern text was invalid.</exception>
        internal static OffsetPattern Create(string patternText, NodaFormatInfo formatInfo)
        {
            Preconditions.CheckNotNull(patternText, nameof(patternText));
            Preconditions.CheckNotNull(formatInfo, nameof(formatInfo));
            var pattern = (IPartialPattern<Offset>) formatInfo.OffsetPatternParser.ParsePattern(patternText);
            return new OffsetPattern(patternText, pattern);
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
        public static OffsetPattern Create(string patternText, [ValidatedNotNull] CultureInfo cultureInfo) =>
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
        public static OffsetPattern CreateWithCurrentCulture(string patternText) =>
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
        public static OffsetPattern CreateWithInvariantCulture(string patternText) =>
            Create(patternText, NodaFormatInfo.InvariantInfo);

        /// <summary>
        /// Creates a pattern for the same original pattern text as this pattern, but with the specified
        /// culture.
        /// </summary>
        /// <param name="cultureInfo">The culture to use in the new pattern.</param>
        /// <returns>A new pattern with the given culture.</returns>
        public OffsetPattern WithCulture([ValidatedNotNull] CultureInfo cultureInfo) =>
            Create(PatternText, NodaFormatInfo.GetFormatInfo(cultureInfo));
    }
}
