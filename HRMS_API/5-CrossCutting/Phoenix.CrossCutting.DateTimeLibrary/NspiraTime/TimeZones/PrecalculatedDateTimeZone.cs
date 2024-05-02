// Copyright 2009 The Noda Time Authors. All rights reserved.
// Use of this source code is governed by the Apache License 2.0,
// as found in the LICENSE.txt file.

using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Annotations;
using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.TimeZones.IO;
using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Utility;

namespace Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.TimeZones
{
    /// <summary>
    /// Most time zones have a relatively small set of transitions at their start until they finally 
    /// settle down to either a fixed time zone or a daylight savings time zone. This provides the
    /// container for the initial zone intervals and a pointer to the time zone that handles all of
    /// the rest until the end of time.
    /// </summary>
    internal sealed class PrecalculatedDateTimeZone : DateTimeZone
    {
        private readonly ZoneInterval[] periods;
        private readonly IZoneIntervalMap? tailZone;
        /// <summary>
        /// The first instant covered by the tail zone, or Instant.AfterMaxValue if there's no tail zone.
        /// </summary>
        private readonly Instant tailZoneStart;
        private readonly ZoneInterval? firstTailZoneInterval;

        /// <summary>
        /// Initializes a new instance of the <see cref="PrecalculatedDateTimeZone"/> class.
        /// </summary>
        /// <param name="id">The id.</param>
        /// <param name="intervals">The intervals before the tail zone.</param>
        /// <param name="tailZone">The tail zone - which can be any IZoneIntervalMap for normal operation,
        /// but must be a StandardDaylightAlternatingMap if the result is to be serialized.</param>
        [VisibleForTesting]
        internal PrecalculatedDateTimeZone(string id, ZoneInterval[] intervals, IZoneIntervalMap? tailZone)
            : base(id, false,
                   ComputeOffset(intervals, tailZone, Offset.Min),
                   ComputeOffset(intervals, tailZone, Offset.Max))
        {
            this.periods = intervals;
            this.tailZone = tailZone;
            this.tailZoneStart = intervals[intervals.Length - 1].RawEnd; // We want this to be AfterMaxValue for tail-less zones.
            if (tailZone != null)
            {
                // Cache a "clamped" zone interval for use at the start of the tail zone.
                firstTailZoneInterval = tailZone.GetZoneInterval(tailZoneStart).WithStart(tailZoneStart);
            }
            ValidatePeriods(intervals, tailZone);
        }

        /// <summary>
        /// Validates that all the periods before the tail zone make sense. We have to start at the beginning of time,
        /// and then have adjoining periods. This is only called in the constructors.
        /// </summary>
        /// <remarks>This is only called from the constructors, but is internal to make it easier to test.</remarks>
        /// <exception cref="ArgumentException">The periods specified are invalid.</exception>
        internal static void ValidatePeriods(ZoneInterval[] periods, IZoneIntervalMap? tailZone)
        {
            Preconditions.CheckArgument(periods.Length > 0, nameof(periods), "No periods specified in precalculated time zone");
            Preconditions.CheckArgument(!periods[0].HasStart, nameof(periods), "Periods in precalculated time zone must start with the beginning of time");
            for (int i = 0; i < periods.Length - 1; i++)
            {
                // Safe to use End here: there can't be a period *after* an endless one. Likewise it's safe to use Start on the next 
                // period, as there can't be a period *before* one which goes back to the start of time.
                Preconditions.CheckArgument(periods[i].End == periods[i + 1].Start, nameof(periods), "Non-adjoining ZoneIntervals for precalculated time zone");
            }
            Preconditions.CheckArgument(tailZone != null || periods[periods.Length - 1].RawEnd == Instant.AfterMaxValue, nameof(tailZone), "Null tail zone given but periods don't cover all of time");
        }

        /// <summary>
        /// Gets the zone offset period for the given instant.
        /// </summary>
        /// <param name="instant">The Instant to find.</param>
        /// <returns>The ZoneInterval including the given instant.</returns>
        public override ZoneInterval GetZoneInterval(Instant instant)
        {
            if (tailZone != null && instant >= tailZoneStart)
            {
                // Clamp the tail zone interval to start at the end of our final period, if necessary, so that the
                // join is seamless.
                ZoneInterval intervalFromTailZone = tailZone.GetZoneInterval(instant);
                return intervalFromTailZone.RawStart < tailZoneStart ? firstTailZoneInterval! : intervalFromTailZone;
            }

            int lower = 0; // Inclusive
            int upper = periods.Length; // Exclusive

            while (lower < upper)
            {
                int current = (lower + upper) / 2;
                var candidate = periods[current];
                if (candidate.RawStart > instant)
                {
                    upper = current;
                }
                // Safe to use RawEnd, as it's just for the comparison.
                else if (candidate.RawEnd <= instant)
                {
                    lower = current + 1;
                }
                else
                {
                    return candidate;
                }
            }
            // Note: this would indicate a bug. The time zone is meant to cover the whole of time.
            throw new InvalidOperationException($"Instant {instant} did not exist in time zone {Id}");
        }

