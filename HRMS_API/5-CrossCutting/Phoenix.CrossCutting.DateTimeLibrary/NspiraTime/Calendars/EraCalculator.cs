﻿// Copyright 2014 The Noda Time Authors. All rights reserved.
// Use of this source code is governed by the Apache License 2.0,
// as found in the LICENSE.txt file.

using System.Collections.ObjectModel;

namespace Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Calendars
{
    /// <summary>
    /// Takes responsibility for all era-based calculations for a calendar.
    /// YearMonthDay arguments can be assumed to be valid for the relevant calendar,
    /// but other arguments should be validated. (Eras should be validated for nullity as well
    /// as for the presence of a particular era.)
    /// </summary>
    internal abstract class EraCalculator
    {
        internal ReadOnlyCollection<Era> Eras { get; }

        protected EraCalculator(params Era[] eras)
        {
            this.Eras = new ReadOnlyCollection<Era>(eras);
        }

        internal abstract int GetMinYearOfEra(Era era);
        internal abstract int GetMaxYearOfEra(Era era);
        internal abstract Era GetEra(int absoluteYear);
        internal abstract int GetYearOfEra(int absoluteYear);
        internal abstract int GetAbsoluteYear(int yearOfEra, Era era);
    }
}
