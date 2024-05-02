// Copyright 2012 The Noda Time Authors. All rights reserved.
// Use of this source code is governed by the Apache License 2.0,
// as found in the LICENSE.txt file.

using System.ComponentModel;
using System.Globalization;
using System.Runtime.CompilerServices;
using System.Xml;
using System.Xml.Schema;
using System.Xml.Serialization;
using JetBrains.Annotations;
using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Annotations;
using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Calendars;
using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Text;
using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Utility;
using static Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.NodaConstants;

// Do not nest type X.
// The rule is somewhat subjective, but more importantly these have been available
// publicly for a while, so we can't change them now anyway.
#pragma warning disable CA1034

namespace Phoenix.CrossCutting.DateTimeLibrary.NspiraTime
{
    /// <summary>
    /// A local date and time in a particular calendar system, combined with an offset from UTC. This is
    /// broadly similar to <see cref="DateTimeOffset" /> in the BCL.
    /// </summary>
    /// <remarks>
    /// <para>
    /// Equality is defined in a component-wise fashion: two values are the same if they represent equal date/time values
    /// (including being in the same calendar) and equal offsets from UTC.
    /// Ordering between offset date/time values has no natural definition; see <see cref="Comparer"/> for built-in comparers.
    /// </para>
    /// <para>
    /// A value of this type unambiguously represents both a local time and an instant on the timeline,
    /// but does not have a well-defined time zone. This means you cannot reliably know what the local
    /// time would be five minutes later, for example. While this doesn't sound terribly useful, it's very common
    /// in text representations.
    /// </para>
    /// <para>The default value of this type is 0001-01-01T00:00:00Z (midnight on January 1st, 1 C.E. with a UTC offset of 0) in the ISO calendar.</para>
    /// </remarks>
    /// <threadsafety>This type is an immutable value type. See the thread safety section of the user guide for more information.</threadsafety>
    [TypeConverter(typeof(OffsetDateTimeTypeConverter))]
    [XmlSchemaProvider(nameof(AddSchema))]
    public readonly struct OffsetDateTime : IEquatable<OffsetDateTime>, IFormattable, IXmlSerializable
    {
        private const int MinBclOffsetMinutes = -14 * MinutesPerHour;
        private const int MaxBclOffsetMinutes = 14 * MinutesPerHour;

        // This is effectively a LocalDateTime and an Offset, but by composing it slightly differently, we can save memory.
        private readonly LocalDate localDate;
        private readonly OffsetTime offsetTime;

        internal OffsetDateTime([Trusted] LocalDate localDate, [Trusted] OffsetTime offsetTime)
        {
            this.localDate = localDate;
            this.offsetTime = offsetTime;
        }

        /// <summary>
        /// Optimized conversion from an Instant to an OffsetDateTime in the ISO calendar.
        /// This is equivalent to <c>new OffsetDateTime(new LocalDateTime(instant.Plus(offset)), offset)</c>
        /// but with less overhead.
        /// </summary>
        internal OffsetDateTime(Instant instant, Offset offset)
        {
            unchecked
            {
                int days = instant.DaysSinceEpoch;
                long nanoOfDay = instant.NanosecondOfDay + offset.Nanoseconds;
                if (nanoOfDay >= NanosecondsPerDay)
                {
                    days++;
                    nanoOfDay -= NanosecondsPerDay;
                }
                else if (nanoOfDay < 0)
                {
                    days--;
                    nanoOfDay += NanosecondsPerDay;
                }
                localDate = new LocalDate(days);
                offsetTime = new OffsetTime(nanoOfDay, offset.Seconds);
            }
        }

        /// <summary>
        /// Optimized conversion from an Instant to an OffsetDateTime in the specified calendar.
        /// This is equivalent to <c>new OffsetDateTime(new LocalDateTime(instant.Plus(offset), calendar), offset)</c>
        /// but with less overhead.
        /// </summary>
        internal OffsetDateTime(Instant instant, Offset offset, CalendarSystem calendar)
        {
            unchecked
            {
                int days = instant.DaysSinceEpoch;
                long nanoOfDay = instant.NanosecondOfDay + offset.Nanoseconds;
                if (nanoOfDay >= NanosecondsPerDay)
                {
                    days++;
                    nanoOfDay -= NanosecondsPerDay;
                }
                else if (nanoOfDay < 0)
                {
                    days--;
                    nanoOfDay += NanosecondsPerDay;
                }
                localDate = new LocalDate(days, calendar);
                offsetTime = new OffsetTime(nanoOfDay, offset.Seconds);
            }
        }

        /// <summary>
        /// Constructs a new offset date/time with the given local date and time, and the given offset from UTC.
        /// </summary>
        /// <param name="localDateTime">Local date and time to represent</param>
        /// <param name="offset">Offset from UTC</param>
        public OffsetDateTime(LocalDateTime localDateTime, Offset offset)
            : this(localDateTime.Date, new OffsetTime(localDateTime.NanosecondOfDay, offset.Seconds))
        {
        }

        /// <summary>Gets the calendar system associated with this offset date and time.</summary>
        /// <value>The calendar system associated with this offset date and time.</value>
        public CalendarSystem Calendar => localDate.Calendar;

        /// <summary>Gets the year of this offset date and time.</summary>
        /// <remarks>This returns the "absolute year", so, for the ISO calendar,
        /// a value of 0 means 1 BC, for example.</remarks>
        /// <value>The year of this offset date and time.</value>
        public int Year => localDate.Year;

        /// <summary>Gets the month of this offset date and time within the year.</summary>
        /// <value>The month of this offset date and time within the year.</value>
        public int Month => localDate.Month;

        /// <summary>Gets the day of this offset date and time within the month.</summary>
        /// <value>The day of this offset date and time within the month.</value>
        public int Day => localDate.Day;

        internal YearMonthDay YearMonthDay => localDate.YearMonthDay;

        /// <summary>
        /// Gets the week day of this offset date and time expressed as an <see cref="IsoDayOfWeek"/> value.
        /// </summary>
        /// <value>The week day of this offset date and time expressed as an <c>IsoDayOfWeek</c>.</value>
        public IsoDayOfWeek DayOfWeek => localDate.DayOfWeek;

        /// <summary>Gets the year of this offset date and time within the era.</summary>
        /// <value>The year of this offset date and time within the era.</value>
        public int YearOfEra => localDate.YearOfEra;

        /// <summary>Gets the era of this offset date and time.</summary>
        /// <value>The era of this offset date and time.</value>
        public Era Era => localDate.Era;

        /// <summary>Gets the day of this offset date and time within the year.</summary>
        /// <value>The day of this offset date and time within the year.</value>
        public int DayOfYear => localDate.DayOfYear;

        /// <summary>
        /// Gets the hour of day of this offset date and time, in the range 0 to 23 inclusive.
        /// </summary>
        /// <value>The hour of day of this offset date and time, in the range 0 to 23 inclusive.</value>
        public int Hour => offsetTime.Hour;

        /// <summary>
        /// Gets the hour of the half-day of this offset date and time, in the range 1 to 12 inclusive.
        /// </summary>
        /// <value>The hour of the half-day of this offset date and time, in the range 1 to 12 inclusive.</value>
        public int ClockHourOfHalfDay => offsetTime.ClockHourOfHalfDay;

        /// <summary>
        /// Gets the minute of this offset date and time, in the range 0 to 59 inclusive.
        /// </summary>
        /// <value>The minute of this offset date and time, in the range 0 to 59 inclusive.</value>
        public int Minute => offsetTime.Minute;

        /// <summary>
        /// Gets the second of this offset date and time within the minute, in the range 0 to 59 inclusive.
        /// </summary>
        /// <value>The second of this offset date and time within the minute, in the range 0 to 59 inclusive.</value>
        public int Second => offsetTime.Second;

        /// <summary>
        /// Gets the millisecond of this offset date and time within the second, in the range 0 to 999 inclusive.
        /// </summary>
        /// <value>The millisecond of this offset date and time within the second, in the range 0 to 999 inclusive.</value>
        public int Millisecond => offsetTime.Millisecond;

        /// <summary>
        /// Gets the tick of this offset date and time within the second, in the range 0 to 9,999,999 inclusive.
        /// </summary>
        /// <value>The tick of this offset date and time within the second, in the range 0 to 9,999,999 inclusive.</value>
        public int TickOfSecond => offsetTime.TickOfSecond;

        /// <summary>
        /// Gets the tick of this offset date and time within the day, in the range 0 to 863,999,999,999 inclusive.
        /// </summary>
        /// <value>The tick of this offset date and time within the day, in the range 0 to 863,999,999,999 inclusive.</value>
        public long TickOfDay => offsetTime.TickOfDay;

        /// <summary>
        /// Gets the nanosecond of this offset date and time within the second, in the range 0 to 999,999,999 inclusive.
        /// </summary>
        /// <value>The nanosecond of this offset date and time within the second, in the range 0 to 999,999,999 inclusive.</value>
        public int NanosecondOfSecond => offsetTime.NanosecondOfSecond;

        /// <summary>
        /// Gets the nanosecond of this offset date and time within the day, in the range 0 to 86,399,999,999,999 inclusive.
        /// </summary>
        /// <value>The nanosecond of this offset date and time within the day, in the range 0 to 86,399,999,999,999 inclusive.</value>
        public long NanosecondOfDay => offsetTime.NanosecondOfDay;

        /// <summary>
        /// Returns the local date and time represented within this offset date and time.
        /// </summary>
        /// <value>The local date and time represented within this offset date and time.</value>
        public LocalDateTime LocalDateTime => new LocalDateTime(Date, TimeOfDay);

        /// <summary>
        /// Gets the local date represented by this offset date and time.
        /// </summary>
        /// <remarks>
        /// The returned <see cref="LocalDate"/>
        /// will have the same calendar system and return the same values for each of the date-based calendar
        /// properties (Year, MonthOfYear and so on), but will not have any offset information.
        /// </remarks>
        /// <value>The local date represented by this offset date and time.</value>
        public LocalDate Date => localDate;

        /// <summary>
        /// Gets the time portion of this offset date and time.
        /// </summary>
        /// <remarks>
        /// The returned <see cref="LocalTime"/> will
        /// return the same values for each of the time-based properties (Hour, Minute and so on), but
        /// will not have any offset information.
        /// </remarks>
        /// <value>The time portion of this offset date and time.</value>
        public LocalTime TimeOfDay => new LocalTime(NanosecondOfDay);

        /// <summary>
        /// Gets the offset from UTC.
        /// </summary>
        /// <value>The offset from UTC.</value>
        public Offset Offset => offsetTime.Offset;

        /// <summary>
        /// Converts this offset date and time to an instant in time by subtracting the offset from the local date and time.
        /// </summary>
        /// <returns>The instant represented by this offset date and time</returns>
        [Pure]
        public Instant ToInstant() => Instant.FromUntrustedDuration(ToElapsedTimeSinceEpoch());

        private Duration ToElapsedTimeSinceEpoch()
        {
            // Equivalent to LocalDateTime.ToLocalInstant().Minus(offset)
            int days = localDate.DaysSinceEpoch;
            Duration elapsedTime = new Duration(days, NanosecondOfDay).MinusSmallNanoseconds(offsetTime.OffsetNanoseconds);
            return elapsedTime;
        }

        /// <summary>
        /// Returns this value as a <see cref="ZonedDateTime"/>.
        /// </summary>
        /// <remarks>
        /// <para>
        /// This method returns a <see cref="ZonedDateTime"/> with the same local date and time as this value, using a
        /// fixed time zone with the same offset as the offset for this value.
        /// </para>
        /// <para>
        /// Note that because the resulting <c>ZonedDateTime</c> has a fixed time zone, it is generally not useful to
        /// use this result for arithmetic operations, as the zone will not adjust to account for daylight savings.
        /// </para>
        /// </remarks>
        /// <returns>A zoned date/time with the same local time and a fixed time zone using the offset from this value.</returns>
        [Pure]
        public ZonedDateTime InFixedZone() => new ZonedDateTime(this, DateTimeZone.ForOffset(Offset));

        /// <summary>
        /// Returns this value in ths specified time zone. This method does not expect
        /// the offset in the zone to be the same as for the current value; it simply converts
        /// this value into an <see cref="Instant"/> and finds the <see cref="ZonedDateTime"/>
        /// for that instant in the specified zone.
        /// </summary>
        /// <param name="zone">The time zone of the new value.</param>
        /// <returns>The instant represented by this value, in the specified time zone.</returns>
        [Pure]
        public ZonedDateTime InZone(DateTimeZone zone)
        {
            Preconditions.CheckNotNull(zone, nameof(zone));
            return ToInstant().InZone(zone);
        }

        /// <summary>
        /// Returns the BCL <see cref="DateTimeOffset"/> corresponding to this offset date and time.
        /// </summary>
        /// <remarks>
        /// <para>
        /// If the date and time is not on a tick boundary (the unit of granularity of DateTime) the value will be truncated
        /// towards the start of time.
        /// </para>
        /// <para>
        /// If the offset has a non-zero second component, this is truncated as <c>DateTimeOffset</c> has an offset
        /// granularity of minutes.
        /// </para>
        /// <para>
        /// <see cref="DateTimeOffset"/> uses the Gregorian calendar by definition, so the value is implicitly converted
        /// to the Gregorian calendar first. The result will be the same instant in time (potentially truncated as described
        /// above), but the values returned by the Year/Month/Day properties of the <see cref="DateTimeOffset"/> may not
        /// match the Year/Month/Day properties of this value.
        /// </para>
        /// </remarks>
        /// <exception cref="InvalidOperationException">The date/time is outside the range of <c>DateTimeOffset</c>,
        /// or the offset is outside the range of +/-14 hours (the range supported by <c>DateTimeOffset</c>).</exception>
        /// <returns>A DateTimeOffset with the same local date/time and offset as this. The <see cref="DateTime"/> part of
        /// the result always has a "kind" of Unspecified.</returns>
        [Pure]
        public DateTimeOffset ToDateTimeOffset()
        {
            int offsetMinutes = Offset.Seconds / 60;
            if (offsetMinutes < MinBclOffsetMinutes || offsetMinutes > MaxBclOffsetMinutes)
            {
                throw new InvalidOperationException("Offset out of range for DateTimeOffset");
            }
            return new DateTimeOffset(LocalDateTime.ToDateTimeUnspecified(), TimeSpan.FromMinutes(offsetMinutes));
        }

        /// <summary>
        /// Builds an <see cref="OffsetDateTime"/> from a BCL <see cref="DateTimeOffset"/> by converting
        /// the <see cref="DateTime"/> part to a <see cref="LocalDateTime"/>, and the offset part to an <see cref="Offset"/>.
        /// </summary>
        /// <param name="dateTimeOffset">DateTimeOffset to convert</param>
        /// <returns>The converted offset date and time</returns>
        [Pure]
        public static OffsetDateTime FromDateTimeOffset(DateTimeOffset dateTimeOffset) =>
            new OffsetDateTime(LocalDateTime.FromDateTime(dateTimeOffset.DateTime),
                Offset.FromTimeSpan(dateTimeOffset.Offset));

        /// <summary>
        /// Creates a new OffsetDateTime representing the same physical date, time and offset, but in a different calendar.
        /// The returned OffsetDateTime is likely to have different date field values to this one.
        /// For example, January 1st 1970 in the Gregorian calendar was December 19th 1969 in the Julian calendar.
        /// </summary>
        /// <param name="calendar">The calendar system to convert this offset date and time to.</param>
        /// <returns>The converted OffsetDateTime.</returns>
        [Pure]
        public OffsetDateTime WithCalendar(CalendarSystem calendar)
        {
            LocalDate newDate = Date.WithCalendar(calendar);
            return new OffsetDateTime(newDate, offsetTime);
        }

        /// <summary>
        /// Returns this offset date/time, with the given date adjuster applied to it, maintaining the existing time of day and offset.
        /// </summary>
        /// <remarks>
        /// If the adjuster attempts to construct an
        /// invalid date (such as by trying to set a day-of-month of 30 in February), any exception thrown by
        /// that construction attempt will be propagated through this method.
        /// </remarks>
        /// <param name="adjuster">The adjuster to apply.</param>
        /// <returns>The adjusted offset date/time.</returns>
        [Pure]
        public OffsetDateTime With(Func<LocalDate, LocalDate> adjuster) =>
            new OffsetDateTime(localDate.With(adjuster), offsetTime);

        /// <summary>
        /// Returns this date/time, with the given time adjuster applied to it, maintaining the existing date and offset.
        /// </summary>
        /// <remarks>
        /// If the adjuster attempts to construct an invalid time, any exception thrown by
        /// that construction attempt will be propagated through this method.
        /// </remarks>
        /// <param name="adjuster">The adjuster to apply.</param>
        /// <returns>The adjusted offset date/time.</returns>
        [Pure]
        public OffsetDateTime With(Func<LocalTime, LocalTime> adjuster)
        {
            LocalTime newTime = TimeOfDay.With(adjuster);
            return new OffsetDateTime(localDate, new OffsetTime(newTime.NanosecondOfDay, offsetTime.OffsetSeconds));
        }

        /// <summary>
        /// Creates a new OffsetDateTime representing the instant in time in the same calendar,
        /// but with a different offset. The local date and time is adjusted accordingly.
        /// </summary>
        /// <param name="offset">The new offset to use.</param>
        /// <returns>The converted OffsetDateTime.</returns>
        [Pure]
        public OffsetDateTime WithOffset(Offset offset)
        {
            unchecked
            {
                // Slight change to the normal operation, as it's *just* about plausible that we change day
                // twice in one direction or the other.
                int days = 0;
                long nanos = offsetTime.NanosecondOfDay + offset.Nanoseconds - offsetTime.OffsetNanoseconds;
                if (nanos >= NanosecondsPerDay)
                {
                    days++;
                    nanos -= NanosecondsPerDay;
                    if (nanos >= NanosecondsPerDay)
                    {
                        days++;
                        nanos -= NanosecondsPerDay;
                    }
                }
                else if (nanos < 0)
                {
                    days--;
                    nanos += NanosecondsPerDay;
                    if (nanos < 0)
                    {
                        days--;
                        nanos += NanosecondsPerDay;
                    }
                }
                return new OffsetDateTime(
                    days == 0 ? localDate : localDate.PlusDays(days),
                    new OffsetTime(nanos, offset.Seconds));
            }
        }

        /// <summary>
        /// Constructs a new <see cref="OffsetDate"/> from the date and offset of this value,
        /// but omitting the time-of-day.
        /// </summary>
        /// <returns>A value representing the date and offset aspects of this value.</returns>
        [Pure]
        public OffsetDate ToOffsetDate() => new OffsetDate(Date, Offset);

        /// <summary>
        /// Constructs a new <see cref="OffsetTime"/> from the time and offset of this value,
        /// but omitting the date.
        /// </summary>
        /// <returns>A value representing the time and offset aspects of this value.</returns>
        [Pure]
        public OffsetTime ToOffsetTime() => offsetTime;

        /// <summary>
        /// Returns a hash code for this offset date and time.
        /// See the type documentation for a description of equality semantics.
        /// </summary>
        /// <returns>A hash code for this offset date and time.</returns>
        public override int GetHashCode() => HashCodeHelper.Hash(localDate, offsetTime);

        /// <summary>
        /// Compares two <see cref="OffsetDateTime"/> values for equality.
        /// See the type documentation for a description of equality semantics.
        /// </summary>
        /// <param name="obj">The object to compare this date with.</param>
        /// <returns>True if the given value is another offset date/time equal to this one; false otherwise.</returns>
        public override bool Equals(object? obj) => obj is OffsetDateTime other && this == other;

        /// <summary>
        /// Compares two <see cref="OffsetDateTime"/> values for equality.
        /// See the type documentation for a description of equality semantics.
        /// </summary>
        /// <param name="other">The value to compare this offset date/time with.</param>
        /// <returns>True if the given value is another offset date/time equal to this one; false otherwise.</returns>
        public bool Equals(OffsetDateTime other) =>
            this.localDate == other.localDate && this.offsetTime == other.offsetTime;

        /// <summary>
        /// Deconstruct this <see cref="OffsetDateTime"/> into its components.
        /// </summary>
        /// <param name="localDateTime">The <see cref="LocalDateTime"/> component.</param>
        /// <param name="offset">The <see cref="Offset"/> component.</param>
        [Pure]
        public void Deconstruct(out LocalDateTime localDateTime, out Offset offset)
        {
            localDateTime = LocalDateTime;
            offset = Offset;
        }

        /// <summary>
        /// Deconstruct this <see cref="OffsetDateTime"/> into its components.
        /// </summary>
        /// <param name="localDate">The <see cref="LocalDate"/> component.</param>
        /// <param name="localTime">The <see cref="LocalTime"/> component.</param>
        /// <param name="offset">The <see cref="Offset"/> component.</param>
        [Pure]
        public void Deconstruct(out LocalDate localDate, out LocalTime localTime, out Offset offset)
        {
            localDate = LocalDateTime.Date;
            localTime = LocalDateTime.TimeOfDay;
            offset = Offset;
        }

        #region Formatting
        /// <summary>
        /// Returns a <see cref="System.String" /> that represents this instance.
        /// </summary>
        /// <returns>
        /// The value of the current instance in the default format pattern ("G"), using the current thread's
        /// culture to obtain a format provider.
        /// </returns>
        public override string ToString() => OffsetDateTimePattern.Patterns.BclSupport.Format(this, null, CultureInfo.CurrentCulture);

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
            OffsetDateTimePattern.Patterns.BclSupport.Format(this, patternText, formatProvider);
        #endregion Formatting

        #region Operators

        /// <summary>
        /// Adds a duration to an offset date and time.
        /// </summary>
        /// <remarks>
        /// This is an alternative way of calling <see cref="op_Addition(OffsetDateTime, Duration)"/>.
        /// </remarks>
        /// <param name="offsetDateTime">The value to add the duration to.</param>
        /// <param name="duration">The duration to add</param>
        /// <returns>A new value with the time advanced by the given duration, in the same calendar system and with the same offset.</returns>
        public static OffsetDateTime Add(OffsetDateTime offsetDateTime, Duration duration) => offsetDateTime + duration;

        /// <summary>
        /// Returns the result of adding a duration to this offset date and time.
        /// </summary>
        /// <remarks>
        /// This is an alternative way of calling <see cref="op_Addition(OffsetDateTime, Duration)"/>.
        /// </remarks>
        /// <param name="duration">The duration to add</param>
        /// <returns>A new <see cref="OffsetDateTime" /> representing the result of the addition.</returns>
        [Pure]
        public OffsetDateTime Plus(Duration duration) => this + duration;

        /// <summary>
        /// Returns the result of adding a increment of hours to this offset date and time
        /// </summary>
        /// <param name="hours">The number of hours to add</param>
        /// <returns>A new <see cref="OffsetDateTime" /> representing the result of the addition.</returns>
        [Pure]
        public OffsetDateTime PlusHours(int hours) => this + Duration.FromHours(hours);

        /// <summary>
        /// Returns the result of adding an increment of minutes to this offset date and time
        /// </summary>
        /// <param name="minutes">The number of minutes to add</param>
        /// <returns>A new <see cref="OffsetDateTime" /> representing the result of the addition.</returns>
        [Pure]
        public OffsetDateTime PlusMinutes(int minutes) => this + Duration.FromMinutes(minutes);

        /// <summary>
        /// Returns the result of adding an increment of seconds to this offset date and time
        /// </summary>
        /// <param name="seconds">The number of seconds to add</param>
        /// <returns>A new <see cref="OffsetDateTime" /> representing the result of the addition.</returns>
        [Pure]
        public OffsetDateTime PlusSeconds(long seconds) => this + Duration.FromSeconds(seconds);

        /// <summary>
        /// Returns the result of adding an increment of milliseconds to this offset date and time
        /// </summary>
        /// <param name="milliseconds">The number of milliseconds to add</param>
        /// <returns>A new <see cref="OffsetDateTime" /> representing the result of the addition.</returns>
        [Pure]
        public OffsetDateTime PlusMilliseconds(long milliseconds) => this + Duration.FromMilliseconds(milliseconds);

        /// <summary>
        /// Returns the result of adding an increment of ticks to this offset date and time
        /// </summary>
        /// <param name="ticks">The number of ticks to add</param>
        /// <returns>A new <see cref="OffsetDateTime" /> representing the result of the addition.</returns>
        [Pure]
        public OffsetDateTime PlusTicks(long ticks) => this + Duration.FromTicks(ticks);

        /// <summary>
        /// Returns the result of adding an increment of nanoseconds to this offset date and time
        /// </summary>
        /// <param name="nanoseconds">The number of nanoseconds to add</param>
        /// <returns>A new <see cref="OffsetDateTime" /> representing the result of the addition.</returns>
        [Pure]
        public OffsetDateTime PlusNanoseconds(long nanoseconds) => this + Duration.FromNanoseconds(nanoseconds);

        /// <summary>
        /// Returns a new <see cref="OffsetDateTime"/> with the time advanced by the given duration.
        /// </summary>
        /// <remarks>
        /// The returned value retains the calendar system and offset of the <paramref name="offsetDateTime"/>.
        /// </remarks>
        /// <param name="offsetDateTime">The <see cref="OffsetDateTime"/> to add the duration to.</param>
        /// <param name="duration">The duration to add.</param>
        /// <returns>A new value with the time advanced by the given duration, in the same calendar system and with the same offset.</returns>
        public static OffsetDateTime operator +(OffsetDateTime offsetDateTime, Duration duration) =>
            new OffsetDateTime(offsetDateTime.ToInstant() + duration, offsetDateTime.Offset);

        /// <summary>
        /// Subtracts a duration from an offset date and time.
        /// </summary>
        /// <remarks>
        /// This is an alternative way of calling <see cref="op_Subtraction(OffsetDateTime, Duration)"/>.
        /// </remarks>
        /// <param name="offsetDateTime">The value to subtract the duration from.</param>
        /// <param name="duration">The duration to subtract.</param>
        /// <returns>A new value with the time "rewound" by the given duration, in the same calendar system and with the same offset.</returns>
        public static OffsetDateTime Subtract(OffsetDateTime offsetDateTime, Duration duration) => offsetDateTime - duration;

        /// <summary>
        /// Returns the result of subtracting a duration from this offset date and time, for a fluent alternative to
        /// <see cref="op_Subtraction(OffsetDateTime, Duration)"/>
        /// </summary>
        /// <param name="duration">The duration to subtract</param>
        /// <returns>A new <see cref="OffsetDateTime" /> representing the result of the subtraction.</returns>
        [Pure]
        public OffsetDateTime Minus(Duration duration) => this - duration;

        /// <summary>
        /// Returns a new <see cref="OffsetDateTime"/> with the duration subtracted.
        /// </summary>
        /// <remarks>
        /// The returned value retains the calendar system and offset of the <paramref name="offsetDateTime"/>.
        /// </remarks>
        /// <param name="offsetDateTime">The value to subtract the duration from.</param>
        /// <param name="duration">The duration to subtract.</param>
        /// <returns>A new value with the time "rewound" by the given duration, in the same calendar system and with the same offset.</returns>
        public static OffsetDateTime operator -(OffsetDateTime offsetDateTime, Duration duration) =>
            new OffsetDateTime(offsetDateTime.ToInstant() - duration, offsetDateTime.Offset);

        /// <summary>
        /// Subtracts one offset date and time from another, returning an elapsed duration.
        /// </summary>
        /// <remarks>
        /// This is an alternative way of calling <see cref="op_Subtraction(OffsetDateTime, OffsetDateTime)"/>.
        /// </remarks>
        /// <param name="end">The offset date and time value to subtract from; if this is later than <paramref name="start"/>
        /// then the result will be positive.</param>
        /// <param name="start">The offset date and time to subtract from <paramref name="end"/>.</param>
        /// <returns>The elapsed duration from <paramref name="start"/> to <paramref name="end"/>.</returns>
        public static Duration Subtract(OffsetDateTime end, OffsetDateTime start) => end - start;

        /// <summary>
        /// Returns the result of subtracting another offset date and time from this one, resulting in the elapsed duration
        /// between the two instants represented in the values.
        /// </summary>
        /// <remarks>
        /// This is an alternative way of calling <see cref="op_Subtraction(OffsetDateTime, OffsetDateTime)"/>.
        /// </remarks>
        /// <param name="other">The offset date and time to subtract from this one.</param>
        /// <returns>The elapsed duration from <paramref name="other"/> to this value.</returns>
        [Pure]
        public Duration Minus(OffsetDateTime other) => this - other;

        /// <summary>
        /// Subtracts one <see cref="OffsetDateTime"/> from another, resulting in the elapsed time between
        /// the two values.
        /// </summary>
        /// <remarks>
        /// This is equivalent to <c>end.ToInstant() - start.ToInstant()</c>; in particular:
        /// <list type="bullet">
        ///   <item><description>The two values can use different calendar systems</description></item>
        ///   <item><description>The two values can have different UTC offsets</description></item>
        /// </list>
        /// </remarks>
        /// <param name="end">The offset date and time value to subtract from; if this is later than <paramref name="start"/>
        /// then the result will be positive.</param>
        /// <param name="start">The offset date and time to subtract from <paramref name="end"/>.</param>
        /// <returns>The elapsed duration from <paramref name="start"/> to <paramref name="end"/>.</returns>
        public static Duration operator -(OffsetDateTime end, OffsetDateTime start) => end.ToInstant() - start.ToInstant();

        /// <summary>
        /// Implements the operator == (equality).
        /// See the type documentation for a description of equality semantics.
        /// </summary>
        /// <param name="left">The left hand side of the operator.</param>
        /// <param name="right">The right hand side of the operator.</param>
        /// <returns><c>true</c> if values are equal to each other, otherwise <c>false</c>.</returns>
        public static bool operator ==(OffsetDateTime left, OffsetDateTime right) => left.Equals(right);

        /// <summary>
        /// Implements the operator != (inequality).
        /// See the type documentation for a description of equality semantics.
        /// </summary>
        /// <param name="left">The left hand side of the operator.</param>
        /// <param name="right">The right hand side of the operator.</param>
        /// <returns><c>true</c> if values are not equal to each other, otherwise <c>false</c>.</returns>
        public static bool operator !=(OffsetDateTime left, OffsetDateTime right) => !(left == right);
        #endregion

        #region Comparers
        /// <summary>
        /// Base class for <see cref="OffsetDateTime"/> comparers.
        /// </summary>
        /// <remarks>
        /// Use the static properties of this class to obtain instances. This type is exposed so that the
        /// same value can be used for both equality and ordering comparisons.
        /// </remarks>
        [Immutable]
        public abstract class Comparer : IComparer<OffsetDateTime>, IEqualityComparer<OffsetDateTime>
        {
            // TODO(feature): Should we have a comparer which is calendar-sensitive (so will fail if the calendars are different)
            // but still uses the offset?

            /// <summary>
            /// Gets a comparer which compares <see cref="OffsetDateTime"/> values by their local date/time, without reference to
            /// the offset. Comparisons between two values of different calendar systems will fail with <see cref="ArgumentException"/>.
            /// </summary>
            /// <remarks>
            /// <para>For example, this comparer considers 2013-03-04T20:21:00+0100 to be later than 2013-03-04T19:21:00-0700 even though
            /// the second value represents a later instant in time.</para>
            /// <para>This property will return a reference to the same instance every time it is called.</para>
            /// </remarks>
            /// <value>A comparer which compares values by their local date/time, without reference to the offset.</value>
            public static Comparer Local => LocalComparer.Instance;

            /// <summary>
            /// Returns a comparer which compares <see cref="OffsetDateTime"/> values by the instant values obtained by applying the offset to
            /// the local date/time, ignoring the calendar system.
            /// </summary>
            /// <remarks>
            /// <para>For example, this comparer considers 2013-03-04T20:21:00+0100 to be earlier than 2013-03-04T19:21:00-0700 even though
            /// the second value has a local time which is earlier.</para>
            /// <para>This property will return a reference to the same instance every time it is called.</para>
            /// </remarks>
            /// <value>A comparer which compares values by the instant values obtained by applying the offset to
            /// the local date/time, ignoring the calendar system.</value>
            public static Comparer Instant => InstantComparer.Instance;

            /// <summary>
            /// Internal constructor to prevent external classes from deriving from this.
            /// (That means we can add more abstract members in the future.)
            /// </summary>
            internal Comparer()
            {
            }

            /// <summary>
            /// Compares two <see cref="OffsetDateTime"/> values and returns a value indicating whether one is less than, equal to, or greater than the other.
            /// </summary>
            /// <param name="x">The first value to compare.</param>
            /// <param name="y">The second value to compare.</param>
            /// <returns>A signed integer that indicates the relative values of <paramref name="x"/> and <paramref name="y"/>, as shown in the following table.
            ///   <list type = "table">
            ///     <listheader>
            ///       <term>Value</term>
            ///       <description>Meaning</description>
            ///     </listheader>
            ///     <item>
            ///       <term>Less than zero</term>
            ///       <description><paramref name="x"/> is less than <paramref name="y"/>.</description>
            ///     </item>
            ///     <item>
            ///       <term>Zero</term>
            ///       <description><paramref name="x"/> is equals to <paramref name="y"/>.</description>
            ///     </item>
            ///     <item>
            ///       <term>Greater than zero</term>
            ///       <description><paramref name="x"/> is greater than <paramref name="y"/>.</description>
            ///     </item>
            ///   </list>
            /// </returns>
            public abstract int Compare(OffsetDateTime x, OffsetDateTime y);

            /// <summary>
            /// Determines whether the specified <c>OffsetDateTime</c> values are equal.
            /// </summary>
            /// <param name="x">The first <c>OffsetDateTime</c> to compare.</param>
            /// <param name="y">The second <c>OffsetDateTime</c> to compare.</param>
            /// <returns><c>true</c> if the specified objects are equal; otherwise, <c>false</c>.</returns>
            public abstract bool Equals(OffsetDateTime x, OffsetDateTime y);

            /// <summary>
            /// Returns a hash code for the specified <c>OffsetDateTime</c>.
            /// </summary>
            /// <param name="obj">The <c>OffsetDateTime</c> for which a hash code is to be returned.</param>
            /// <returns>A hash code for the specified value.</returns>
            public abstract int GetHashCode(OffsetDateTime obj);
        }

        /// <summary>
        /// Implementation for <see cref="Comparer.Local"/>
        /// </summary>
        private sealed class LocalComparer : Comparer
        {
            internal static readonly Comparer Instance = new LocalComparer();

            private LocalComparer()
            {
            }

            /// <inheritdoc />
            public override int Compare(OffsetDateTime x, OffsetDateTime y)
            {
                Preconditions.CheckArgument(x.Calendar.Equals(y.Calendar), nameof(y),
                    "Only values with the same calendar system can be compared");
                int dateComparison = x.Calendar.Compare(x.YearMonthDay, y.YearMonthDay);
                if (dateComparison != 0)
                {
                    return dateComparison;
                }
                return x.NanosecondOfDay.CompareTo(y.NanosecondOfDay);
            }

            /// <inheritdoc />
            public override bool Equals(OffsetDateTime x, OffsetDateTime y) =>
                x.localDate == y.localDate && x.NanosecondOfDay == y.NanosecondOfDay;

            /// <inheritdoc />
            public override int GetHashCode(OffsetDateTime obj) => HashCodeHelper.Hash(obj.localDate, obj.NanosecondOfDay);
        }

        /// <summary>
        /// Implementation for <see cref="Comparer.Instant"/>.
        /// </summary>
        private sealed class InstantComparer : Comparer
        {
            internal static readonly Comparer Instance = new InstantComparer();

            private InstantComparer()
            {
            }

            /// <inheritdoc />
            public override int Compare(OffsetDateTime x, OffsetDateTime y) =>
                // TODO(optimization): Optimize cases which are more than 2 days apart, by avoiding the arithmetic?
                x.ToElapsedTimeSinceEpoch().CompareTo(y.ToElapsedTimeSinceEpoch());

            /// <inheritdoc />
            public override bool Equals(OffsetDateTime x, OffsetDateTime y) =>
                x.ToElapsedTimeSinceEpoch() == y.ToElapsedTimeSinceEpoch();

            /// <inheritdoc />
            public override int GetHashCode(OffsetDateTime obj) => obj.ToElapsedTimeSinceEpoch().GetHashCode();
        }
        #endregion

        #region XML serialization
        /// <summary>
        /// Adds the XML schema type describing the structure of the <see cref="OffsetDateTime"/> XML serialization to the given <paramref name="xmlSchemaSet"/>.
        /// </summary>
        /// <param name="xmlSchemaSet">The XML schema set provided by <see cref="XmlSchemaExporter"/>.</param>
        /// <returns>The qualified name of the schema type that was added to the <paramref name="xmlSchemaSet"/>.</returns>
        public static XmlQualifiedName AddSchema(XmlSchemaSet xmlSchemaSet) => Xml.XmlSchemaDefinition.AddOffsetDateTimeSchemaType(xmlSchemaSet);

        /// <inheritdoc />
        XmlSchema IXmlSerializable.GetSchema() => null!; // TODO(nullable): Return XmlSchema? when docfx works with that

        /// <inheritdoc />
        void IXmlSerializable.ReadXml(XmlReader reader)
        {
            Preconditions.CheckNotNull(reader, nameof(reader));
            var pattern = OffsetDateTimePattern.Rfc3339;
            if (reader.MoveToAttribute("calendar"))
            {
                string newCalendarId = reader.Value;
                CalendarSystem newCalendar = CalendarSystem.ForId(newCalendarId);
                var newTemplateValue = pattern.TemplateValue.WithCalendar(newCalendar);
                pattern = pattern.WithTemplateValue(newTemplateValue);
                reader.MoveToElement();
            }
            string text = reader.ReadElementContentAsString();
            Unsafe.AsRef(this) = pattern.Parse(text).Value;
        }

        /// <inheritdoc />
        void IXmlSerializable.WriteXml(XmlWriter writer)
        {
            Preconditions.CheckNotNull(writer, nameof(writer));
            if (Calendar != CalendarSystem.Iso)
            {
                writer.WriteAttributeString("calendar", Calendar.Id);
            }
            writer.WriteString(OffsetDateTimePattern.Rfc3339.Format(this));
        }
        #endregion
    }
}
