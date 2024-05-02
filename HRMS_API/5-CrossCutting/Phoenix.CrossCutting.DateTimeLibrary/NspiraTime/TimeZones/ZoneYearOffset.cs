// Copyright 2009 The Noda Time Authors. All rights reserved.
// Use of this source code is governed by the Apache License 2.0,
// as found in the LICENSE.txt file.

using System.Globalization;
using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.TimeZones.IO;
using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Utility;

namespace Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.TimeZones
{
    /// <summary>
    /// Defines an offset within a year as an expression that can be used to reference multiple
    /// years.
    /// </summary>
    /// <remarks>
    /// <para>
    /// A year offset defines a way of determining an offset into a year based on certain criteria.
    /// The most basic is the month of the year and the day of the month. If only these two are
    /// supplied then the offset is always the same day of each year. The only exception is if the
    /// day is February 29th, then it only refers to those years that have a February 29th.
    /// </para>
    /// <para>
    /// If the day of the week is specified then the offset determined by the month and day are
    /// adjusted to the nearest day that falls on the given day of the week. If the month and day
    /// fall on that day of the week then nothing changes. Otherwise the offset is moved forward or
    /// backward up to 6 days to make the day fall on the correct day of the week. The direction the
    /// offset is moved is determined by the <see cref="AdvanceDayOfWeek"/> property.
    /// </para>
    /// <para>
    /// Finally the <see cref="Mode"/> property determines whether the <see cref="TimeOfDay"/> value
    /// is added to the calculated offset to generate an offset within the day.
    /// </para>
    /// <para>
    /// Immutable, thread safe
    /// </para>
    /// </remarks>
    internal sealed class ZoneYearOffset : IEquatable<ZoneYearOffset?>
    {
        private readonly int dayOfMonth;
        private readonly int dayOfWeek;
        private readonly int monthOfYear;
        private readonly bool addDay;

        /// <summary>
        /// Gets the method by which offsets are added to Instants to get LocalInstants.
        /// </summary>
        public TransitionMode Mode { get; }

        /// <summary>
        /// Gets a value indicating whether [advance day of week].
        /// </summary>
        public bool AdvanceDayOfWeek { get; }

        /// <summary>
        /// Gets the time of day when the rule takes effect.
        /// </summary>
        public LocalTime TimeOfDay { get; }

        /// <summary>
        /// Initializes a new instance of the <see cref="ZoneYearOffset"/> class.
        /// </summary>
        /// <param name="mode">The transition mode.</param>
        /// <param name="monthOfYear">The month year offset.</param>
        /// <param name="dayOfMonth">The day of month. Negatives count from end of month.</param>
        /// <param name="dayOfWeek">The day of week. 0 means not set.</param>
        /// <param name="advance">if set to <c>true</c> [advance].</param>
        /// <param name="timeOfDay">The tick within the day.</param>
        internal ZoneYearOffset(TransitionMode mode, int monthOfYear, int dayOfMonth, int dayOfWeek, bool advance, LocalTime timeOfDay)
            : this(mode, monthOfYear, dayOfMonth, dayOfWeek, advance, timeOfDay, false)
        {
        }

        /// <summary>
        /// Initializes a new instance of the <see cref="ZoneYearOffset"/> class.
        /// </summary>
        /// <param name="mode">The transition mode.</param>
        /// <param name="monthOfYear">The month year offset.</param>
        /// <param name="dayOfMonth">The day of month. Negatives count from end of month.</param>
        /// <param name="dayOfWeek">The day of week. 0 means not set.</param>
        /// <param name="advance">if set to <c>true</c> [advance].</param>
        /// <param name="timeOfDay">The time of day at which the transition occurs.</param>
        /// <param name="addDay">Whether to add an extra day (for 24:00 handling).</param>
        internal ZoneYearOffset(TransitionMode mode, int monthOfYear, int dayOfMonth, int dayOfWeek, bool advance, LocalTime timeOfDay, bool addDay)
        {
            VerifyFieldValue(1, 12, "monthOfYear", monthOfYear, false);
            VerifyFieldValue(1, 31, "dayOfMonth", dayOfMonth, true);
            if (dayOfWeek != 0)
            {
                VerifyFieldValue(1, 7, "dayOfWeek", dayOfWeek, false);
            }

            this.Mode = mode;
            this.monthOfYear = monthOfYear;
            this.dayOfMonth = dayOfMonth;
            this.dayOfWeek = dayOfWeek;
            this.AdvanceDayOfWeek = advance;
            this.TimeOfDay = timeOfDay;
            this.addDay = addDay;
        }

