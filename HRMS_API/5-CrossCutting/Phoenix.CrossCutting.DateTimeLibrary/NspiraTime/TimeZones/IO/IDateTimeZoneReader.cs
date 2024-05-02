// Copyright 2013 The Noda Time Authors. All rights reserved.
// Use of this source code is governed by the Apache License 2.0,
// as found in the LICENSE.txt file.

using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Utility;

namespace Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.TimeZones.IO
{
    /// <summary>
    /// Interface for reading time-related data from a binary stream.
    /// This is similar to <see cref="BinaryReader" />, but heavily
    /// oriented towards our use cases. 
    /// </summary>
    internal interface IDateTimeZoneReader
    {
        /// <summary>
        /// Returns whether or not there is more data in this stream.
        /// </summary>
        /// <value>Whether or not there is more data in the stream.</value>
        bool HasMoreData { get; }

        /// <summary>
        /// Reads a non-negative integer from the stream, which must have been written
        /// by a call to <see cref="IDateTimeZoneWriter.WriteCount"/>.
        /// </summary>
        /// <returns>The integer read from the stream</returns>
        /// <exception cref="InvalidNodaDataException">The data was invalid.</exception>
        /// <exception cref="IOException">The stream could not be read.</exception>
        int ReadCount();

        /// <summary>
        /// Reads a non-negative integer from the stream, which must have been written
        /// by a call to <see cref="IDateTimeZoneWriter.WriteSignedCount"/>.
        /// </summary>
        /// <returns>The integer read from the stream</returns>
        /// <exception cref="InvalidNodaDataException">The data was invalid.</exception>
        /// <exception cref="IOException">The stream could not be read.</exception>
        int ReadSignedCount();

        /// <summary>
        /// Reads a string from the stream.
        /// </summary>
        /// <returns>The string read from the stream; will not be null</returns>
        /// <exception cref="InvalidNodaDataException">The data was invalid.</exception>
        /// <exception cref="IOException">The stream could not be read.</exception>
        string ReadString();

        /// <summary>
        /// Reads a signed 8 bit integer value from the stream and returns it as an int.
        /// </summary>
        /// <returns>The 8 bit int value.</returns>
        /// <exception cref="InvalidNodaDataException">The data in the stream has been exhausted.</exception>
        byte ReadByte();

        /// <summary>
        /// Reads a number of milliseconds from the stream.
        /// </summary>
        /// <returns>The number of milliseconds read from the stream</returns>
        /// <exception cref="InvalidNodaDataException">The data was invalid.</exception>
        /// <exception cref="IOException">The stream could not be read.</exception>
        int ReadMilliseconds();

        /// <summary>
        /// Reads an offset from the stream.
        /// </summary>
        /// <returns>The offset read from the stream</returns>
        /// <exception cref="InvalidNodaDataException">The data was invalid.</exception>
        /// <exception cref="IOException">The stream could not be read.</exception>
        Offset ReadOffset();

        /// <summary>
        /// Reads an instant representing a zone interval transition from the stream.
        /// </summary>
        /// <param name="previous">The previous transition written (usually for a given timezone), or null if there is
        /// no previous transition.</param>
        /// <returns>The instant read from the stream</returns>
        /// <exception cref="InvalidNodaDataException">The data was invalid.</exception>
        /// <exception cref="IOException">The stream could not be read.</exception>
        Instant ReadZoneIntervalTransition(Instant? previous);

        /// <summary>
        /// Reads a string-to-string dictionary from the stream.
        /// </summary>
        /// <returns>The dictionary read from the stream</returns>
        /// <exception cref="InvalidNodaDataException">The data was invalid.</exception>
        /// <exception cref="IOException">The stream could not be read.</exception>
        IDictionary<string, string> ReadDictionary();
    }
}
