// Copyright 2012 The Noda Time Authors. All rights reserved.
// Use of this source code is governed by the Apache License 2.0,
// as found in the LICENSE.txt file.

using System.Runtime.CompilerServices;

namespace Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Utility
{
    /// <summary>
    /// An equality comparer which compares references for equality and uses the "original" object hash code
    /// for hash codes.
    /// </summary>
    internal sealed class ReferenceEqualityComparer<T> : IEqualityComparer<T> where T : class
    {
        public bool Equals(T? first, T? second) => ReferenceEquals(first, second);

        public int GetHashCode(T value) => value is null ? 0 : RuntimeHelpers.GetHashCode(value);
    }
}
