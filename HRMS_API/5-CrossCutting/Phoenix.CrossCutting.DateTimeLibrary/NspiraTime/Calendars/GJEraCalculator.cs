﻿// Copyright 2013 The Noda Time Authors. All rights reserved.
// Use of this source code is governed by the Apache License 2.0,
// as found in the LICENSE.txt file.

using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Utility;

namespace Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Calendars
{
    /// <summary>
    /// Era calculator for Gregorian and Julian calendar systems, which use BC and AD.
    /// </summary>
    internal sealed class GJEraCalculator : EraCalculator
    {
        private readonly int maxYearOfBc;
        private readonly int maxYearOfAd;

        internal GJEraCalculator(YearMonthDayCalculator ymdCalculator) : base(Era.BeforeCommon, Era.Common)
        {
            maxYearOfBc = 1 - ymdCalculator.MinYear; // Convert from absolute to year-of-era
            maxYearOfAd = ymdCalculator.MaxYear;
        }

        private static void ValidateEra(Era era)
        {
            if (era != Era.Common && era != Era.BeforeCommon)
            {
                Preconditions.CheckNotNull(era, nameof(era));
                Preconditions.CheckArgument(false, nameof(era), "Era {0} is not supported by this calendar; only BC and AD are supported", era.Name);
            }
        }

        internal override int GetAbsoluteYear(int yearOfEra, Era era)
        {
            ValidateEra(era);
            if (era == Era.Common)
            {
                Preconditions.CheckArgumentRange(nameof(yearOfEra), yearOfEra, 1, maxYearOfAd);
                return yearOfEra;
            }
            Preconditions.CheckArgumentRange(nameof(yearOfEra), yearOfEra, 1, maxYearOfBc);
            return 1 - yearOfEra;
        }

        internal override int GetYearOfEra(int absoluteYear)
        {
            return absoluteYear > 0 ? absoluteYear : 1 - absoluteYear;
        }

        internal override Era GetEra(int absoluteYear) => absoluteYear > 0 ? Era.Common : Era.BeforeCommon;

        internal override int GetMinYearOfEra(Era era)
        {
            ValidateEra(era);
            return 1;
        }

        internal override int GetMaxYearOfEra(Era era)
        {
            ValidateEra(era);
            return era == Era.Common ? maxYearOfAd : maxYearOfBc;
        }
    }
}
