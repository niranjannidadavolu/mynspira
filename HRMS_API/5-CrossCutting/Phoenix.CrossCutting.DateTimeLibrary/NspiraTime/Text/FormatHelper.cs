// Copyright 2011 The Noda Time Authors. All rights reserved.
// Use of this source code is governed by the Apache License 2.0,
// as found in the LICENSE.txt file.

using System.Text;
using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Annotations;
using Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Utility;

namespace Phoenix.CrossCutting.DateTimeLibrary.NspiraTime.Text
{
    /// <summary>
    ///   Provides helper methods for formatting values using pattern strings.
    /// </summary>
    internal static class FormatHelper
    {
        /// <summary>
        /// The maximum number of characters allowed for padded values.
        /// </summary>
        private const int MaximumPaddingLength = 16;

        /// <summary>
        /// Maximum number of digits in a (positive) long.
        /// </summary>
        private const int MaximumInt64Length = 19;

        /// <summary>
        /// Formats the given value to two digits, left-padding with '0' if necessary.
        /// It is assumed that the value is in the range [0, 100). This is usually
        /// used for month, day-of-month, hour, minute, second and year-of-century values.
        /// </summary>
        internal static void Format2DigitsNonNegative([Trusted] int value, StringBuilder outputBuffer)
        {
            Preconditions.DebugCheckArgumentRange(nameof(value), value, 0, 99);
            unchecked
            {
                outputBuffer.Append((char) ('0' + value / 10));
                outputBuffer.Append((char) ('0' + value % 10));
            }
        }

        /// <summary>
        /// Formats the given value to two digits, left-padding with '0' if necessary.
        /// It is assumed that the value is in the range [-9999, 10000). This is usually
        /// used for year values. If the value is negative, a '-' character is prepended.
        /// </summary>
        internal static void Format4DigitsValueFits([Trusted] int value, StringBuilder outputBuffer)
        {
            Preconditions.DebugCheckArgumentRange(nameof(value), value, -9999, 10000);
            unchecked
            {
                if (value < 0)
                {
                    value = -value;
                    outputBuffer.Append('-');
                }
                outputBuffer.Append((char) ('0' + (value / 1000)));
                outputBuffer.Append((char) ('0' + ((value / 100) % 10)));
                outputBuffer.Append((char) ('0' + ((value / 10) % 10)));
                outputBuffer.Append((char) ('0' + (value % 10)));
            }
        }

        /// <summary>
        /// Formats the given value left padded with zeros.
        /// </summary>
        /// <remarks>
        /// Left pads with zeros the value into a field of <paramref name = "length" /> characters. If the value
        /// is longer than <paramref name = "length" />, the entire value is formatted. If the value is negative,
        /// it is preceded by "-" but this does not count against the length.
        /// </remarks>
        /// <param name="value">The value to format.</param>
        /// <param name="length">The length to fill.</param>
        /// <param name="outputBuffer">The output buffer to add the digits to.</param>
        internal static void LeftPad(int value, [Trusted] int length, StringBuilder outputBuffer)
        {
            Preconditions.DebugCheckArgumentRange(nameof(length), length, 1, MaximumPaddingLength);
            unchecked
            {
                if (value >= 0)
                {
                    LeftPadNonNegative(value, length, outputBuffer);
                    return;
                }
                outputBuffer.Append('-');
                // Special case, as we can't use Math.Abs.
                if (value == int.MinValue)
                {
                    if (length > 10)
                    {
                        outputBuffer.Append("000000".Substring(16 - length));
                    }
                    outputBuffer.Append("2147483648");
                    return;
                }
                LeftPadNonNegative(-value, length, outputBuffer);
            }
        }

