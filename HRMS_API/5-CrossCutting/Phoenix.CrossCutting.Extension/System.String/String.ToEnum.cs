using System;

namespace Phoenix.CrossCutting.Extension.System.String
{
    public static partial class Extensions
    {
        /// <summary>
        ///     A string extension method that converts the @this to an enum.
        /// </summary>
        /// <typeparam name="T">Generic type parameter.</typeparam>
        /// <param name="this">The @this to act on.</param>
        /// <returns>@this as a T.</returns>
        public static T ToEnum<T>(this string @this)
        {
            Type enumType = typeof(T);
            return (T)global::System.Enum.Parse(enumType, @this);
        }
        //public static T ToEnum<T>(this string? value, T defaultValue)
        //{
        //    if (string.IsNullOrEmpty(value))
        //    {
        //        return defaultValue;
        //    }

        //    return global::System.Enum.TryParse<T>(value, true, out T result) ? result : defaultValue;
        //}
    }
}