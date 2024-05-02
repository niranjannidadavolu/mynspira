using System;

namespace Phoenix.CrossCutting.Extension.System.Text.StringBuilder
{
    public static partial class Extensions
    {
        /// <summary>A StringBuilder extension method that appends a line when.</summary>
        /// <typeparam name="T">Generic type parameter.</typeparam>
        /// <param name="this">The @this to act on.</param>
        /// <param name="predicate">The predicate.</param>
        /// <param name="values">A variable-length parameters list containing values.</param>
        /// <returns>A StringBuilder.</returns>
        public static global::System.Text.StringBuilder AppendLineIf<T>(this global::System.Text.StringBuilder @this, Func<T, bool> predicate, params T[] values)
        {
            foreach (T value in values)
            {
                if (predicate(value))
                {
                    @this.AppendLine(value.ToString());
                }
            }

            return @this;
        }
    }
}