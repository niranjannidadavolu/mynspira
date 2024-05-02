// Copyright 2009 The Noda Time Authors. All rights reserved.
// Use of this source code is governed by the Apache License 2.0,
// as found in the LICENSE.txt file.

namespace Phoenix.CrossCutting.DateTimeLibrary.NspiraTime
{
    /// <summary>
    /// Useful constants, mostly along the lines of "number of milliseconds in an hour".
    /// </summary>
    public static class NodaConstants
    {
        /// <summary>
        /// A constant for the number of nanoseconds in a tick. The value of this constant is 100.
        /// </summary>
        public const long NanosecondsPerTick = 100;

        /// <summary>
        /// A constant for the number of nanoseconds in a microsecond. The value of this constant is 1,000.
        /// </summary>
        public const long NanosecondsPerMicrosecond = 1000;

        /// <summary>
        /// A constant for the number of nanoseconds in a millisecond. The value of this constant is 1,000,000.
        /// </summary>
        public const long NanosecondsPerMillisecond = 1000000;

        /// <summary>
        /// A constant for the number of nanoseconds in a second. The value of this constant is 1,000,000,000.
        /// </summary>
        public const long NanosecondsPerSecond = 1000000000;

        /// <summary>
        /// A constant for the number of nanoseconds in a minute. The value of this constant is 60,000,000,000.
        /// </summary>
        public const long NanosecondsPerMinute = NanosecondsPerSecond * SecondsPerMinute;

        /// <summary>
        /// A constant for the number of nanoseconds in an hour. The value of this constant is 3,600,000,000,000.
        /// </summary>
        public const long NanosecondsPerHour = NanosecondsPerMinute * MinutesPerHour;

        /// <summary>
        /// A constant for the number of nanoseconds in a standard 24-hour day. The value of this constant is 86,400,000,000,000.
        /// </summary>
        public const long NanosecondsPerDay = NanosecondsPerHour * HoursPerDay;

        /// <summary>
        /// A constant for the number of nanoseconds in a standard week of seven 24-hour days. The value of this constant is 604,800,000,000,000.
        /// </summary>
        public const long NanosecondsPerWeek = NanosecondsPerDay * DaysPerWeek;

        /// <summary>
        /// A constant for the number of ticks in a millisecond. The value of this constant is 10,000.
        /// </summary>
        public const long TicksPerMillisecond = TimeSpan.TicksPerMillisecond;
        /// <summary>
        /// A constant for the number of ticks in a second. The value of this constant is 10,000,000.
        /// </summary>
        public const long TicksPerSecond = TicksPerMillisecond * MillisecondsPerSecond;
        /// <summary>
        /// A constant for the number of ticks in a minute. The value of this constant is 600,000,000.
        /// </summary>
        public const long TicksPerMinute = TicksPerSecond * SecondsPerMinute;
        /// <summary>
        /// A constant for the number of ticks in an hour. The value of this constant is 36,000,000,000.
        /// </summary>
        public const long TicksPerHour = TicksPerMinute * MinutesPerHour;

        /// <summary>
        /// A constant for the number of ticks in a standard 24-hour day.
        /// The value of this constant is 864,000,000,000.
        /// </summary>
        public const long TicksPerDay = TicksPerHour * HoursPerDay;

        /// <summary>
        /// A constant for the number of ticks in a standard week of seven 24-hour days.
        /// The value of this constant is 6,048,000,000,000.
        /// </summary>
        public const long TicksPerWeek = TicksPerDay * DaysPerWeek;

        /// <summary>
        /// A constant for the number of microseconds per second.
        /// The value of this constant is 1,000,000.
        /// </summary>
        public const long MicrosecondsPerSecond = 1000000;

