﻿// Copyright 2014 The Noda Time Authors. All rights reserved.
// Use of this source code is governed by the Apache License 2.0,
// as found in the LICENSE.txt file.

using System.Diagnostics;
using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Utility;

namespace Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Extensions
{
    /// <summary>
    /// Extension methods for <see cref="Stopwatch"/>.
    /// </summary>
    public static class StopwatchExtensions
    {
        /// <summary>
        /// Returns the elapsed time of <paramref name="stopwatch"/> as a <see cref="Duration"/>.
        /// </summary>
        /// <param name="stopwatch">The <c>Stopwatch</c> to obtain the elapsed time from.</param>
        /// <returns>The elapsed time of <paramref name="stopwatch"/> as a <c>Duration</c>.</returns>
        public static Duration ElapsedDuration(this Stopwatch stopwatch)
        {
            Preconditions.CheckNotNull(stopwatch, nameof(stopwatch));
            return stopwatch.Elapsed.ToDuration();
        }
    }
}
