// Copyright 2011 The Noda Time Authors. All rights reserved.
// Use of this source code is governed by the Apache License 2.0,
// as found in the LICENSE.txt file.

using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Globalization;

namespace Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Text.Patterns
{
    /// <summary>
    /// Internal interface used by FixedFormatInfoPatternParser. Unfortunately
    /// even though this is internal, implementations must either use public methods
    /// or explicit interface implementation.
    /// </summary>
    internal interface IPatternParser<T>
    {
        IPattern<T> ParsePattern(string pattern, NodaFormatInfo formatInfo);
    }
}
