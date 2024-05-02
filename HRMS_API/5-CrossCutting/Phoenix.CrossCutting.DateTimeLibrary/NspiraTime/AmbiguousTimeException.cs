// Copyright 2011 The Noda Time Authors. All rights reserved.
// Use of this source code is governed by the Apache License 2.0,
// as found in the LICENSE.txt file.

using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Annotations;
using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Utility;

// Standard exception constructors: we don't *want* those constructors.
// The single constructor provided in this class populates the message and
// accepts the required parameters for populating other properties.
// There are never any other causes to the exception, at least that I can
// envisage for the moment.
#pragma warning disable CA1032

namespace Phoenix.CrossCutting.DateTimeLibrary.NspiraTime
{
    /// <summary>
    /// Exception thrown to indicate that the specified local date/time occurs twice
    /// in a particular time zone due to daylight saving time changes.
    /// </summary>
    /// <remarks>
    /// <para>
    /// This occurs for transitions where the clock goes backward (usually by
    /// an hour). For example, suppose the time zone goes backward
    /// at 2am, so the second after 01:59:59 becomes 01:00:00. In that case,
    /// times such as 01:30:00 occur twice.
    /// </para>
    /// <para>
    /// This exception is used to indicate such problems, as they're usually
    /// not the same as other <see cref="ArgumentOutOfRangeException" /> causes,
    /// such as entering "15" for a month number.
    /// </para>
    /// <para>
    /// In theory this isn't calendar-specific; the local value will be ambiguous in
    /// this time zone regardless of the calendar used. However, this exception is
    /// always created in conjunction with a specific calendar, which leads to a more
    /// natural way of examining its information and constructing an error message.
    /// </para>
    /// </remarks>
    /// <threadsafety>Any public static members of this type are thread safe. Any instance members are not guaranteed to be thread safe.
    /// See the thread safety section of the user guide for more information.
    /// </threadsafety>
    [Mutable] // Exception itself is mutable
    public sealed class AmbiguousTimeException : ArgumentOutOfRangeException
    {
        /// <summary>
        /// Get the local date and time which is ambiguous in the time zone.
        /// </summary>
        /// <value>The local date and time which is ambiguous in the time zone.</value>
        internal LocalDateTime LocalDateTime => EarlierMapping.LocalDateTime;

        /// <summary>
        /// The time zone in which the local date and time is ambiguous.
        /// </summary>
        /// <value>The time zone in which the local date and time is ambiguous.</value>
        public DateTimeZone Zone => EarlierMapping.Zone;

        /// <summary>
        /// Gets the earlier of the two occurrences of the local date and time within the time zone.
        /// </summary>
        /// <value>The earlier of the two occurrences of the local date and time within the time zone.</value>
        public ZonedDateTime EarlierMapping { get; }

        /// <summary>
        /// Gets the later of the two occurrences of the local date and time within the time zone.
        /// </summary>
        /// <value>The later of the two occurrences of the local date and time within the time zone.</value>
        public ZonedDateTime LaterMapping { get; }

        /// <summary>
        /// Constructs an instance from the given information.
        /// </summary>
        /// <remarks>
        /// <para>
        /// User code is unlikely to need to deliberately call this constructor except
        /// possibly for testing.
        /// </para>
        /// <para>
        /// The two mappings must have the same local time and time zone.
        /// </para>
        /// </remarks>
        /// <param name="earlierMapping">The earlier possible mapping</param>
        /// <param name="laterMapping">The later possible mapping</param>
        public AmbiguousTimeException(ZonedDateTime earlierMapping, ZonedDateTime laterMapping)
            : base(paramName: null, message: $"Local time {earlierMapping.LocalDateTime} is ambiguous in time zone {earlierMapping.Zone.Id}")
        {
            EarlierMapping = earlierMapping;
            LaterMapping = laterMapping;
            Preconditions.CheckArgument(earlierMapping.Zone == laterMapping.Zone, nameof(laterMapping),
                                        "Ambiguous possible values must use the same time zone");
            Preconditions.CheckArgument(earlierMapping.LocalDateTime == laterMapping.LocalDateTime, nameof(laterMapping),
                                        "Ambiguous possible values must have the same local date/time");
        }
    }
}
