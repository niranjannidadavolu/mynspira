// Copyright 2010 The Noda Time Authors. All rights reserved.
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
using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Fields;
using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Text;
using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Utility;
using static Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.NodaConstants;

namespace Phoenix.CrossCutting.DateTimeLibrary.NspiraTime
{
    // Note: documentation that refers to the LocalDateTime type within this class must use the fully-qualified
    // reference to avoid being resolved to the LocalDateTime property instead.

    /// <summary>
    /// LocalTime is an immutable struct representing a time of day, with no reference
    /// to a particular calendar, time zone or date.
    /// </summary>
    /// <remarks>
    /// <para>
    /// Ordering and equality are defined in the natural way, simply comparing the number of "nanoseconds since midnight".
    /// </para>
    /// <para>The default value of this type is <see cref="Midnight"/>.</para>
    /// </remarks>
    /// <threadsafety>This type is an immutable value type. See the thread safety section of the user guide for more information.</threadsafety>
    [TypeConverter(typeof(LocalTimeTypeConverter))]
    [XmlSchemaProvider(nameof(AddSchema))]
    public readonly struct LocalTime : IEquatable<LocalTime>, IComparable<LocalTime>, IFormattable, IComparable, IXmlSerializable
    {
        /// <summary>
        /// Local time at midnight, i.e. 0 hours, 0 minutes, 0 seconds.
        /// </summary>
        public static LocalTime Midnight { get; } = new LocalTime(0, 0, 0);

        /// <summary>
        /// The minimum value of this type; equivalent to <see cref="Midnight"/>.
        /// </summary>
        public static LocalTime MinValue => Midnight;

        /// <summary>
        /// Local time at noon, i.e. 12 hours, 0 minutes, 0 seconds.
        /// </summary>
        public static LocalTime Noon { get; } = new LocalTime(12, 0, 0);

        /// <summary>
        /// The maximum value of this type, one nanosecond before midnight.
        /// </summary>
        /// <remarks>This is useful if you have to use an inclusive upper bound for some reason.
        /// In general, it's better to use an exclusive upper bound, in which case use midnight of
        /// the following day.</remarks>
        public static LocalTime MaxValue { get; } = new LocalTime(NanosecondsPerDay - 1);

        /// <summary>
        /// Nanoseconds since midnight, in the range [0, 86,400,000,000,000).
        /// </summary>
        private readonly long nanoseconds;

        /// <summary>
        /// Creates a local time at the given hour and minute, with second, millisecond-of-second
        /// and tick-of-millisecond values of zero.
        /// </summary>
        /// <param name="hour">The hour of day.</param>
        /// <param name="minute">The minute of the hour.</param>
        /// <exception cref="ArgumentOutOfRangeException">The parameters do not form a valid time.</exception>
        /// <returns>The resulting time.</returns>
        public LocalTime(int hour, int minute)
        {
            // Avoid the method calls which give a decent exception unless we're actually going to fail.
            if (hour < 0 || hour > HoursPerDay - 1 ||
                minute < 0 || minute > MinutesPerHour - 1)
            {
                Preconditions.CheckArgumentRange(nameof(hour), hour, 0, HoursPerDay - 1);
                Preconditions.CheckArgumentRange(nameof(minute), minute, 0, MinutesPerHour - 1);
            }
            nanoseconds = unchecked(hour * NanosecondsPerHour + minute * NanosecondsPerMinute);
        }

        /// <summary>
        /// Creates a local time at the given hour, minute and second,
        /// with millisecond-of-second and tick-of-millisecond values of zero.
        /// </summary>
        /// <param name="hour">The hour of day.</param>
        /// <param name="minute">The minute of the hour.</param>
        /// <param name="second">The second of the minute.</param>
        /// <exception cref="ArgumentOutOfRangeException">The parameters do not form a valid time.</exception>
        /// <returns>The resulting time.</returns>
        public LocalTime(int hour, int minute, int second)
        {
            // Avoid the method calls which give a decent exception unless we're actually going to fail.
            if (hour < 0 || hour > HoursPerDay - 1 ||
                minute < 0 || minute > MinutesPerHour - 1 ||
                second < 0 || second > SecondsPerMinute - 1)
            {
                Preconditions.CheckArgumentRange(nameof(hour), hour, 0, HoursPerDay - 1);
                Preconditions.CheckArgumentRange(nameof(minute), minute, 0, MinutesPerHour - 1);
                Preconditions.CheckArgumentRange(nameof(second), second, 0, SecondsPerMinute - 1);
            }
            nanoseconds = unchecked(hour * NanosecondsPerHour +
                minute * NanosecondsPerMinute +
                second * NanosecondsPerSecond);
        }

        /// <summary>
        /// Creates a local time at the given hour, minute, second and millisecond,
        /// with a tick-of-millisecond value of zero.
        /// </summary>
        /// <param name="hour">The hour of day.</param>
        /// <param name="minute">The minute of the hour.</param>
        /// <param name="second">The second of the minute.</param>
        /// <param name="millisecond">The millisecond of the second.</param>
        /// <exception cref="ArgumentOutOfRangeException">The parameters do not form a valid time.</exception>
        /// <returns>The resulting time.</returns>
        public LocalTime(int hour, int minute, int second, int millisecond)
        {
            // Avoid the method calls which give a decent exception unless we're actually going to fail.
            if (hour < 0 || hour > HoursPerDay - 1 ||
                minute < 0 || minute > MinutesPerHour - 1 ||
                second < 0 || second > SecondsPerMinute - 1 ||
                millisecond < 0 || millisecond > MillisecondsPerSecond - 1)
            {
                Preconditions.CheckArgumentRange(nameof(hour), hour, 0, HoursPerDay - 1);
                Preconditions.CheckArgumentRange(nameof(minute), minute, 0, MinutesPerHour - 1);
                Preconditions.CheckArgumentRange(nameof(second), second, 0, SecondsPerMinute - 1);
                Preconditions.CheckArgumentRange(nameof(millisecond), millisecond, 0, MillisecondsPerSecond - 1);
            }
            nanoseconds = unchecked(
                hour * NanosecondsPerHour +
                minute * NanosecondsPerMinute +
                second * NanosecondsPerSecond +
                millisecond * NanosecondsPerMillisecond);
        }

        /// <summary>
        /// Factory method to create a local time at the given hour, minute, second, millisecond and tick within millisecond.
        /// </summary>
        /// <param name="hour">The hour of day.</param>
        /// <param name="minute">The minute of the hour.</param>
        /// <param name="second">The second of the minute.</param>
        /// <param name="millisecond">The millisecond of the second.</param>
        /// <param name="tickWithinMillisecond">The tick within the millisecond.</param>
        /// <exception cref="ArgumentOutOfRangeException">The parameters do not form a valid time.</exception>
        /// <returns>The resulting time.</returns>
        public static LocalTime FromHourMinuteSecondMillisecondTick(int hour, int minute, int second, int millisecond, int tickWithinMillisecond)
        {
            // Avoid the method calls which give a decent exception unless we're actually going to fail.
            if (hour < 0 || hour > HoursPerDay - 1 ||
                minute < 0 || minute > MinutesPerHour - 1 ||
                second < 0 || second > SecondsPerMinute - 1 ||
                millisecond < 0 || millisecond > MillisecondsPerSecond - 1 ||
                tickWithinMillisecond < 0 || tickWithinMillisecond > TicksPerMillisecond - 1)
            {
                Preconditions.CheckArgumentRange(nameof(hour), hour, 0, HoursPerDay - 1);
                Preconditions.CheckArgumentRange(nameof(minute), minute, 0, MinutesPerHour - 1);
                Preconditions.CheckArgumentRange(nameof(second), second, 0, SecondsPerMinute - 1);
                Preconditions.CheckArgumentRange(nameof(millisecond), millisecond, 0, MillisecondsPerSecond - 1);
                Preconditions.CheckArgumentRange(nameof(tickWithinMillisecond), tickWithinMillisecond, 0, TicksPerMillisecond - 1);
            }
            long nanoseconds = unchecked(
                hour * NanosecondsPerHour +
                minute * NanosecondsPerMinute +
                second * NanosecondsPerSecond +
                millisecond * NanosecondsPerMillisecond +
                tickWithinMillisecond * NanosecondsPerTick);
            return new LocalTime(nanoseconds);
        }

        /// <summary>
        /// Factory method for creating a local time from the hour of day, minute of hour, second of minute, and tick of second.
        /// </summary>
        /// <remarks>
        /// This is not a constructor overload as it would have the same signature as the one taking millisecond of second.
        /// </remarks>
        /// <param name="hour">The hour of day in the desired time, in the range [0, 23].</param>
        /// <param name="minute">The minute of hour in the desired time, in the range [0, 59].</param>
        /// <param name="second">The second of minute in the desired time, in the range [0, 59].</param>
        /// <param name="tickWithinSecond">The tick within the second in the desired time, in the range [0, 9999999].</param>
        /// <exception cref="ArgumentOutOfRangeException">The parameters do not form a valid time.</exception>
        /// <returns>The resulting time.</returns>
        public static LocalTime FromHourMinuteSecondTick(int hour, int minute, int second, int tickWithinSecond)
        {
            // Avoid the method calls which give a decent exception unless we're actually going to fail.
            if (hour < 0 || hour > HoursPerDay - 1 ||
                minute < 0 || minute > MinutesPerHour - 1 ||
                second < 0 || second > SecondsPerMinute - 1 ||
                tickWithinSecond < 0 || tickWithinSecond > TicksPerSecond - 1)
            {
                Preconditions.CheckArgumentRange(nameof(hour), hour, 0, HoursPerDay - 1);
                Preconditions.CheckArgumentRange(nameof(minute), minute, 0, MinutesPerHour - 1);
                Preconditions.CheckArgumentRange(nameof(second), second, 0, SecondsPerMinute - 1);
                Preconditions.CheckArgumentRange(nameof(tickWithinSecond), tickWithinSecond, 0, TicksPerSecond - 1);
            }
            return new LocalTime(unchecked(
                hour * NanosecondsPerHour +
                minute * NanosecondsPerMinute +
                second * NanosecondsPerSecond +
                tickWithinSecond * NanosecondsPerTick));
        }

        /// <summary>
        /// Factory method for creating a local time from the hour of day, minute of hour, second of minute, and nanosecond of second.
        /// </summary>
        /// <remarks>
        /// This is not a constructor overload as it would have the same signature as the one taking millisecond of second.
        /// </remarks>
        /// <param name="hour">The hour of day in the desired time, in the range [0, 23].</param>
        /// <param name="minute">The minute of hour in the desired time, in the range [0, 59].</param>
        /// <param name="second">The second of minute in the desired time, in the range [0, 59].</param>
        /// <param name="nanosecondWithinSecond">The nanosecond within the second in the desired time, in the range [0, 999999999].</param>
        /// <exception cref="ArgumentOutOfRangeException">The parameters do not form a valid time.</exception>
        /// <returns>The resulting time.</returns>
        public static LocalTime FromHourMinuteSecondNanosecond(int hour, int minute, int second, long nanosecondWithinSecond)
        {
            // Avoid the method calls which give a decent exception unless we're actually going to fail.
            if (hour < 0 || hour > HoursPerDay - 1 ||
                minute < 0 || minute > MinutesPerHour - 1 ||
                second < 0 || second > SecondsPerMinute - 1 ||
                nanosecondWithinSecond < 0 || nanosecondWithinSecond > NanosecondsPerSecond - 1)
            {
                Preconditions.CheckArgumentRange(nameof(hour), hour, 0, HoursPerDay - 1);
                Preconditions.CheckArgumentRange(nameof(minute), minute, 0, MinutesPerHour - 1);
                Preconditions.CheckArgumentRange(nameof(second), second, 0, SecondsPerMinute - 1);
                Preconditions.CheckArgumentRange(nameof(nanosecondWithinSecond), nanosecondWithinSecond, 0, NanosecondsPerSecond - 1);
            }
            return FromHourMinuteSecondNanosecondTrusted(hour, minute, second, nanosecondWithinSecond);
        }

        /// <summary>
        /// Factory method for creating a local time from the hour of day, minute of hour, second of minute, and nanosecond of second
        /// where the values have already been validated.
        /// </summary>
        internal static LocalTime FromHourMinuteSecondNanosecondTrusted(
            [Trusted] int hour, [Trusted] int minute, [Trusted] int second, [Trusted] long nanosecondWithinSecond) =>
            new LocalTime(unchecked(
                hour * NanosecondsPerHour +
                minute * NanosecondsPerMinute +
                second * NanosecondsPerSecond +
                nanosecondWithinSecond));

        /// <summary>
        /// Constructor only called from other parts of Noda Time - trusted to be the range [0, NanosecondsPerDay).
        /// </summary>
        internal LocalTime([Trusted] long nanoseconds)
        {
            Preconditions.DebugCheckArgumentRange(nameof(nanoseconds), nanoseconds, 0, NanosecondsPerDay - 1);
            this.nanoseconds = nanoseconds;
        }

        /// <summary>
        /// Factory method for creating a local time from the number of nanoseconds which have elapsed since midnight.
        /// </summary>
        /// <param name="nanoseconds">The number of nanoseconds, in the range [0, 86,399,999,999,999]</param>
        /// <returns>The resulting time.</returns>
        public static LocalTime FromNanosecondsSinceMidnight(long nanoseconds)
        {
            // Avoid the method calls which give a decent exception unless we're actually going to fail.
            if (nanoseconds < 0 || nanoseconds > NanosecondsPerDay - 1)
            {
                Preconditions.CheckArgumentRange(nameof(nanoseconds), nanoseconds, 0, NanosecondsPerDay - 1);
            }
            return new LocalTime(nanoseconds);
        }

        /// <summary>
        /// Factory method for creating a local time from the number of ticks which have elapsed since midnight.
        /// </summary>
        /// <param name="ticks">The number of ticks, in the range [0, 863,999,999,999]</param>
        /// <returns>The resulting time.</returns>
        public static LocalTime FromTicksSinceMidnight(long ticks)
        {
            // Avoid the method calls which give a decent exception unless we're actually going to fail.
            if (ticks < 0 || ticks > TicksPerDay - 1)
            {
                Preconditions.CheckArgumentRange(nameof(ticks), ticks, 0, TicksPerDay - 1);
            }
            return new LocalTime(unchecked(ticks * NanosecondsPerTick));
        }

        /// <summary>
        /// Factory method for creating a local time from the number of milliseconds which have elapsed since midnight.
        /// </summary>
        /// <param name="milliseconds">The number of milliseconds, in the range [0, 86,399,999]</param>
        /// <returns>The resulting time.</returns>
        public static LocalTime FromMillisecondsSinceMidnight(int milliseconds)
        {
            // Avoid the method calls which give a decent exception unless we're actually going to fail.
            if (milliseconds < 0 || milliseconds > MillisecondsPerDay - 1)
            {
                Preconditions.CheckArgumentRange(nameof(milliseconds), milliseconds, 0, MillisecondsPerDay - 1);
            }
            return new LocalTime(unchecked(milliseconds * NanosecondsPerMillisecond));
        }

        /// <summary>
        /// Factory method for creating a local time from the number of seconds which have elapsed since midnight.
        /// </summary>
        /// <param name="seconds">The number of seconds, in the range [0, 86,399]</param>
        /// <returns>The resulting time.</returns>
        public static LocalTime FromSecondsSinceMidnight(int seconds)
        {
            // Avoid the method calls which give a decent exception unless we're actually going to fail.
            if (seconds < 0 || seconds > SecondsPerDay - 1)
            {
                Preconditions.CheckArgumentRange(nameof(seconds), seconds, 0, SecondsPerDay - 1);
            }
            return new LocalTime(unchecked(seconds * NanosecondsPerSecond));
        }

        /// <summary>
        /// Factory method for creating a local time from the number of minutes which have elapsed since midnight.
        /// </summary>
        /// <param name="minutes">The number of minutes, in the range [0, 1439]</param>
        /// <returns>The resulting time.</returns>
        public static LocalTime FromMinutesSinceMidnight(int minutes)
        {
            // Avoid the method calls which give a decent exception unless we're actually going to fail.
            if (minutes < 0 || minutes > MinutesPerDay - 1)
            {
                Preconditions.CheckArgumentRange(nameof(minutes), minutes, 0, MinutesPerDay - 1);
            }
            return new LocalTime(unchecked(minutes * NanosecondsPerMinute));
        }

        /// <summary>
        /// Factory method for creating a local time from the number of hours which have elapsed since midnight.
        /// </summary>
        /// <param name="hours">The number of hours, in the range [0, 23]</param>
        /// <returns>The resulting time.</returns>
        public static LocalTime FromHoursSinceMidnight(int hours)
        {
            // Avoid the method calls which give a decent exception unless we're actually going to fail.
            if (hours < 0 || hours > HoursPerDay - 1)
            {
                Preconditions.CheckArgumentRange(nameof(hours), hours, 0, HoursPerDay - 1);
            }
            return new LocalTime(unchecked(hours * NanosecondsPerHour));
        }

        /// <summary>
        /// Gets the hour of day of this local time, in the range 0 to 23 inclusive.
        /// </summary>
        /// <value>The hour of day of this local time, in the range 0 to 23 inclusive.</value>
        public int Hour =>
            // Effectively nanoseconds / NanosecondsPerHour, but apparently rather more efficient.
            (int) ((nanoseconds >> 13) / 439453125);

        /// <summary>
        /// Gets the hour of the half-day of this local time, in the range 1 to 12 inclusive.
        /// </summary>
        /// <value>The hour of the half-day of this local time, in the range 1 to 12 inclusive.</value>
        public int ClockHourOfHalfDay
        {
            get
            {
                unchecked
                {
                    int hourOfHalfDay = unchecked(Hour % 12);
                    return hourOfHalfDay == 0 ? 12 : hourOfHalfDay;
                }
            }
        }

        /// <summary>
        /// Gets the minute of this local time, in the range 0 to 59 inclusive.
        /// </summary>
        /// <value>The minute of this local time, in the range 0 to 59 inclusive.</value>
        public int Minute
        {
            get
            {
                unchecked
                {
                    // Effectively nanoseconds / NanosecondsPerMinute, but apparently rather more efficient.
                    int minuteOfDay = (int) ((nanoseconds >> 11) / 29296875);
                    return minuteOfDay % MinutesPerHour;
                }
            }
        }

        /// <summary>
        /// Gets the second of this local time within the minute, in the range 0 to 59 inclusive.
        /// </summary>
        /// <value>The second of this local time within the minute, in the range 0 to 59 inclusive.</value>
        public int Second
        {
            get
            {
                unchecked
                {
                    int secondOfDay = (int) (nanoseconds / (int) NanosecondsPerSecond);
                    return secondOfDay % SecondsPerMinute;
                }
            }
        }

        /// <summary>
        /// Gets the millisecond of this local time within the second, in the range 0 to 999 inclusive.
        /// </summary>
        /// <value>The millisecond of this local time within the second, in the range 0 to 999 inclusive.</value>
        public int Millisecond
        {
            get
            {
                unchecked
                {
                    long milliSecondOfDay = (nanoseconds / (int) NanosecondsPerMillisecond);
                    return (int) (milliSecondOfDay % MillisecondsPerSecond);
                }
            }
        }

        // TODO(optimization): Rewrite for performance?
        /// <summary>
        /// Gets the tick of this local time within the second, in the range 0 to 9,999,999 inclusive.
        /// </summary>
        /// <value>The tick of this local time within the second, in the range 0 to 9,999,999 inclusive.</value>
        public int TickOfSecond => unchecked((int) (TickOfDay % (int) TicksPerSecond));

        /// <summary>
        /// Gets the tick of this local time within the day, in the range 0 to 863,999,999,999 inclusive.
        /// </summary>
        /// <remarks>
        /// If the value does not fall on a tick boundary, it will be truncated towards zero.
        /// </remarks>
        /// <value>The tick of this local time within the day, in the range 0 to 863,999,999,999 inclusive.</value>
        public long TickOfDay => nanoseconds / NanosecondsPerTick;

        /// <summary>
        /// Gets the nanosecond of this local time within the second, in the range 0 to 999,999,999 inclusive.
        /// </summary>
        /// <value>The nanosecond of this local time within the second, in the range 0 to 999,999,999 inclusive.</value>
        public int NanosecondOfSecond => unchecked((int) (nanoseconds % NanosecondsPerSecond));

        /// <summary>
        /// Gets the nanosecond of this local time within the day, in the range 0 to 86,399,999,999,999 inclusive.
        /// </summary>
        /// <value>The nanosecond of this local time within the day, in the range 0 to 86,399,999,999,999 inclusive.</value>
        public long NanosecondOfDay => nanoseconds;

        /// <summary>
        /// Creates a new local time by adding a period to an existing time. The period must not contain
        /// any date-related units (days etc) with non-zero values.
        /// </summary>
        /// <param name="time">The time to add the period to</param>
        /// <param name="period">The period to add</param>
        /// <returns>The result of adding the period to the time, wrapping via midnight if necessary</returns>
        public static LocalTime operator +(LocalTime time, Period period)
        {
            Preconditions.CheckNotNull(period, nameof(period));
            Preconditions.CheckArgument(!period.HasDateComponent, nameof(period), "Cannot add a period with a date component to a time");
            return time.PlusHours(period.Hours)
                .PlusMinutes(period.Minutes)
                .PlusSeconds(period.Seconds)
                .PlusMilliseconds(period.Milliseconds)
                .PlusTicks(period.Ticks)
                .PlusNanoseconds(period.Nanoseconds);
        }

        /// <summary>
        /// Adds the specified period to the time. Friendly alternative to <c>operator+()</c>.
        /// </summary>
        /// <param name="time">The time to add the period to</param>
        /// <param name="period">The period to add. Must not contain any (non-zero) date units.</param>
        /// <returns>The sum of the given time and period</returns>
        public static LocalTime Add(LocalTime time, Period period) => time + period;

        /// <summary>
        /// Adds the specified period to this time. Fluent alternative to <c>operator+()</c>.
        /// </summary>
        /// <param name="period">The period to add. Must not contain any (non-zero) date units.</param>
        /// <returns>The sum of this time and the given period</returns>
        [Pure]
        public LocalTime Plus(Period period) => this + period;

        /// <summary>
        /// Creates a new local time by subtracting a period from an existing time. The period must not contain
        /// any date-related units (days etc) with non-zero values.
        /// This is a convenience operator over the <see cref="Minus(Period)"/> method.
        /// </summary>
        /// <param name="time">The time to subtract the period from</param>
        /// <param name="period">The period to subtract</param>
        /// <returns>The result of subtract the period from the time, wrapping via midnight if necessary</returns>
        public static LocalTime operator -(LocalTime time, Period period)
        {
            Preconditions.CheckNotNull(period, nameof(period));
            Preconditions.CheckArgument(!period.HasDateComponent, nameof(period), "Cannot subtract a period with a date component from a time");
            return time.PlusHours(-period.Hours)
                .PlusMinutes(-period.Minutes)
                .PlusSeconds(-period.Seconds)
                .PlusMilliseconds(-period.Milliseconds)
                .PlusTicks(-period.Ticks)
                .PlusNanoseconds(-period.Nanoseconds);
        }

        /// <summary>
        /// Subtracts the specified period from the time. Friendly alternative to <c>operator-()</c>.
        /// </summary>
        /// <param name="time">The time to subtract the period from</param>
        /// <param name="period">The period to subtract. Must not contain any (non-zero) date units.</param>
        /// <returns>The result of subtracting the given period from the time.</returns>
        public static LocalTime Subtract(LocalTime time, Period period) => time - period;

        /// <summary>
        /// Subtracts the specified period from this time. Fluent alternative to <c>operator-()</c>.
        /// </summary>
        /// <param name="period">The period to subtract. Must not contain any (non-zero) date units.</param>
        /// <returns>The result of subtracting the given period from this time.</returns>
        [Pure]
        public LocalTime Minus(Period period) => this - period;

        /// <summary>
        /// Subtracts one time from another, returning the result as a <see cref="Period"/>.
        /// </summary>
        /// <remarks>
        /// This is simply a convenience operator for calling <see cref="Period.Between(Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.LocalTime,Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.LocalTime)"/>.
        /// </remarks>
        /// <param name="lhs">The time to subtract from</param>
        /// <param name="rhs">The time to subtract</param>
        /// <returns>The result of subtracting one time from another.</returns>
        public static Period operator -(LocalTime lhs, LocalTime rhs) => Period.Between(rhs, lhs);

        /// <summary>
        /// Subtracts one time from another, returning the result as a <see cref="Period"/> with units of years, months and days.
        /// </summary>
        /// <remarks>
        /// This is simply a convenience method for calling <see cref="Period.Between(Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.LocalTime,Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.LocalTime)"/>.
        /// </remarks>
        /// <param name="lhs">The time to subtract from</param>
        /// <param name="rhs">The time to subtract</param>
        /// <returns>The result of subtracting one time from another.</returns>
        public static Period Subtract(LocalTime lhs, LocalTime rhs) => lhs - rhs;

        /// <summary>
        /// Subtracts the specified time from this time, returning the result as a <see cref="Period"/>.
        /// Fluent alternative to <c>operator-()</c>.
        /// </summary>
        /// <param name="time">The time to subtract from this</param>
        /// <returns>The difference between the specified time and this one</returns>
        [Pure]
        public Period Minus(LocalTime time) => this - time;

        /// <summary>
        /// Compares two local times for equality.
        /// See the type documentation for a description of equality semantics.
        /// </summary>
        /// <param name="lhs">The first value to compare</param>
        /// <param name="rhs">The second value to compare</param>
        /// <returns>True if the two times are the same; false otherwise</returns>
        public static bool operator ==(LocalTime lhs, LocalTime rhs) => lhs.nanoseconds == rhs.nanoseconds;

        /// <summary>
        /// Compares two local times for inequality.
        /// See the type documentation for a description of equality semantics.
        /// </summary>
        /// <param name="lhs">The first value to compare</param>
        /// <param name="rhs">The second value to compare</param>
        /// <returns>False if the two times are the same; true otherwise</returns>
        public static bool operator !=(LocalTime lhs, LocalTime rhs) => lhs.nanoseconds != rhs.nanoseconds;

        /// <summary>
        /// Compares two LocalTime values to see if the left one is strictly earlier than the right one.
        /// See the type documentation for a description of ordering semantics.
        /// </summary>
        /// <param name="lhs">First operand of the comparison</param>
        /// <param name="rhs">Second operand of the comparison</param>
        /// <returns>true if the <paramref name="lhs"/> is strictly earlier than <paramref name="rhs"/>, false otherwise.</returns>
        public static bool operator <(LocalTime lhs, LocalTime rhs) => lhs.nanoseconds < rhs.nanoseconds;

        /// <summary>
        /// Compares two LocalTime values to see if the left one is earlier than or equal to the right one.
        /// See the type documentation for a description of ordering semantics.
        /// </summary>
        /// <param name="lhs">First operand of the comparison</param>
        /// <param name="rhs">Second operand of the comparison</param>
        /// <returns>true if the <paramref name="lhs"/> is earlier than or equal to <paramref name="rhs"/>, false otherwise.</returns>
        public static bool operator <=(LocalTime lhs, LocalTime rhs) => lhs.nanoseconds <= rhs.nanoseconds;

        /// <summary>
        /// Compares two LocalTime values to see if the left one is strictly later than the right one.
        /// See the type documentation for a description of ordering semantics.
        /// </summary>
        /// <param name="lhs">First operand of the comparison</param>
        /// <param name="rhs">Second operand of the comparison</param>
        /// <returns>true if the <paramref name="lhs"/> is strictly later than <paramref name="rhs"/>, false otherwise.</returns>
        public static bool operator >(LocalTime lhs, LocalTime rhs) => lhs.nanoseconds > rhs.nanoseconds;

        /// <summary>
        /// Compares two LocalTime values to see if the left one is later than or equal to the right one.
        /// See the type documentation for a description of ordering semantics.
        /// </summary>
        /// <param name="lhs">First operand of the comparison</param>
        /// <param name="rhs">Second operand of the comparison</param>
        /// <returns>true if the <paramref name="lhs"/> is later than or equal to <paramref name="rhs"/>, false otherwise.</returns>
        public static bool operator >=(LocalTime lhs, LocalTime rhs) => lhs.nanoseconds >= rhs.nanoseconds;

        /// <summary>
        /// Indicates whether this time is earlier, later or the same as another one.
        /// See the type documentation for a description of ordering semantics.
        /// </summary>
        /// <param name="other">The other date/time to compare this one with</param>
        /// <returns>A value less than zero if this time is earlier than <paramref name="other"/>;
        /// zero if this time is the same as <paramref name="other"/>; a value greater than zero if this time is
        /// later than <paramref name="other"/>.</returns>
        public int CompareTo(LocalTime other) => nanoseconds.CompareTo(other.nanoseconds);

        /// <summary>
        /// Implementation of <see cref="IComparable.CompareTo"/> to compare two LocalTimes.
        /// See the type documentation for a description of ordering semantics.
        /// </summary>
        /// <remarks>
        /// This uses explicit interface implementation to avoid it being called accidentally. The generic implementation should usually be preferred.
        /// </remarks>
        /// <exception cref="ArgumentException"><paramref name="obj"/> is non-null but does not refer to an instance of <see cref="LocalTime"/>.</exception>
        /// <param name="obj">The object to compare this value with.</param>
        /// <returns>The result of comparing this LocalTime with another one; see <see cref="CompareTo"/> for general details.
        /// If <paramref name="obj"/> is null, this method returns a value greater than 0.
        /// </returns>
        int IComparable.CompareTo(object? obj)
        {
            if (obj is null)
            {
                return 1;
            }
            Preconditions.CheckArgument(obj is LocalTime, nameof(obj), "Object must be of type NodaTime.LocalTime.");
            return CompareTo((LocalTime) obj);
        }

        /// <summary>
        /// Returns a hash code for this local time.
        /// See the type documentation for a description of equality semantics.
        /// </summary>
        /// <returns>A hash code for this local time.</returns>
        public override int GetHashCode() => nanoseconds.GetHashCode();

        /// <summary>
        /// Compares this local time with the specified one for equality.
        /// See the type documentation for a description of equality semantics.
        /// </summary>
        /// <param name="other">The other local time to compare this one with</param>
        /// <returns>True if the specified time is equal to this one; false otherwise</returns>
        public bool Equals(LocalTime other) => this == other;

        /// <summary>
        /// Compares this local time with the specified reference.
        /// See the type documentation for a description of equality semantics.
        /// </summary>
        /// <param name="obj">The object to compare this one with</param>
        /// <returns>True if the specified value is a local time which is equal to this one; false otherwise</returns>
        public override bool Equals(object? obj) => obj is LocalTime other && this == other;

        /// <summary>
        /// Returns a new LocalTime representing the current value with the given number of hours added.
        /// </summary>
        /// <remarks>
        /// If the value goes past the start or end of the day, it wraps - so 11pm plus two hours is 1am, for example.
        /// </remarks>
        /// <param name="hours">The number of hours to add</param>
        /// <returns>The current value plus the given number of hours.</returns>
        [Pure]
        public LocalTime PlusHours(long hours) => TimePeriodField.Hours.Add(this, hours);

        /// <summary>
        /// Returns a new LocalTime representing the current value with the given number of minutes added.
        /// </summary>
        /// <remarks>
        /// If the value goes past the start or end of the day, it wraps - so 11pm plus 120 minutes is 1am, for example.
        /// </remarks>
        /// <param name="minutes">The number of minutes to add</param>
        /// <returns>The current value plus the given number of minutes.</returns>
        [Pure]
        public LocalTime PlusMinutes(long minutes) => TimePeriodField.Minutes.Add(this, minutes);

        /// <summary>
        /// Returns a new LocalTime representing the current value with the given number of seconds added.
        /// </summary>
        /// <remarks>
        /// If the value goes past the start or end of the day, it wraps - so 11:59pm plus 120 seconds is 12:01am, for example.
        /// </remarks>
        /// <param name="seconds">The number of seconds to add</param>
        /// <returns>The current value plus the given number of seconds.</returns>
        [Pure]
        public LocalTime PlusSeconds(long seconds) => TimePeriodField.Seconds.Add(this, seconds);

        /// <summary>
        /// Returns a new LocalTime representing the current value with the given number of milliseconds added.
        /// </summary>
        /// <param name="milliseconds">The number of milliseconds to add</param>
        /// <returns>The current value plus the given number of milliseconds.</returns>
        [Pure]
        public LocalTime PlusMilliseconds(long milliseconds) => TimePeriodField.Milliseconds.Add(this, milliseconds);

        /// <summary>
        /// Returns a new LocalTime representing the current value with the given number of ticks added.
        /// </summary>
        /// <param name="ticks">The number of ticks to add</param>
        /// <returns>The current value plus the given number of ticks.</returns>
        [Pure]
        public LocalTime PlusTicks(long ticks) => TimePeriodField.Ticks.Add(this, ticks);

        /// <summary>
        /// Returns a new LocalTime representing the current value with the given number of nanoseconds added.
        /// </summary>
        /// <param name="nanoseconds">The number of nanoseconds to add</param>
        /// <returns>The current value plus the given number of ticks.</returns>
        [Pure]
        public LocalTime PlusNanoseconds(long nanoseconds) => TimePeriodField.Nanoseconds.Add(this, nanoseconds);

        /// <summary>
        /// Returns this time, with the given adjuster applied to it.
        /// </summary>
        /// <remarks>
        /// If the adjuster attempts to construct an invalid time, any exception thrown by
        /// that construction attempt will be propagated through this method.
        /// </remarks>
        /// <param name="adjuster">The adjuster to apply.</param>
        /// <returns>The adjusted time.</returns>
        [Pure]
        public LocalTime With(Func<LocalTime, LocalTime> adjuster) =>
            Preconditions.CheckNotNull(adjuster, nameof(adjuster)).Invoke(this);

        /// <summary>
        /// Returns an <see cref="OffsetTime"/> for this time-of-day with the given offset.
        /// </summary>
        /// <remarks>This method is purely a convenient alternative to calling the <see cref="OffsetTime"/> constructor directly.</remarks>
        /// <param name="offset">The offset to apply.</param>
        /// <returns>The result of this time-of-day offset by the given amount.</returns>
        [Pure]
        public OffsetTime WithOffset(Offset offset) => new OffsetTime(this, offset);

        /// <summary>
        /// Combines this <see cref="LocalTime"/> with the given <see cref="LocalDate"/>
        /// into a single <see cref="LocalDateTime"/>.
        /// Fluent alternative to <c>operator+()</c>.
        /// </summary>
        /// <param name="date">The date to combine with this time</param>
        /// <returns>The <see cref="LocalDateTime"/> representation of the given time on this date</returns>
        [Pure]
        public LocalDateTime On(LocalDate date) => date + this;

        /// <summary>
        /// Deconstruct this time into its components.
        /// </summary>
        /// <param name="hour">The hour of the time.</param>
        /// <param name="minute">The minute of the hour.</param>
        /// <param name="second">The second within the minute.</param>
        [Pure]
        public void Deconstruct(out int hour, out int minute, out int second)
        {
            hour = Hour;
            minute = Minute;
            second = Second;
        }

        /// <summary>
        /// Returns the later time of the given two.
        /// </summary>
        /// <param name="x">The first time to compare.</param>
        /// <param name="y">The second time to compare.</param>
        /// <returns>The later instant of <paramref name="x"/> or <paramref name="y"/>.</returns>
        public static LocalTime Max(LocalTime x, LocalTime y)
        {
            return x > y ? x : y;
        }

        /// <summary>
        /// Returns the earlier time of the given two.
        /// </summary>
        /// <param name="x">The first time to compare.</param>
        /// <param name="y">The second time to compare.</param>
        /// <returns>The earlier time of <paramref name="x"/> or <paramref name="y"/>.</returns>
        public static LocalTime Min(LocalTime x, LocalTime y) => x < y ? x : y;

        #region Formatting
        /// <summary>
        /// Returns a <see cref="System.String" /> that represents this instance.
        /// </summary>
        /// <returns>
        /// The value of the current instance in the default format pattern ("T"), using the current thread's
        /// culture to obtain a format provider.
        /// </returns>
        public override string ToString() => LocalTimePattern.BclSupport.Format(this, null, CultureInfo.CurrentCulture);

        /// <summary>
        /// Formats the value of the current instance using the specified pattern.
        /// </summary>
        /// <returns>
        /// A <see cref="System.String" /> containing the value of the current instance in the specified format.
        /// </returns>
        /// <param name="patternText">The <see cref="System.String" /> specifying the pattern to use,
        /// or null to use the default format pattern ("T").
        /// </param>
        /// <param name="formatProvider">The <see cref="System.IFormatProvider" /> to use when formatting the value,
        /// or null to use the current thread's culture to obtain a format provider.
        /// </param>
        /// <filterpriority>2</filterpriority>
        public string ToString(string? patternText, IFormatProvider? formatProvider) =>
            LocalTimePattern.BclSupport.Format(this, patternText, formatProvider);
        #endregion Formatting

        #region XML serialization
        /// <summary>
        /// Adds the XML schema type describing the structure of the <see cref="LocalTime"/> XML serialization to the given <paramref name="xmlSchemaSet"/>.
        /// the <paramref name="xmlSchemaSet"/>.
        /// </summary>
        /// <param name="xmlSchemaSet">The XML schema set provided by <see cref="XmlSchemaExporter"/>.</param>
        /// <returns>The qualified name of the schema type that was added to the <paramref name="xmlSchemaSet"/>.</returns>
        public static XmlQualifiedName AddSchema(XmlSchemaSet xmlSchemaSet) => Xml.XmlSchemaDefinition.AddLocalTimeSchemaType(xmlSchemaSet);

        /// <inheritdoc />
        XmlSchema IXmlSerializable.GetSchema() => null!; // TODO(nullable): Return XmlSchema? when docfx works with that

        /// <inheritdoc />
        void IXmlSerializable.ReadXml(XmlReader reader)
        {
            Preconditions.CheckNotNull(reader, nameof(reader));
            var pattern = LocalTimePattern.ExtendedIso;
            string text = reader.ReadElementContentAsString();
            Unsafe.AsRef(this) = pattern.Parse(text).Value;
        }

        /// <inheritdoc />
        void IXmlSerializable.WriteXml(XmlWriter writer)
        {
            Preconditions.CheckNotNull(writer, nameof(writer));
            writer.WriteString(LocalTimePattern.ExtendedIso.Format(this));
        }
        #endregion

        #region TimeOnly conversions (.NET 6 only)
#if NET6_0_OR_GREATER
        /// <summary>
        /// Converts this value to an equivalent <see cref="TimeOnly"/>.
        /// </summary>
        /// <remarks>
        /// If the value does not fall on a tick boundary, it will be truncated to the earlier tick boundary.
        /// </remarks>
        /// <returns>A <see cref="TimeOnly"/> value equivalent to this one.</returns>
        [Pure]
        public TimeOnly ToTimeOnly() => new TimeOnly(TickOfDay);

        /// <summary>
        /// Constructs a <see cref="LocalTime"/> from a <see cref="TimeOnly"/>.
        /// </summary>
        /// <param name="time">The time of day to convert.</param>
        /// <returns>The <see cref="LocalTime"/> equivalent.</returns>
        public static LocalTime FromTimeOnly(TimeOnly time) => FromTicksSinceMidnight(time.Ticks);
#endif
        #endregion
    }
}
