﻿// Copyright 2014 The Noda Time Authors. All rights reserved.
// Use of this source code is governed by the Apache License 2.0,
// as found in the LICENSE.txt file.

using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Utility;

namespace Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Extensions
{
    /// <summary>
    /// Extension methods 
    /// </summary>
    public static class IsoDayOfWeekExtensions
    {
        /// <summary>
        /// Converts a <see cref="IsoDayOfWeek"/> into the corresponding <see cref="DayOfWeek"/>.
        /// </summary>
        /// <remarks>This is a convenience method which calls <see cref="BclConversions.ToDayOfWeek"/>.</remarks>        
        /// <param name="isoDayOfWeek">The <c>IsoDayOfWeek</c> to convert.</param>
        /// <returns>The <c>DayOfWeek</c> equivalent to <paramref name="isoDayOfWeek"/></returns>
        public static DayOfWeek ToDayOfWeek(this IsoDayOfWeek isoDayOfWeek) => BclConversions.ToDayOfWeek(isoDayOfWeek);
    }
}