        /// <summary>
        /// Verifies the input value against the valid range of the calendar field.
        /// </summary>
        /// <remarks>
        /// If this becomes more widely required, move to Preconditions.
        /// </remarks>
        /// <param name="minimum">The minimum valid value.</param>
        /// <param name="maximum">The maximum valid value (inclusive).</param>
        /// <param name="name">The name of the field for the error message.</param>
        /// <param name="value">The value to check.</param>
        /// <param name="allowNegated">if set to <c>true</c> all the range of value to be the negative as well.</param>
        /// <exception cref="ArgumentOutOfRangeException">If the given value is not in the valid range of the given calendar field.</exception>
        private static void VerifyFieldValue(long minimum, long maximum, string name, long value, bool allowNegated)
        {
            bool failed = false;
            if (allowNegated && value < 0)
            {
                if (value < -maximum || -minimum < value)
                {
                    failed = true;
                }
            }
            else
            {
                if (value < minimum || maximum < value)
                {
                    failed = true;
                }
            }
            if (failed)
            {
                string range = allowNegated ? $"[{minimum}, {maximum}] or [{-maximum}, {-minimum}]" : $"[{minimum}, {maximum}]";
                throw new ArgumentOutOfRangeException(name, value, $"{name} is not in the valid range: {range}");
            }
        }

        #region IEquatable<ZoneYearOffset> Members

        /// <summary>
        /// Indicates whether the current object is equal to another object of the same type.
        /// </summary>
        /// <param name="other">An object to compare with this object.</param>
        /// <returns>
        /// true if the current object is equal to the <paramref name="other"/> parameter; otherwise, false.
        /// </returns>
        public bool Equals(ZoneYearOffset? other)
        {
            if (other is null)
            {
                return false;
            }
            if (ReferenceEquals(this, other))
            {
                return true;
            }
            return Mode == other.Mode &&
                   monthOfYear == other.monthOfYear &&
                   dayOfMonth == other.dayOfMonth &&
                   dayOfWeek == other.dayOfWeek &&
                   AdvanceDayOfWeek == other.AdvanceDayOfWeek &&
                   TimeOfDay == other.TimeOfDay &&
                   addDay == other.addDay;
        }

        #endregion

        public override string ToString() =>
            string.Format(CultureInfo.InvariantCulture,
                "ZoneYearOffset[mode:{0} monthOfYear:{1} dayOfMonth:{2} dayOfWeek:{3} advance:{4} timeOfDay:{5:r} addDay:{6}]",
                Mode, monthOfYear, dayOfMonth, dayOfWeek, AdvanceDayOfWeek, TimeOfDay, addDay);

        /// <summary>
        /// Returns the occurrence of this rule within the given year, as a LocalInstant.
        /// </summary>
        /// <remarks>LocalInstant is used here so that we can use the representation of "AfterMaxValue"
        /// for December 31st 9999 24:00.</remarks>
        internal LocalInstant GetOccurrenceForYear(int year)
        {
            unchecked
            {
                int actualDayOfMonth = dayOfMonth > 0 ? dayOfMonth : CalendarSystem.Iso.GetDaysInMonth(year, monthOfYear) + dayOfMonth + 1;
                if (monthOfYear == 2 && dayOfMonth == 29 && !CalendarSystem.Iso.IsLeapYear(year))
                {
                    // In zic.c, this would result in an error if dayOfWeek is 0 or AdvanceDayOfWeek is true.
                    // However, it's very convenient to be able to ask any rule for its occurrence in any year.
                    // We rely on genuine rules being well-written - and before releasing an nzd file we always
                    // check that it's in line with zic anyway. Ignoring the brokenness is simpler than fixing
                    // rules that are only in force for a single year.
                    actualDayOfMonth = 28; // We'll now look backwards for the right day-of-week.
                }
                LocalDate date = new LocalDate(year, monthOfYear, actualDayOfMonth);
                if (dayOfWeek != 0)
                {
                    // Optimized "go to next or previous occurrence of day or week". Try to do as few comparisons
                    // as possible, and only fetch DayOfWeek once. (If we call Next or Previous, it will work it out again.)
                    int currentDayOfWeek = (int) date.DayOfWeek;
                    if (currentDayOfWeek != dayOfWeek)
                    {
                        int diff = dayOfWeek - currentDayOfWeek;
                        if (diff > 0)
                        {
                            if (!AdvanceDayOfWeek)
                            {
                                diff -= 7;
                            }
                        }
                        else if (AdvanceDayOfWeek)
                        {
                            diff += 7;
                        }
                        date = date.PlusDays(diff);
                    }
                }
                if (addDay)
                {
                    // Adding a day to the last representable day will fail, but we can return an infinite value instead.
                    if (year == 9999 && date.Month == 12 && date.Day == 31)
                    {
                        return LocalInstant.AfterMaxValue;
                    }
                    date = date.PlusDays(1);
                }
                return (date + TimeOfDay).ToLocalInstant();
            }
        }

