using System;
using System.Collections.Generic;
using System.Text;

namespace Phoenix.CrossCutting.Extension.System.String
{
    public static partial class Extensions
    {
        /// <summary>An IEnumerable&lt;string&gt; extension method that concatenates the given this.</summary>
        /// <param name="this">The @this to act on.</param>
        /// <returns>A string.</returns>
        public static string Concatenate(this IEnumerable<string> @this)
        {
            StringBuilder sb = new();

            foreach (string s in @this)
            {
                sb.Append(s);
            }

            return sb.ToString();
        }

        /// <summary>An IEnumerable&lt;T&gt; extension method that concatenates.</summary>
        /// <typeparam name="T">Generic type parameter.</typeparam>
        /// <param name="source">The source to act on.</param>
        /// <param name="func">The function.</param>
        /// <returns>A string.</returns>
        public static string Concatenate<T>(this IEnumerable<T> source, Func<T, string> func)
        {
            StringBuilder sb = new();
            foreach (T item in source)
            {
                sb.Append(func(item));
            }

            return sb.ToString();
        }
    }
}