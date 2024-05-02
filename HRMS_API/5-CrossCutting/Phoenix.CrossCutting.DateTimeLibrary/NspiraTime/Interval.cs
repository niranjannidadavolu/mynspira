// Copyright 2009 The Noda Time Authors. All rights reserved.
// Use of this source code is governed by the Apache License 2.0,
// as found in the LICENSE.txt file.

using System.Runtime.CompilerServices;
using System.Xml;
using System.Xml.Schema;
using System.Xml.Serialization;
using JetBrains.Annotations;
using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Text;
using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Utility;

namespace Phoenix.CrossCutting.DateTimeLibrary.NspiraTime
{
    /// <summary>
    /// An interval between two instants in time (start and end).
    /// </summary>
    /// <remarks>
    /// <para>
    /// Equality is defined in a component-wise fashion: two intervals are considered equal if their start instants are
    /// equal to each other and their end instants are equal to each other. Ordering between intervals is not defined.
    /// </para>
    /// <para>
    /// The interval includes the start instant and excludes the end instant. However, an interval
    /// may be missing its start or end, in which case the interval is deemed to be infinite in that
    /// direction.
    /// </para>
    /// <para>
    /// The end may equal the start (resulting in an empty interval), but will not be before the start.
    /// </para>
    /// <para>The default value of this type is an empty interval with a start and end of
    /// <see cref="NodaConstants.UnixEpoch"/>.</para>
    /// </remarks>
    /// <threadsafety>This type is an immutable value type. See the thread safety section of the user guide for more information.</threadsafety>
    [XmlSchemaProvider(nameof(AddSchema))]
    public readonly struct Interval : IEquatable<Interval>, IXmlSerializable
    {
        /// <summary>The start of the interval.</summary>
        private readonly Instant start;

        /// <summary>The end of the interval. This will never be earlier than the start.</summary>
        private readonly Instant end;

        /// <summary>
        /// Initializes a new instance of the <see cref="Interval"/> struct.
        /// The interval includes the <paramref name="start"/> instant and excludes the
        /// <paramref name="end"/> instant. The end may equal the start (resulting in an empty interval), but must not be before the start.
        /// </summary>
        /// <exception cref="ArgumentOutOfRangeException"><paramref name="end"/> is earlier than <paramref name="start"/>.</exception>
        /// <param name="start">The start <see cref="Instant"/>.</param>
        /// <param name="end">The end <see cref="Instant"/>.</param>
        public Interval(Instant start, Instant end)
        {
            if (end < start)
            {
                throw new ArgumentOutOfRangeException(nameof(end), "The end parameter must be equal to or later than the start parameter");
            }
            this.start = start;
            this.end = end;
        }

        /// <summary>
        /// Initializes a new instance of the <see cref="Interval"/> struct from two nullable <see cref="Instant"/>
        /// values.
        /// </summary>
        /// <remarks>
        /// If the start is null, the interval is deemed to stretch to the start of time. If the end is null,
        /// the interval is deemed to stretch to the end of time.
        /// </remarks>
        /// <exception cref="ArgumentOutOfRangeException"><paramref name="end"/> is earlier than <paramref name="start"/>,
        /// if they are both non-null.</exception>
        /// <param name="start">The start <see cref="Instant"/> or null.</param>
        /// <param name="end">The end <see cref="Instant"/> or null.</param>
        public Interval(Instant? start, Instant? end)
        {
            this.start = start ?? Instant.BeforeMinValue;
            this.end = end ?? Instant.AfterMaxValue;
            if (end < start)
            {
                throw new ArgumentOutOfRangeException(nameof(end), "The end parameter must be equal to or later than the start parameter");
            }
        }

        /// <summary>
        /// Gets the start instant - the inclusive lower bound of the interval.
        /// </summary>
        /// <remarks>
        /// This will never be later than <see cref="End"/>, though it may be equal to it.
        /// </remarks>
        /// <value>The start <see cref="Instant"/>.</value>
        /// <exception cref="InvalidOperationException">The interval extends to the start of time.</exception>
        /// <seealso cref="HasStart"/>
        public Instant Start
        {
            get
            {
                Preconditions.CheckState(start.IsValid, "Interval extends to start of time");
                return start;
            }
        }

        /// <summary>
        /// Returns <c>true</c> if this interval has a fixed start point, or <c>false</c> if it
        /// extends to the start of time.
        /// </summary>
        /// <value><c>true</c> if this interval has a fixed start point, or <c>false</c> if it
        /// extends to the start of time.</value>
        public bool HasStart => start.IsValid;

        /// <summary>
        /// Gets the end instant - the exclusive upper bound of the interval.
        /// </summary>
        /// <value>The end <see cref="Instant"/>.</value>
        /// <exception cref="InvalidOperationException">The interval extends to the end of time.</exception>
        /// <seealso cref="HasEnd"/>
        public Instant End
        {
            get
            {
                Preconditions.CheckState(end.IsValid, "Interval extends to end of time");
                return end;
            }
        }

        /// <summary>
        /// Returns the raw end value of the interval: a normal instant or <see cref="Instant.AfterMaxValue"/>.
        /// This value should never be exposed.
        /// </summary>
        internal Instant RawEnd => end;

        /// <summary>
        /// Returns <c>true</c> if this interval has a fixed end point, or <c>false</c> if it
        /// extends to the end of time.
        /// </summary>
        /// <value><c>true</c> if this interval has a fixed end point, or <c>false</c> if it
        /// extends to the end of time.</value>
        public bool HasEnd => end.IsValid;

        /// <summary>
        /// Returns the duration of the interval.
        /// </summary>
        /// <remarks>
        /// This will always be a non-negative duration, though it may be zero.
        /// </remarks>
        /// <value>The duration of the interval.</value>
        /// <exception cref="InvalidOperationException">The interval extends to the start or end of time.</exception>
        public Duration Duration => End - Start;

        /// <summary>
        /// Returns whether or not this interval contains the given instant.
        /// </summary>
        /// <param name="instant">Instant to test.</param>
        /// <returns>True if this interval contains the given instant; false otherwise.</returns>
        [Pure]
        public bool Contains(Instant instant) => instant >= start && instant < end;

        /// <summary>
        /// Deconstruct this value into its components.
        /// </summary>
        /// <param name="start">The start of the interval.</param>
        /// <param name="end">The end of the interval.</param>
        [Pure]
        public void Deconstruct(out Instant? start, out Instant? end)
        {
            start = this.start.IsValid ? Start : (Instant?) null;
            end = this.end.IsValid ? End : (Instant?) null;
        }

        #region Implementation of IEquatable<Interval>
        /// <summary>
        /// Indicates whether the value of this interval is equal to the value of the specified interval.
        /// See the type documentation for a description of equality semantics.
        /// </summary>
        /// <param name="other">The value to compare with this instance.</param>
        /// <returns>
        /// true if the value of this instant is equal to the value of the <paramref name="other" /> parameter;
        /// otherwise, false.
        /// </returns>
        public bool Equals(Interval other) => start == other.start && end == other.end;
        #endregion

        #region object overrides

        /// <summary>
        /// Determines whether the specified <see cref="System.Object" /> is equal to this instance.
        /// See the type documentation for a description of equality semantics.
        /// </summary>
        /// <param name="obj">The <see cref="System.Object" /> to compare with this instance.</param>
        /// <returns>
        /// <c>true</c> if the specified <see cref="System.Object" /> is equal to this instance;
        /// otherwise, <c>false</c>.
        /// </returns>
        public override bool Equals(object? obj) => obj is Interval other && Equals(other);

        /// <summary>
        /// Returns the hash code for this instance.
        /// See the type documentation for a description of equality semantics.
        /// </summary>
        /// <returns>
        /// A 32-bit signed integer that is the hash code for this instance.
        /// </returns>
        /// <filterpriority>2</filterpriority>
        public override int GetHashCode() => HashCodeHelper.Hash(start, end);

        /// <summary>
        /// Returns a string representation of this interval, in extended ISO-8601 format: the format
        /// is "start/end" where each instant uses a format of "uuuu'-'MM'-'dd'T'HH':'mm':'ss;FFFFFFFFF'Z'".
        /// If the start or end is infinite, the relevant part uses "StartOfTime" or "EndOfTime" to
        /// represent this.
        /// </summary>
        /// <returns>A string representation of this interval.</returns>
        public override string ToString()
        {
            var pattern = InstantPattern.ExtendedIso;
            return $"{pattern.Format(start)}/{pattern.Format(end)}";
        }
        #endregion

        #region Operators
        /// <summary>
        /// Implements the operator ==.
        /// See the type documentation for a description of equality semantics.
        /// </summary>
        /// <param name="left">The left.</param>
        /// <param name="right">The right.</param>
        /// <returns>The result of the operator.</returns>
        public static bool operator ==(Interval left, Interval right) => left.Equals(right);

        /// <summary>
        /// Implements the operator !=.
        /// See the type documentation for a description of equality semantics.
        /// </summary>
        /// <param name="left">The left.</param>
        /// <param name="right">The right.</param>
        /// <returns>The result of the operator.</returns>
        public static bool operator !=(Interval left, Interval right) => !(left == right);
        #endregion

        #region XML serialization
        /// <summary>
        /// Adds the XML schema type describing the structure of the <see cref="Interval"/> XML serialization to the given <paramref name="xmlSchemaSet"/>.
        /// </summary>
        /// <param name="xmlSchemaSet">The XML schema set provided by <see cref="XmlSchemaExporter"/>.</param>
        /// <returns>The qualified name of the schema type that was added to the <paramref name="xmlSchemaSet"/>.</returns>
        public static XmlQualifiedName AddSchema(XmlSchemaSet xmlSchemaSet) => Xml.XmlSchemaDefinition.AddIntervalSchemaType(xmlSchemaSet);

        /// <inheritdoc />
        XmlSchema IXmlSerializable.GetSchema() => null!; // TODO(nullable): Return XmlSchema? when docfx works with that

        /// <inheritdoc />
        void IXmlSerializable.ReadXml(XmlReader reader)
        {
            Preconditions.CheckNotNull(reader, nameof(reader));
            var pattern = InstantPattern.ExtendedIso;
            Instant newStart = reader.MoveToAttribute("start") ? pattern.Parse(reader.Value).Value : Instant.BeforeMinValue;
            Instant newEnd = reader.MoveToAttribute("end") ? pattern.Parse(reader.Value).Value : Instant.AfterMaxValue;
            Unsafe.AsRef(this) = new Interval(newStart, newEnd);
            // Consume the rest of this element, as per IXmlSerializable.ReadXml contract.
            reader.Skip();
        }

        /// <inheritdoc />
        void IXmlSerializable.WriteXml(XmlWriter writer)
        {
            Preconditions.CheckNotNull(writer, nameof(writer));
            var pattern = InstantPattern.ExtendedIso;
            if (HasStart)
            {
                writer.WriteAttributeString("start", pattern.Format(start));
            }
            if (HasEnd)
            {
                writer.WriteAttributeString("end", pattern.Format(end));
            }
        }
        #endregion
    }
}