        /// <summary>
        /// Writes this object to the given <see cref="IDateTimeZoneWriter"/>.
        /// </summary>
        /// <param name="writer">Where to send the output.</param>
        internal void Write(IDateTimeZoneWriter writer)
        {
            // Flags contains four pieces of information in a single byte:
            // 0MMDDDAP:
            // - MM is the mode (0-2)
            // - DDD is the day of week (0-7)
            // - A is the AdvanceDayOfWeek
            // - P is the "addDay" (24:00) flag
            int flags = ((int) Mode << 5) |
                        (dayOfWeek << 2) |
                        (AdvanceDayOfWeek ? 2 : 0) |
                        (addDay ? 1 : 0);
            writer.WriteByte((byte) flags);
            writer.WriteCount(monthOfYear);
            writer.WriteSignedCount(dayOfMonth);
            // The time of day is written as a number of milliseconds historical reasons.
            writer.WriteMilliseconds((int) (TimeOfDay.TickOfDay / NodaConstants.TicksPerMillisecond));
        }

        public static ZoneYearOffset Read(IDateTimeZoneReader reader)
        {
            Preconditions.CheckNotNull(reader, nameof(reader));
            int flags = reader.ReadByte();
            var mode = (TransitionMode) (flags >> 5);
            var dayOfWeek = (flags >> 2) & 7;
            var advance = (flags & 2) != 0;
            var addDay = (flags & 1) != 0;
            int monthOfYear = reader.ReadCount();
            int dayOfMonth = reader.ReadSignedCount();
            // The time of day is written as a number of milliseconds for historical reasons.
            var timeOfDay = LocalTime.FromMillisecondsSinceMidnight(reader.ReadMilliseconds());
            return new ZoneYearOffset(mode, monthOfYear, dayOfMonth, dayOfWeek, advance, timeOfDay, addDay);
        }

        /// <summary>
        /// Returns the offset to use for this rule's <see cref="TransitionMode"/>.
        /// The year/month/day/time for a rule is in a specific frame of reference:
        /// UTC, "wall" or "standard".
        /// </summary>
        /// <param name="standardOffset">The standard offset.</param>
        /// <param name="savings">The daylight savings adjustment.</param>
        /// <returns>The base time offset as a <see cref="Duration"/>.</returns>
        internal Offset GetRuleOffset(Offset standardOffset, Offset savings) => Mode switch
        {
            TransitionMode.Wall => standardOffset + savings,
            TransitionMode.Standard => standardOffset,
            _ => Offset.Zero
        };

        #region Object overrides

        /// <summary>
        /// Determines whether the specified <see cref="System.Object"/> is equal to this instance.
        /// </summary>
        /// <param name="obj">The <see cref="System.Object"/> to compare with this instance.</param>
        /// <returns>
        /// <c>true</c> if the specified <see cref="System.Object"/> is equal to this instance;
        /// otherwise, <c>false</c>.
        /// </returns>
        public override bool Equals(object? obj) => Equals(obj as ZoneYearOffset);

        /// <summary>
        /// Returns a hash code for this instance.
        /// </summary>
        /// <returns>
        /// A hash code for this instance, suitable for use in hashing algorithms and data
        /// structures like a hash table. 
        /// </returns>
        public override int GetHashCode() =>
            HashCodeHelper.Initialize()
                .Hash(Mode)
                .Hash(monthOfYear)
                .Hash(dayOfMonth)
                .Hash(dayOfWeek)
                .Hash(AdvanceDayOfWeek)
                .Hash(TimeOfDay)
                .Hash(addDay)
                .Value;
        #endregion
    }
}