        /// <summary>
        /// Formats the given value left padded with zeros. The value is assumed to be non-negative.
        /// </summary>
        /// <remarks>
        /// Left pads with zeros the value into a field of <paramref name = "length" /> characters. If the value
        /// is longer than <paramref name = "length" />, the entire value is formatted. If the value is negative,
        /// it is preceded by "-" but this does not count against the length.
        /// </remarks>
        /// <param name="value">The value to format.</param>
        /// <param name="length">The length to fill.</param>
        /// <param name="outputBuffer">The output buffer to add the digits to.</param>
        internal static void LeftPadNonNegative(int value, [Trusted] int length, StringBuilder outputBuffer)
        {
            Preconditions.DebugCheckArgumentRange(nameof(value), value, 0, int.MaxValue);
            Preconditions.DebugCheckArgumentRange(nameof(length), length, 1, MaximumPaddingLength);
            unchecked
            {
                // Special handling for common cases, because we really don't want a heap allocation
                // if we can help it...
                if (length == 1)
                {
                    if (value < 10)
                    {
                        outputBuffer.Append((char) ('0' + value));
                        return;
                    }
                    // Handle overflow by a single character manually
                    if (value < 100)
                    {
                        char digit1 = (char) ('0' + (value / 10));
                        char digit2 = (char) ('0' + (value % 10));
                        outputBuffer.Append(digit1).Append(digit2);
                        return;
                    }
                }
                if (length == 2 && value < 100)
                {
                    char digit1 = (char) ('0' + (value / 10));
                    char digit2 = (char) ('0' + (value % 10));
                    outputBuffer.Append(digit1).Append(digit2);
                    return;
                }
                if (length == 3 && value < 1000)
                {
                    char digit1 = (char) ('0' + ((value / 100) % 10));
                    char digit2 = (char) ('0' + ((value / 10) % 10));
                    char digit3 = (char) ('0' + (value % 10));
                    outputBuffer.Append(digit1).Append(digit2).Append(digit3);
                    return;
                }
                if (length == 4 && value < 10000)
                {
                    char digit1 = (char) ('0' + (value / 1000));
                    char digit2 = (char) ('0' + ((value / 100) % 10));
                    char digit3 = (char) ('0' + ((value / 10) % 10));
                    char digit4 = (char) ('0' + (value % 10));
                    outputBuffer.Append(digit1).Append(digit2).Append(digit3).Append(digit4);
                    return;
                }
                if (length == 5 && value < 100000)
                {
                    char digit1 = (char) ('0' + (value / 10000));
                    char digit2 = (char) ('0' + ((value / 1000) % 10));
                    char digit3 = (char) ('0' + ((value / 100) % 10));
                    char digit4 = (char) ('0' + ((value / 10) % 10));
                    char digit5 = (char) ('0' + (value % 10));
                    outputBuffer.Append(digit1).Append(digit2).Append(digit3).Append(digit4).Append(digit5);
                    return;
                }

                // Unfortunate, but never mind - let's go the whole hog...
                var digits = new char[MaximumPaddingLength];
                int pos = MaximumPaddingLength;
                do
                {
                    digits[--pos] = (char) ('0' + (value % 10));
                    value /= 10;
                } while (value != 0 && pos > 0);
                while ((MaximumPaddingLength - pos) < length)
                {
                    digits[--pos] = '0';
                }
                outputBuffer.Append(digits, pos, MaximumPaddingLength - pos);
            }
        }

        /// <summary>
        /// Formats the given Int64 value left padded with zeros. The value is assumed to be non-negative.
        /// </summary>
        /// <remarks>
        /// Left pads with zeros the value into a field of <paramref name = "length" /> characters. If the value
        /// is longer than <paramref name = "length" />, the entire value is formatted. If the value is negative,
        /// it is preceded by "-" but this does not count against the length.
        /// </remarks>
        /// <param name="value">The value to format.</param>
        /// <param name="length">The length to fill.</param>
        /// <param name="outputBuffer">The output buffer to add the digits to.</param>
        internal static void LeftPadNonNegativeInt64(long value, [Trusted] int length, StringBuilder outputBuffer)
        {
            Preconditions.DebugCheckArgumentRange(nameof(value), value, 0, long.MaxValue);
            Preconditions.DebugCheckArgumentRange(nameof(length), length, 1, MaximumPaddingLength);
            unchecked
            {
                // Special handling for common cases, because we really don't want a heap allocation
                // if we can help it...
                if (length == 1)
                {
                    if (value < 10)
                    {
                        outputBuffer.Append((char) ('0' + value));
                        return;
                    }
                    // Handle overflow by a single character manually
                    if (value < 100)
                    {
                        char digit1 = (char) ('0' + (value / 10));
                        char digit2 = (char) ('0' + (value % 10));
                        outputBuffer.Append(digit1).Append(digit2);
                        return;
                    }
                }
                if (length == 2 && value < 100)
                {
                    char digit1 = (char) ('0' + (value / 10));
                    char digit2 = (char) ('0' + (value % 10));
                    outputBuffer.Append(digit1).Append(digit2);
                    return;
                }
                if (length == 3 && value < 1000)
                {
                    char digit1 = (char) ('0' + ((value / 100) % 10));
                    char digit2 = (char) ('0' + ((value / 10) % 10));
                    char digit3 = (char) ('0' + (value % 10));
                    outputBuffer.Append(digit1).Append(digit2).Append(digit3);
                    return;
                }
                if (length == 4 && value < 10000)
                {
                    char digit1 = (char) ('0' + (value / 1000));
                    char digit2 = (char) ('0' + ((value / 100) % 10));
                    char digit3 = (char) ('0' + ((value / 10) % 10));
                    char digit4 = (char) ('0' + (value % 10));
                    outputBuffer.Append(digit1).Append(digit2).Append(digit3).Append(digit4);
                    return;
                }
                if (length == 5 && value < 100000)
                {
                    char digit1 = (char) ('0' + (value / 10000));
                    char digit2 = (char) ('0' + ((value / 1000) % 10));
                    char digit3 = (char) ('0' + ((value / 100) % 10));
                    char digit4 = (char) ('0' + ((value / 10) % 10));
                    char digit5 = (char) ('0' + (value % 10));
                    outputBuffer.Append(digit1).Append(digit2).Append(digit3).Append(digit4).Append(digit5);
                    return;
                }

                // Unfortunate, but never mind - let's go the whole hog...
                var digits = new char[MaximumPaddingLength];
                int pos = MaximumPaddingLength;
                do
                {
                    digits[--pos] = (char) ('0' + (value % 10));
                    value /= 10;
                } while (value != 0 && pos > 0);
                while ((MaximumPaddingLength - pos) < length)
                {
                    digits[--pos] = '0';
                }
                outputBuffer.Append(digits, pos, MaximumPaddingLength - pos);
            }
        }

