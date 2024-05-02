// Copyright 2009 The Noda Time Authors. All rights reserved.
// Use of this source code is governed by the Apache License 2.0,
// as found in the LICENSE.txt file.

using System.Text;
using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Utility;

namespace Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.TimeZones.IO
{
    /// <summary>
    /// Implementation of <see cref="IDateTimeZoneReader"/> for the most recent version
    /// of the "blob" format of time zone data. If the format changes, this class will be
    /// renamed (e.g. to DateTimeZoneReaderV0) and the new implementation will replace it.
    /// </summary>
    internal sealed class DateTimeZoneReader : IDateTimeZoneReader
    {
        /// <summary>
        /// Raw stream to read from. Be careful before reading from this - you need to take
        /// account of bufferedByte as well.
        /// </summary>
        private readonly Stream input;

        /// <summary>
        /// String pool to use, or null if no string pool is in use.
        /// </summary>
        private readonly IReadOnlyList<string>? stringPool;

        /// <summary>
        /// Sometimes we need to buffer a byte in memory, e.g. to check if there is any
        /// more data. Anything reading directly from the stream should check here first.
        /// </summary>
        private byte? bufferedByte;

        internal DateTimeZoneReader(Stream input, IReadOnlyList<string>? stringPool)
        {
            this.input = input;
            this.stringPool = stringPool;
        }

        public bool HasMoreData
        {
            get
            {
                if (bufferedByte != null)
                {
                    return true;
                }
                int nextByte = input.ReadByte();
                if (nextByte == -1)
                {
                    return false;
                }
                // Okay, we got a byte - remember it for the next call to ReadByte.
                bufferedByte = (byte) nextByte;
                return true;
            }
        }

        /// <summary>
        /// Reads a non-negative integer value from the stream.
        /// </summary>
        /// <remarks>
        /// The value must have been written by <see cref="DateTimeZoneWriter.WriteCount" />.
        /// </remarks>
        /// <returns>The integer value from the stream.</returns>
        public int ReadCount()
        {
            uint unsigned = ReadVarint();
            if (unsigned > int.MaxValue)
            {
                throw new InvalidNodaDataException("Count value greater than Int32.MaxValue");
            }
            return (int) unsigned;
        }

        /// <summary>
        /// Reads a (possibly-negative) integer value from the stream.
        /// </summary>
        /// <remarks>
        /// The value must have been written by <see cref="DateTimeZoneWriter.WriteSignedCount" />.
        /// </remarks>
        /// <returns>The integer value from the stream.</returns>
        public int ReadSignedCount()
        {
            uint value = ReadVarint();
            return (int) (value >> 1) ^ -(int) (value & 1);  // zigzag encoding
        }

        /// <summary>
        /// Reads a base-128 varint value from the stream.
        /// </summary>
        /// <remarks>
        /// The value must have been written by DateTimeZoneWriter.WriteVarint, which
        /// documents the format.
        /// </remarks>
        /// <returns>The integer value from the stream.</returns>
        private uint ReadVarint()
        {
            unchecked
            {
                uint ret = 0;
                int shift = 0;
                while (true)
                {
                    byte nextByte = ReadByte();
                    ret += (uint) (nextByte & 0x7f) << shift;
                    shift += 7;
                    if (nextByte < 0x80)
                    {
                        return ret;
                    }
                }
            }
        }

        /// <summary>
        /// Reads a number of milliseconds from the stream.
        /// </summary>
        /// <remarks>
        /// The value must have been written by <see cref="DateTimeZoneWriter.WriteMilliseconds" />.
        /// </remarks>
        /// <returns>The offset value from the stream.</returns>
        public int ReadMilliseconds()
        {
            unchecked
            {
                byte firstByte = ReadByte();

                int millis;

                if ((firstByte & 0x80) == 0)
                {
                    millis = firstByte * (30 * NodaConstants.MillisecondsPerMinute);
                }
                else
                {
                    int flag = firstByte & 0xe0;      // The flag parts of the first byte
                    int firstData = firstByte & 0x1f; // The data parts of the first byte
                    switch (flag)
                    {
                        case 0x80: // Minutes
                            int minutes = (firstData << 8) + ReadByte();
                            millis = minutes * NodaConstants.MillisecondsPerMinute;
                            break;
                        case 0xa0: // Seconds
                            int seconds = (firstData << 16) + (ReadInt16() & 0xffff);
                            millis = seconds * NodaConstants.MillisecondsPerSecond;
                            break;
                        case 0xc0: // Milliseconds
                            millis = (firstData << 24) + (ReadByte() << 16) + (ReadInt16() & 0xffff);
                            break;
                        default:
                            throw new InvalidNodaDataException($"Invalid flag in offset: {flag:x2}");
                    }
                }
                millis -= NodaConstants.MillisecondsPerDay;
                return millis;
            }
        }

        /// <summary>
        /// Reads an offset value from the stream.
        /// </summary>
        /// <remarks>
        /// The value must have been written by <see cref="DateTimeZoneWriter.WriteOffset" />.
        /// </remarks>
        /// <returns>The offset value from the stream.</returns>
        public Offset ReadOffset()
        {
            int millis = ReadMilliseconds();
            return Offset.FromMilliseconds(millis);
        }