        #region I/O
        /// <summary>
        /// Writes the time zone to the specified writer.
        /// </summary>
        /// <param name="writer">The writer to write to.</param>
        internal void Write(IDateTimeZoneWriter writer)
        {
            Preconditions.CheckNotNull(writer, nameof(writer));

            // We used to create a pool of strings just for this zone. This was more efficient
            // for some zones, as it meant that each string would be written out with just a single
            // byte after the pooling. Optimizing the string pool globally instead allows for
            // roughly the same efficiency, and simpler code here.
            writer.WriteCount(periods.Length);
            Instant? previous = null;
            foreach (var period in periods)
            {
                writer.WriteZoneIntervalTransition(previous, (Instant) (previous = period.RawStart));
                writer.WriteString(period.Name);
                writer.WriteOffset(period.WallOffset);
                writer.WriteOffset(period.Savings);
            }
            writer.WriteZoneIntervalTransition(previous, tailZoneStart);
            // We could just check whether we've got to the end of the stream, but this
            // feels slightly safer.
            writer.WriteByte((byte) (tailZone is null ? 0 : 1));
            if (tailZone != null)
            {
                // This is the only kind of zone we support in the new format. Enforce that...
                var tailDstZone = (StandardDaylightAlternatingMap) tailZone;
                tailDstZone.Write(writer);
            }
        }

        /// <summary>
        /// Reads a time zone from the specified reader.
        /// </summary>
        /// <param name="reader">The reader.</param>
        /// <param name="id">The id.</param>
        /// <returns>The time zone.</returns>
        internal static DateTimeZone Read([Trusted] IDateTimeZoneReader reader, [Trusted] string id)
        {
            Preconditions.DebugCheckNotNull(reader, nameof(reader));
            Preconditions.DebugCheckNotNull(id, nameof(id));
            int size = reader.ReadCount();
            var periods = new ZoneInterval[size];
            // It's not entirely clear why we don't just assume that the first zone interval always starts at Instant.BeforeMinValue
            // (given that we check that later) but we don't... and changing that now could cause compatibility issues.
            var start = reader.ReadZoneIntervalTransition(null);
            for (int i = 0; i < size; i++)
            {
                var name = reader.ReadString();
                var offset = reader.ReadOffset();
                var savings = reader.ReadOffset();
                var nextStart = reader.ReadZoneIntervalTransition(start);
                periods[i] = new ZoneInterval(name, start, nextStart, offset, savings);
                start = nextStart;
            }
            var tailZone = reader.ReadByte() == 1 ? StandardDaylightAlternatingMap.Read(reader) : null;
            return new PrecalculatedDateTimeZone(id, periods, tailZone);
        }
        #endregion // I/O

        #region Offset computation for constructors
        // Essentially Func<Offset, Offset, Offset>
        private delegate Offset OffsetAggregator(Offset x, Offset y);
        private delegate Offset OffsetExtractor<in T>(T input);

        // Reasonably simple way of computing the maximum/minimum offset
        // from either periods or transitions, with or without a tail zone.
        private static Offset ComputeOffset(ZoneInterval[] intervals,
            IZoneIntervalMap? tailZone,
            OffsetAggregator aggregator)
        {
            Preconditions.CheckNotNull(intervals, nameof(intervals));
            Preconditions.CheckArgument(intervals.Length > 0, nameof(intervals), "No intervals specified");
            Offset ret = intervals[0].WallOffset;
            for (int i = 1; i < intervals.Length; i++)
            {
                ret = aggregator(ret, intervals[i].WallOffset);
            }
            if (tailZone != null)
            {
                // Effectively a shortcut for picking either tailZone.MinOffset or
                // tailZone.MaxOffset
                Offset bestFromZone = aggregator(tailZone.MinOffset, tailZone.MaxOffset);
                ret = aggregator(ret, bestFromZone);
            }
            return ret;
        }
        #endregion        
    }
}
