﻿// Copyright 2015 The Noda Time Authors. All rights reserved.
// Use of this source code is governed by the Apache License 2.0,
// as found in the LICENSE.txt file.

using System.ComponentModel;
using System.Globalization;
using System.Runtime.CompilerServices;
using System.Xml;
using System.Xml.Schema;
using System.Xml.Serialization;
using JetBrains.Annotations;
using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Calendars;
using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Text;
using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Utility;

namespace Phoenix.CrossCutting.DateTimeLibrary.NspiraTime
{
    /// <summary>
    /// Represents an annual date (month and day) in the ISO calendar but without a specific year,
    /// typically for recurrent events such as birthdays, anniversaries, and deadlines.
    /// </summary>
    /// <remarks>
    /// <para>
    /// Equality and comparison order are defined in the natural way. Two values are equal if they
    /// represent the same month and the same day-of-month. One value is earlier than another if it
    /// has a smaller month, or the same month but an earlier day-of-month.
    /// </para>
    /// <para>
    /// In the future, this struct may be expanded to support other calendar systems,
    /// but this does not generalize terribly cleanly, particularly to the Hebrew calendar system
    /// with its leap month.
    /// </para>
    /// <para>The default value of this type is January 1st.</para>
    /// </remarks>
    [TypeConverter(typeof(AnnualDateTypeConverter))]
    [XmlSchemaProvider(nameof(AddSchema))]
    public readonly struct AnnualDate : IEquatable<AnnualDate>, IComparable<AnnualDate>, IComparable, IFormattable, IXmlSerializable
    {
        // The underlying value. We only care about the month and day, but for the sake of
        // compatibility with the default value, this ends up being in year 1. This would
        // be an invalid date, but we only actually use it as an argument to SetYear,
        // which we know ignores the year in the ISO calendar. If we ever allow other calendar
        // systems, we can have a YearMonthDayCalendar which would still be in year 1 for the
        // ISO calendar, but would probably be in a more suitable year for other calendars.
        private readonly YearMonthDay value;

        /// <summary>
        /// Constructs an instance for the given month and day in the ISO calendar.
        /// </summary>
        /// <param name="month">The month of year.</param>
        /// <param name="day">The day of month.</param>
        /// <exception cref="ArgumentOutOfRangeException">The parameters do not form a valid date.
        /// (February 29th is considered valid.)</exception>
        public AnnualDate(int month, int day)
        {
            // The year 2000 is a leap year, so this is fine for all valid dates.
            GregorianYearMonthDayCalculator.ValidateGregorianYearMonthDay(2000, month, day);
            // See comment above for why this is using year 1, and why that's okay even for February 29th.
            value = new YearMonthDay(1, month, day);
        }

        /// <summary>
        /// Gets the month of year.
        /// </summary>
        /// <value>The month of year.</value>
        public int Month => value.Month;

        /// <summary>
        /// Gets the day of month.
        /// </summary>
        /// <value>The day of month.</value>
        public int Day => value.Day;

        /// <summary>
        /// Returns this annual date in a particular year, as a <see cref="LocalDate"/>.
        /// </summary>
        /// <remarks>
        /// <para>
        /// If this value represents February 29th, and the specified year is not a leap
        /// year, the returned value will be February 28th of that year. To see whether the
        /// original month and day is valid without truncation in a particular year,
        /// use <see cref="IsValidYear"/>
        /// </para>
        /// </remarks>
        /// <param name="year">The year component of the required date.</param>
        /// <returns>A date in the given year, suitable for this annual date.</returns>
        [Pure]
        public LocalDate InYear(int year)
        {
            Preconditions.CheckArgumentRange(nameof(year), year,
                GregorianYearMonthDayCalculator.MinGregorianYear,
                GregorianYearMonthDayCalculator.MaxGregorianYear);
            var ymd = CalendarSystem.Iso.YearMonthDayCalculator.SetYear(value, year);
            return new LocalDate(ymd.WithCalendarOrdinal(0)); // ISO calendar
        }

        /// <summary>
        /// Checks whether the specified year forms a valid date with the month/day in this
        /// value, without any truncation. This will always return <c>true</c> except
        /// for values representing February 29th, where the specified year is a non leap year.
        /// </summary>
        /// <param name="year">The year to test for validity</param>
        /// <returns><c>true</c> if the current value occurs within the given year;
        /// <c>false</c> otherwise.</returns>
        [Pure]
        public bool IsValidYear(int year) => Month != 2 || Day != 29 || CalendarSystem.Iso.IsLeapYear(year);

        /// <summary>
        /// Compares this annual date with the specified reference.
        /// See the type documentation for a description of equality semantics.
        /// </summary>
        /// <param name="obj">The object to compare this one with</param>
        /// <returns>True if the specified value is an annual date which is equal to this one; false otherwise</returns>
        public override bool Equals(object? obj) => obj is AnnualDate other && Equals(other);

        /// <summary>
        /// Returns a hash code for this annual date.
        /// See the type documentation for a description of equality semantics.
        /// </summary>
        /// <returns>A hash code for this annual date.</returns>
        public override int GetHashCode() => value.GetHashCode();

        /// <summary>
        /// Returns a <see cref="System.String" /> that represents this instance.
        /// </summary>
        /// <returns>
        /// The value of the current instance in the default format pattern ("G").
        /// </returns>
        public override string ToString() => AnnualDatePattern.BclSupport.Format(this, null, CultureInfo.CurrentCulture);

        /// <summary>
        /// Formats the value of the current instance using the specified pattern.
        /// </summary>
        /// <returns>
        /// A <see cref="System.String" /> containing the value of the current instance in the specified format.
        /// </returns>
        /// <param name="patternText">The <see cref="System.String" /> specifying the pattern to use,
        /// or null to use the default format pattern ("G").
        /// </param>
        /// <param name="formatProvider">The <see cref="System.IFormatProvider" /> to use when formatting the value,
        /// or null to use the current thread's culture to obtain a format provider.
        /// </param>
        /// <filterpriority>2</filterpriority>
        public string ToString(string? patternText, IFormatProvider? formatProvider) =>
            AnnualDatePattern.BclSupport.Format(this, patternText, formatProvider);

        /// <summary>
        /// Compares this annual date with the specified one for equality.
        /// See the type documentation for a description of equality semantics.
        /// </summary>
        /// <param name="other">The other annual date to compare this one with</param>
        /// <returns>True if the specified annual date is equal to this one; false otherwise</returns>
        public bool Equals(AnnualDate other) => value == other.value;

        /// <summary>
        /// Indicates whether this annual date is earlier, later or the same as another one.
        /// See the type documentation for a description of ordering semantics.
        /// </summary>
        /// <param name="other">The other annual date to compare this one with</param>
        /// <returns>A value less than zero if this annual date is earlier than <paramref name="other"/>;
        /// zero if this time is the same as <paramref name="other"/>; a value greater than zero if this annual date is
        /// later than <paramref name="other"/>.</returns>
        public int CompareTo(AnnualDate other) => value.CompareTo(other.value);


        /// <summary>
        /// Implementation of <see cref="IComparable.CompareTo"/> to compare two AnnualDates.
        /// See the type documentation for a description of ordering semantics.
        /// </summary>
        /// <remarks>
        /// This uses explicit interface implementation to avoid it being called accidentally. The generic implementation should usually be preferred.
        /// </remarks>
        /// <exception cref="ArgumentException"><paramref name="obj"/> is non-null but does not refer to an instance of <see cref="AnnualDate"/></exception>
        /// <param name="obj">The object to compare this value with.</param>
        /// <returns>The result of comparing this AnnualDate with another one.
        /// If <paramref name="obj"/> is null, this method returns a value greater than 0.
        /// </returns>
        public int CompareTo(object? obj)
        {
            if (obj is null)
            {
                return 1;
            }
            Preconditions.CheckArgument(obj is AnnualDate, nameof(obj), "Object must be of type NodaTime.AnnualDate.");
            return CompareTo((AnnualDate)obj);
        }

        /// <summary>
        /// Compares two <see cref="AnnualDate" /> values for equality.
        /// See the type documentation for a description of equality semantics.
        /// </summary>
        /// <param name="lhs">The first value to compare</param>
        /// <param name="rhs">The second value to compare</param>
        /// <returns>True if the two dates are the same; false otherwise</returns>
        public static bool operator ==(AnnualDate lhs, AnnualDate rhs) => lhs.value == rhs.value;

        /// <summary>
        /// Compares two <see cref="AnnualDate" /> values for inequality.
        /// See the type documentation for a description of equality semantics.
        /// </summary>
        /// <param name="lhs">The first value to compare</param>
        /// <param name="rhs">The second value to compare</param>
        /// <returns>False if the two dates are the same and in the same calendar; true otherwise</returns>
        public static bool operator !=(AnnualDate lhs, AnnualDate rhs) => !(lhs == rhs);

        /// <summary>
        /// Compares two annual dates to see if the left one is strictly earlier than the right one.
        /// See the type documentation for a description of ordering semantics.
        /// </summary>
        /// <param name="lhs">First operand of the comparison</param>
        /// <param name="rhs">Second operand of the comparison</param>
        /// <exception cref="ArgumentException">The calendar system of <paramref name="rhs"/> is not the same
        /// as the calendar of <paramref name="lhs"/>.</exception>
        /// <returns>true if the <paramref name="lhs"/> is strictly earlier than <paramref name="rhs"/>, false otherwise.</returns>
        public static bool operator <(AnnualDate lhs, AnnualDate rhs) => lhs.CompareTo(rhs) < 0;

        /// <summary>
        /// Compares two annual dates to see if the left one is earlier than or equal to the right one.
        /// See the type documentation for a description of ordering semantics.
        /// </summary>
        /// <param name="lhs">First operand of the comparison</param>
        /// <param name="rhs">Second operand of the comparison</param>
        /// <returns>true if the <paramref name="lhs"/> is earlier than or equal to <paramref name="rhs"/>, false otherwise.</returns>
        public static bool operator <=(AnnualDate lhs, AnnualDate rhs) => lhs.CompareTo(rhs) <= 0;

        /// <summary>
        /// Compares two annual dates to see if the left one is strictly later than the right one.
        /// See the type documentation for a description of ordering semantics.
        /// </summary>
        /// <param name="lhs">First operand of the comparison</param>
        /// <param name="rhs">Second operand of the comparison</param>
        /// <returns>true if the <paramref name="lhs"/> is strictly later than <paramref name="rhs"/>, false otherwise.</returns>
        public static bool operator >(AnnualDate lhs, AnnualDate rhs) => lhs.CompareTo(rhs) > 0;

        /// <summary>
        /// Compares two annual dates to see if the left one is later than or equal to the right one.
        /// See the type documentation for a description of ordering semantics.
        /// </summary>
        /// <param name="lhs">First operand of the comparison</param>
        /// <param name="rhs">Second operand of the comparison</param>
        /// <returns>true if the <paramref name="lhs"/> is later than or equal to <paramref name="rhs"/>, false otherwise.</returns>
        public static bool operator >=(AnnualDate lhs, AnnualDate rhs) => lhs.CompareTo(rhs) >= 0;

        #region XML serialization
        /// <summary>
        /// Adds the XML schema type describing the structure of the <see cref="AnnualDate"/> XML serialization to the given <paramref name="xmlSchemaSet"/>.
        /// </summary>
        /// <param name="xmlSchemaSet">The XML schema set provided by <see cref="XmlSchemaExporter"/>.</param>
        /// <returns>The qualified name of the schema type that was added to the <paramref name="xmlSchemaSet"/>.</returns>
        public static XmlQualifiedName AddSchema(XmlSchemaSet xmlSchemaSet) => Xml.XmlSchemaDefinition.AddAnnualDateSchemaType(xmlSchemaSet);

        /// <inheritdoc />
        XmlSchema IXmlSerializable.GetSchema() => null!; // TODO(nullable): Return XmlSchema? when docfx works with that

        /// <inheritdoc />
        void IXmlSerializable.ReadXml(XmlReader reader)
        {
            Preconditions.CheckNotNull(reader, nameof(reader));
            var pattern = AnnualDatePattern.Iso;
            string text = reader.ReadElementContentAsString();
            Unsafe.AsRef(this) = pattern.Parse(text).Value;
        }

        /// <inheritdoc />
        void IXmlSerializable.WriteXml(XmlWriter writer)
        {
            Preconditions.CheckNotNull(writer, nameof(writer));
            writer.WriteString(AnnualDatePattern.Iso.Format(this));
        }
        #endregion
    }
}
