using System;

namespace Phoenix.CrossCutting.Extension.System.Object.Convert.ToValueType
{
    public static partial class Extensions
    {
        /// <summary>
        ///     An object extension method that converts this object to a string or default.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <returns>The given data converted to a string.</returns>
        public static string ToStringOrDefault(this object @this)
        {
            try
            {
                return global::System.Convert.ToString(@this);
            }
            catch (Exception)
            {
                return default;
            }
        }

        /// <summary>
        ///     An object extension method that converts this object to a string or default.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <param name="defaultValue">The default value.</param>
        /// <returns>The given data converted to a string.</returns>
        public static string ToStringOrDefault(this object @this, string defaultValue)
        {
            try
            {
                return global::System.Convert.ToString(@this);
            }
            catch (Exception)
            {
                return defaultValue;
            }
        }

        /// <summary>
        ///     An object extension method that converts this object to a string or default.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <param name="defaultValueFactory">The default value factory.</param>
        /// <returns>The given data converted to a string.</returns>
        public static string ToStringOrDefault(this object @this, Func<string> defaultValueFactory)
        {
            try
            {
                return global::System.Convert.ToString(@this);
            }
            catch (Exception)
            {
                return defaultValueFactory();
            }
        }
    }
}