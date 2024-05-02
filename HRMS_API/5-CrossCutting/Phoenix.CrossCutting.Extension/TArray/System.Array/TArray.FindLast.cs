using System;

namespace Phoenix.CrossCutting.Extension.TArray.System.Array
{
    public static partial class Extensions
    {
        /// <summary>
        ///     A T[] extension method that searches for the first last.
        /// </summary>
        /// <typeparam name="T">Generic type parameter.</typeparam>
        /// <param name="array">The array to act on.</param>
        /// <param name="match">Specifies the match.</param>
        /// <returns>The found last.</returns>
        public static T FindLast<T>(this T[] array, Predicate<T> match)
        {
            return global::System.Array.FindLast(array, match);
        }
    }
}