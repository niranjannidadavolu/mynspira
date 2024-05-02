namespace Phoenix.CrossCutting.Extension.System.String.System.String
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Compares two specified  objects by evaluating the numeric values of the corresponding  objects in each string.
        /// </summary>
        /// <param name="strA">The first string to compare.</param>
        /// <param name="strB">The second string to compare.</param>
        /// <returns>
        ///     An integer that indicates the lexical relationship between the two comparands.ValueCondition Less than zero
        ///     is less than . Zero  and  are equal. Greater than zero  is greater than .
        /// </returns>
        public static int CompareOrdinal(this string strA, string strB)
        {
            return string.CompareOrdinal(strA, strB);
        }

        /// <summary>
        ///     Compares substrings of two specified  objects by evaluating the numeric values of the corresponding  objects
        ///     in each substring.
        /// </summary>
        /// <param name="strA">The first string to use in the comparison.</param>
        /// <param name="indexA">The starting index of the substring in .</param>
        /// <param name="strB">The second string to use in the comparison.</param>
        /// <param name="indexB">The starting index of the substring in .</param>
        /// <param name="length">The maximum number of characters in the substrings to compare.</param>
        /// <returns>
        ///     A 32-bit signed integer that indicates the lexical relationship between the two comparands.ValueCondition
        ///     Less than zero The substring in  is less than the substring in . Zero The substrings are equal, or  is zero.
        ///     Greater than zero The substring in  is greater than the substring in .
        /// </returns>
        public static int CompareOrdinal(this string strA, int indexA, string strB, int indexB, int length)
        {
            return string.CompareOrdinal(strA, indexA, strB, indexB, length);
        }
    }
}