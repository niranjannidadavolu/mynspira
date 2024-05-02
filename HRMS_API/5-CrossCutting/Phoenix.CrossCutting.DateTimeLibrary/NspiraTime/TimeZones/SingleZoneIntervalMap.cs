// Copyright 2015 The Noda Time Authors. All rights reserved.
// Use of this source code is governed by the Apache License 2.0,
// as found in the LICENSE.txt file.

namespace Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.TimeZones
{
    /// <summary>
    /// Implementation of IZoneIntervalMap which just returns a single interval (provided on construction) regardless of
    /// the instant requested.
    /// </summary>
    internal sealed class SingleZoneIntervalMap : IZoneIntervalMap
    {
        private readonly ZoneInterval interval;

        public Offset MinOffset => interval.WallOffset;
        public Offset MaxOffset => interval.WallOffset;

        internal SingleZoneIntervalMap(ZoneInterval interval)
        {
            this.interval = interval;
        }

        public ZoneInterval GetZoneInterval(Instant instant) => interval;
    }
}