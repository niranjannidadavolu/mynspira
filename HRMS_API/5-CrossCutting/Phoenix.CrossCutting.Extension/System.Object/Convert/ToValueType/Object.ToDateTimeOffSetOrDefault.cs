using System;

namespace Phoenix.CrossCutting.Extension.System.Object.Convert.ToValueType
{
    public static partial class Extensions
    {
        /// <summary>
        ///     An object extension method that converts this object to a date time off set or default.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <returns>The given data converted to a DateTimeOffset.</returns>
        public static global::System.DateTimeOffset ToDateTimeOffSetOrDefault(this object @this)
        {
            try
            {
                return new global::System.DateTimeOffset(global::System.Convert.ToDateTime(@this), global::System.TimeSpan.Zero);
            }
            catch (Exception)
            {
                return default;
            }
        }

        /// <summary>
        ///     An object extension method that converts this object to a date time off set or default.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <param name="defaultValue">The default value.</param>
        /// <returns>The given data converted to a DateTimeOffset.</returns>
        public static global::System.DateTimeOffset ToDateTimeOffSetOrDefault(this object @this, global::System.DateTimeOffset defaultValue)
        {
            try
            {
                return new global::System.DateTimeOffset(global::System.Convert.ToDateTime(@this), global::System.TimeSpan.Zero);
            }
            catch (Exception)
            {
                return defaultValue;
            }
        }

        /// <summary>
        ///     An object extension method that converts this object to a date time off set or default.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <param name="defaultValueFactory">The default value factory.</param>
        /// <returns>The given data converted to a DateTimeOffset.</returns>
        public static global::System.DateTimeOffset ToDateTimeOffSetOrDefault(this object @this, Func<global::System.DateTimeOffset> defaultValueFactory)
        {
            try
            {
                return new global::System.DateTimeOffset(global::System.Convert.ToDateTime(@this), global::System.TimeSpan.Zero);
            }
            catch (Exception)
            {
                return defaultValueFactory();
            }
        }
    }
}