        /// <summary>
        /// Reads a string to string dictionary value from the stream.
        /// </summary>
        /// <remarks>
        /// The value must have been written by <see cref="DateTimeZoneWriter.WriteDictionary" />.
        /// </remarks>
        /// <returns>The <see cref="IDictionary{TKey,TValue}" /> value from the stream.</returns>
        public IDictionary<string, string> ReadDictionary()
        {
            IDictionary<string, string> results = new Dictionary<string, string>();
            int count = ReadCount();
            for (int i = 0; i < count; i++)
            {
                string key = ReadString();
                string value = ReadString();
                results.Add(key, value);
            }
            return results;
        }

        /// <summary>
        /// Reads an instant representing a zone interval transition from the stream.
        /// </summary>
        /// <remarks>
        /// The value must have been written by <see cref="DateTimeZoneWriter.WriteZoneIntervalTransition" />.
        /// </remarks>
        /// <param name="previous">The previous transition written (usually for a given timezone), or null if there is
        /// no previous transition.</param>
        /// <returns>The instant read from the stream</returns>
        public Instant ReadZoneIntervalTransition(Instant? previous)
        {
            unchecked
            {
                int value = ReadCount();
                if (value < DateTimeZoneWriter.ZoneIntervalConstants.MinValueForHoursSincePrevious)
                {
                    return value switch
                    {
                        DateTimeZoneWriter.ZoneIntervalConstants.MarkerMinValue => Instant.BeforeMinValue,
                        DateTimeZoneWriter.ZoneIntervalConstants.MarkerMaxValue => Instant.AfterMaxValue,
                        DateTimeZoneWriter.ZoneIntervalConstants.MarkerRaw => Instant.FromUnixTimeTicks(ReadInt64()),
                        _ => throw new InvalidNodaDataException($"Unrecognised marker value: {value}")
                    };
                }
                if (value < DateTimeZoneWriter.ZoneIntervalConstants.MinValueForMinutesSinceEpoch)
                {
                    if (previous is null)
                    {
                        throw new InvalidNodaDataException(
                            $"No previous value, so can't interpret value encoded as delta-since-previous: {value}");
                    }
                    return (Instant) previous + Duration.FromHours(value);
                }
                return DateTimeZoneWriter.ZoneIntervalConstants.EpochForMinutesSinceEpoch + Duration.FromMinutes(value);
            }
        }

        /// <summary>
        /// Reads a string value from the stream.
        /// </summary>
        /// <remarks>
        /// The value must have been written by <see cref="DateTimeZoneWriter.WriteString" />.
        /// </remarks>
        /// <returns>The string value from the stream.</returns>
        public string ReadString()
        {
            if (stringPool is null)
            {
                // This will flush the buffered byte if there is one, so we don't need to worry about that
                // when reading the actual data.
                int length = ReadCount();
                var data = new byte[length];
                int offset = 0;
                while (offset < length)
                {
                    int bytesRead = input.Read(data, offset, length - offset);
                    if (bytesRead <= 0)
                    {
                        throw new InvalidNodaDataException($"Unexpectedly reached end of data with {length - offset} bytes still to read");
                    }
                    offset += bytesRead;
                }
                return Encoding.UTF8.GetString(data, 0, length);
            }
            else
            {
                int index = ReadCount();
                return stringPool[index];
            }
        }

        /// <summary>
        /// Reads a signed 16 bit integer value from the stream and returns it as an int.
        /// </summary>
        /// <returns>The 16 bit int value.</returns>
        private int ReadInt16()
        {
            unchecked
            {
                int high = ReadByte();
                int low = ReadByte();
                return (high << 8) | low;
            }
        }

        /// <summary>
        /// Reads a signed 32 bit integer value from the stream and returns it as an int.
        /// </summary>
        /// <returns>The 32 bit int value.</returns>
        private int ReadInt32()
        {
            unchecked
            {
                int high = ReadInt16() & 0xffff;
                int low = ReadInt16() & 0xffff;
                return (high << 16) | low;
            }
        }

        /// <summary>
        /// Reads a signed 64 bit integer value from the stream and returns it as an long.
        /// </summary>
        /// <returns>The 64 bit long value.</returns>
        private long ReadInt64()
        {
            unchecked
            {
                long high = ReadInt32() & 0xffffffffL;
                long low = ReadInt32() & 0xffffffffL;
                return (high << 32) | low;
            }
        }

        /// <summary>
        /// Reads a signed 8 bit integer value from the stream and returns it as an int.
        /// </summary>
        /// <returns>The 8 bit int value.</returns>
        /// <exception cref="InvalidNodaDataException">The data in the stream has been exhausted.</exception>
        /// <inheritdoc />
        public byte ReadByte()
        {
            if (bufferedByte != null)
            {
                byte ret = bufferedByte.Value;
                bufferedByte = null;
                return ret;
            }
            int value = input.ReadByte();
            if (value == -1)
            {
                throw new InvalidNodaDataException("Unexpected end of data stream");
            }
            return (byte) value;
        }
    }
}
