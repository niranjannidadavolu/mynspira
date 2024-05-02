// Copyright 2011 The Noda Time Authors. All rights reserved.
// Use of this source code is governed by the Apache License 2.0,
// as found in the LICENSE.txt file.

using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Text.Patterns;

namespace Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Text
{
    // This file contains all the delegates declared within the NodaTime.Text namespace.
    // It's simpler than either nesting them or giving them a file per delegate.
    internal delegate void CharacterHandler<TResult, TBucket>
            (PatternCursor patternCursor, SteppedPatternBuilder<TResult, TBucket> patternBuilder)
            where TBucket : ParseBucket<TResult>;
}
