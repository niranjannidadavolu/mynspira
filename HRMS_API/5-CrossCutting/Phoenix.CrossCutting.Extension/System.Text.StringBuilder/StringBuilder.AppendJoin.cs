using System.Collections.Generic;

namespace Phoenix.CrossCutting.Extension.System.Text.StringBuilder
{
    public static partial class Extensions
    {
        /// <summary>A StringBuilder extension method that appends a join.</summary>
        /// <typeparam name="T">Generic type parameter.</typeparam>
        /// <param name="this">The @this to act on.</param>
        /// <param name="separator">The separator.</param>
        /// <param name="values">The values.</param>
        public static global::System.Text.StringBuilder AppendJoin<T>(this global::System.Text.StringBuilder @this, string separator, IEnumerable<T> values)
        {
            @this.Append(string.Join(separator, values));

            return @this;
        }

        /// <summary>A StringBuilder extension method that appends a join.</summary>
        /// <param name="this">The @this to act on.</param>
        /// <param name="separator">The separator.</param>
        /// <param name="values">The values.</param>
        public static global::System.Text.StringBuilder AppendJoin<T>(this global::System.Text.StringBuilder @this, string separator, params T[] values)
        {
            @this.Append(string.Join(separator, values));

            return @this;
        }
    }
}