using System;

namespace Phoenix.CrossCutting.Extension.TArray.System.Array
{
    public static partial class Extensions
    {
        /// <summary>
        ///     A T[] extension method that searches for the first index.
        /// </summary>
        /// <typeparam name="T">Generic type parameter.</typeparam>
        /// <param name="array">The array to act on.</param>
        /// <param name="match">Specifies the match.</param>
        /// <returns>The found index.</returns>
        public static int FindIndex<T>(this T[] array, Predicate<T> match)
        {
            return global::System.Array.FindIndex(array, match);
        }

        /// <summary>
        ///     A T[] extension method that searches for the first index.
        /// </summary>
        /// <typeparam name="T">Generic type parameter.</typeparam>
        /// <param name="array">The array to act on.</param>
        /// <param name="startIndex">The start index.</param>
        /// <param name="match">Specifies the match.</param>
        /// <returns>The found index.</returns>
        public static int FindIndex<T>(this T[] array, int startIndex, Predicate<T> match)
        {
            return global::System.Array.FindIndex(array, startIndex, match);
        }

        /// <summary>
        ///     A T[] extension method that searches for the first index.
        /// </summary>
        /// <typeparam name="T">Generic type parameter.</typeparam>
        /// <param name="array">The array to act on.</param>
        /// <param name="startIndex">The start index.</param>
        /// <param name="count">Number of.</param>
        /// <param name="match">Specifies the match.</param>
        /// <returns>The found index.</returns>
        public static int FindIndex<T>(this T[] array, int startIndex, int count, Predicate<T> match)
        {
            return global::System.Array.FindIndex(array, startIndex, count, match);
        }
    }
}