        /// <summary>
        /// Formats the given value, which is an integer representation of a fraction.
        /// Note: current usage means this never has to cope with negative numbers.
        /// </summary>
        /// <example>
        /// <c>AppendFraction(1200, 4, 5, builder)</c> will result in "0120" being
        /// appended to the builder. The value is treated as effectively 0.01200 because
        /// the scale is 5, but only 4 digits are formatted.
        /// </example>
        /// <param name="value">The value to format.</param>
        /// <param name="length">The length to fill. Must be at most <paramref name="scale"/>.</param>
        /// <param name="scale">The scale of the value i.e. the number of significant digits is the range of the value. Must be in the range [1, 7].</param>
        /// <param name="outputBuffer">The output buffer to add the digits to.</param>
        internal static void AppendFraction(int value, int length, int scale, StringBuilder outputBuffer)
        {
            int relevantDigits = value;
            while (scale > length)
            {
                relevantDigits /= 10;
                scale--;
            }

            outputBuffer.Append('0', length);
            int index = outputBuffer.Length - 1;
            while (relevantDigits > 0)
            {
                outputBuffer[index--] = (char) ('0' + (relevantDigits % 10));
                relevantDigits /= 10;
            }
        }

        /// <summary>
        /// Formats the given value, which is an integer representation of a fraction,
        /// truncating any right-most zero digits.
        /// If the entire value is truncated then the preceding decimal separator is also removed.
        /// Note: current usage means this never has to cope with negative numbers.
        /// </summary>
        /// <example>
        /// <c>AppendFractionTruncate(1200, 4, 5, builder)</c> will result in "001" being
        /// appended to the builder. The value is treated as effectively 0.01200 because
        /// the scale is 5; only 4 digits are formatted (leaving "0120") and then the rightmost
        /// 0 digit is truncated.
        /// </example>
        /// <param name="value">The value to format.</param>
        /// <param name="length">The length to fill. Must be at most <paramref name="scale"/>.</param>
        /// <param name="scale">The scale of the value i.e. the number of significant digits is the range of the value. Must be in the range [1, 7].</param>
        /// <param name="outputBuffer">The output buffer to add the digits to.</param>
        internal static void AppendFractionTruncate(int value, int length, int scale, StringBuilder outputBuffer)
        {
            int relevantDigits = value;
            while (scale > length)
            {
                relevantDigits /= 10;
                scale--;
            }
            int relevantLength = length;
            while (relevantLength > 0)
            {
                if ((relevantDigits % 10L) != 0L)
                {
                    break;
                }
                relevantDigits /= 10;
                relevantLength--;
            }
            if (relevantLength > 0)
            {
                outputBuffer.Append('0', relevantLength);
                int index = outputBuffer.Length - 1;
                while (relevantDigits > 0)
                {
                    outputBuffer[index--] = (char) ('0' + (relevantDigits % 10));
                    relevantDigits /= 10;
                }
            }
            else if (outputBuffer.Length > 0 && outputBuffer[outputBuffer.Length - 1] == '.')
            {
                outputBuffer.Length--;
            }
        }

        /// <summary>
        /// Formats the given value using the invariant culture, with no truncation or padding.
        /// </summary>
        /// <param name="value">The value to format.</param>
        /// <param name="outputBuffer">The output buffer to add the digits to.</param>
        internal static void FormatInvariant(long value, StringBuilder outputBuffer)
        {
            unchecked
            {
                if (value <= 0)
                {
                    if (value == 0)
                    {
                        outputBuffer.Append('0');
                        return;
                    }
                    if (value == long.MinValue)
                    {
                        outputBuffer.Append("-9223372036854775808");
                        return;
                    }
                    outputBuffer.Append('-');
                    FormatInvariant(-value, outputBuffer);
                    return;
                }
                // Optimize common small cases (particularly for periods)
                if (value < 10)
                {
                    outputBuffer.Append((char) ('0' + value));
                    return;
                }
                if (value < 100)
                {
                    char digit1 = (char) ('0' + (value / 10));
                    char digit2 = (char) ('0' + (value % 10));
                    outputBuffer.Append(digit1).Append(digit2);
                    return;
                }
                if (value < 1000)
                {
                    char digit1 = (char) ('0' + ((value / 100) % 10));
                    char digit2 = (char) ('0' + ((value / 10) % 10));
                    char digit3 = (char) ('0' + (value % 10));
                    outputBuffer.Append(digit1).Append(digit2).Append(digit3);
                    return;
                }

                var digits = new char[MaximumInt64Length];
                int pos = MaximumInt64Length;
                do
                {
                    digits[--pos] = (char) ('0' + (value % 10));
                    value /= 10;
                } while (value != 0);
                outputBuffer.Append(digits, pos, MaximumInt64Length - pos);
            }
        }
    }
}