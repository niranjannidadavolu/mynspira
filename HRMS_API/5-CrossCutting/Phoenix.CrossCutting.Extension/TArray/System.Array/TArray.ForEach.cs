using System;

namespace Phoenix.CrossCutting.Extension.TArray.System.Array
{
    public static partial class Extensions
    {
        /// <summary>
        ///     A T[] extension method that applies an operation to all items in this collection.
        /// </summary>
        /// <typeparam name="T">Generic type parameter.</typeparam>
        /// <param name="array">The array to act on.</param>
        /// <param name="action">The action.</param>
        public static void ForEach<T>(this T[] array, Action<T> action)
        {
            global::System.Array.ForEach(array, action);
        }
    }
}