        /// <summary>
        /// A constant for the number of milliseconds per second.
        /// The value of this constant is 1000.
        /// </summary>
        public const int MillisecondsPerSecond = 1000;
        /// <summary>
        /// A constant for the number of milliseconds per minute.
        /// The value of this constant is 60,000.
        /// </summary>
        public const int MillisecondsPerMinute = MillisecondsPerSecond * SecondsPerMinute;
        /// <summary>
        /// A constant for the number of milliseconds per hour.
        /// The value of this constant is 3,600,000.
        /// </summary>
        public const int MillisecondsPerHour = MillisecondsPerMinute * MinutesPerHour;
        /// <summary>
        /// A constant for the number of milliseconds per standard 24-hour day.
        /// The value of this constant is 86,400,000.
        /// </summary>
        public const int MillisecondsPerDay = MillisecondsPerHour * HoursPerDay;
        /// <summary>
        /// A constant for the number of milliseconds per standard week of seven 24-hour days.
        /// The value of this constant is 604,800,000.
        /// </summary>
        public const int MillisecondsPerWeek = MillisecondsPerDay * DaysPerWeek;

        /// <summary>
        /// A constant for the number of seconds per minute.
        /// The value of this constant is 60.
        /// </summary>
        public const int SecondsPerMinute = 60;
        /// <summary>
        /// A constant for the number of seconds per hour.
        /// The value of this constant is 3,600.
        /// </summary>
        public const int SecondsPerHour = SecondsPerMinute * MinutesPerHour;
        /// <summary>
        /// A constant for the number of seconds per standard 24-hour day.
        /// The value of this constant is 86,400.
        /// </summary>
        public const int SecondsPerDay = SecondsPerHour * HoursPerDay;
        /// <summary>
        /// A constant for the number of seconds per standard week of seven 24-hour days.
        /// The value of this constant is 604,800.
        /// </summary>
        public const int SecondsPerWeek = SecondsPerDay * DaysPerWeek;

        /// <summary>
        /// A constant for the number of minutes per hour.
        /// The value of this constant is 60.
        /// </summary>
        public const int MinutesPerHour = 60;
        /// <summary>
        /// A constant for the number of minutes per standard 24-hour day.
        /// The value of this constant is 1,440.
        /// </summary>
        public const int MinutesPerDay = MinutesPerHour * HoursPerDay;
        /// <summary>
        /// A constant for the number of minutes per standard week of seven 24-hour days.
        /// The value of this constant is 10,080.
        /// </summary>
        public const int MinutesPerWeek = MinutesPerDay * DaysPerWeek;

        /// <summary>
        /// A constant for the number of hours in a standard day. Note that the number of hours
        /// in a day can vary due to daylight saving effects.
        /// The value of this constant is 24.
        /// </summary>
        public const int HoursPerDay = 24;
        /// <summary>
        /// A constant for the number of hours in a standard week of seven 24-hour days.
        /// The value of this constant is 168.
        /// </summary>
        public const int HoursPerWeek = HoursPerDay * DaysPerWeek;

        /// <summary>
        /// Number of days in a standard Gregorian week.
        /// The value of this constant is 7.
        /// </summary>
        public const int DaysPerWeek = 7;

        /// <summary>
        /// The instant at the Unix epoch of midnight 1st January 1970 UTC.
        /// </summary>
        public static Instant UnixEpoch { get; } = Instant.FromUnixTimeTicks(0);

        /// <summary>
        /// The instant at the BCL epoch of midnight 1st January 0001 UTC.
        /// </summary>
        public static Instant BclEpoch { get; } = Instant.FromUtc(1, 1, 1, 0, 0);

        /// <summary>
        /// The instant at the Julian epoch of noon (UTC) January 1st 4713 BCE in the proleptic
        /// Julian calendar, or November 24th 4714 BCE in the proleptic Gregorian calendar.
        /// </summary>
        public static Instant JulianEpoch { get; } = Instant.FromUtc(-4713, 11, 24, 12, 0);

        // These are checked in NodaConstantsTest.
        /// <summary>
        /// The number of ticks in a BCL DateTime at the Unix epoch.
        /// </summary>
        internal const long BclTicksAtUnixEpoch = 621355968000000000;

        /// <summary>
        /// The number of days in a BCL DateTime at the Unix epoch.
        /// </summary>
        internal const int BclDaysAtUnixEpoch = 719162;
    }
}
