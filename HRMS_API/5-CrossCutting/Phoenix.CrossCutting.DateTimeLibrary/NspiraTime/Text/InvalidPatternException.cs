// Copyright 2011 The Noda Time Authors. All rights reserved.
// Use of this source code is governed by the Apache License 2.0,
// as found in the LICENSE.txt file.

using System.Globalization;
using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Annotations;

// Standard exception constructors.
// This exception is expected to be constructed within the library, and there are never any
// inner exceptions.
#pragma warning disable CA1032

namespace Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Text
{
    /// <summary>
    /// Exception thrown to indicate that the format pattern provided for either formatting or parsing is invalid.
    /// </summary>
    /// <threadsafety>Any public static members of this type are thread safe. Any instance members are not guaranteed to be thread safe.
    /// See the thread safety section of the user guide for more information.
    /// </threadsafety>
    [Mutable] // Exception is mutable
    public sealed class InvalidPatternException : FormatException
    {
        /// <summary>
        /// Creates a new InvalidPatternException with the default FormatException message.
        /// </summary>
        public InvalidPatternException()
        {
        }

        /// <summary>
        /// Creates a new InvalidPatternException with the given message.
        /// </summary>
        /// <param name="message">A message describing the nature of the failure</param>
        public InvalidPatternException(string message)
            : base(message)
        {
        }

        /// <summary>
        /// Creates a new InvalidPatternException by formatting the given format string with
        /// the specified parameters, in the current culture.
        /// </summary>
        /// <param name="formatString">Format string to use in order to create the final message</param>
        /// <param name="parameters">Format string parameters</param>
        internal InvalidPatternException(string formatString, params object[] parameters)
            : this(string.Format(CultureInfo.CurrentCulture, formatString, parameters))
        {
        }
    }
}
