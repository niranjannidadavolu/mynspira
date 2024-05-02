using System;

namespace Phoenix.CrossCutting.Extension.System.Object.Convert.ToValueType
{
    public static partial class Extensions
    {
        /// <summary>
        ///     An object extension method that converts this object to a date time or default.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <returns>The given data converted to a DateTime.</returns>
        public static global::System.DateTime ToDateTimeOrDefault(this object @this)
        {
            try
            {
                return global::System.Convert.ToDateTime(@this);
            }
            catch (Exception)
            {
                return default;
            }
        }        

        /// <summary>
        ///     An object extension method that converts this object to a date time or default.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <param name="defaultValue">The default value.</param>
        /// <returns>The given data converted to a DateTime.</returns>
        public static global::System.DateTime ToDateTimeOrDefault(this object @this, global::System.DateTime defaultValue)
        {
            try
            {
                return global::System.Convert.ToDateTime(@this);
            }
            catch (Exception)
            {
                return defaultValue;
            }
        }

        /// <summary>
        ///     An object extension method that converts this object to a date time or default.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <param name="defaultValueFactory">The default value factory.</param>
        /// <returns>The given data converted to a DateTime.</returns>
        public static global::System.DateTime ToDateTimeOrDefault(this object @this, Func<global::System.DateTime> defaultValueFactory)
        {
            try
            {
                return global::System.Convert.ToDateTime(@this);
            }
            catch (Exception)
            {
                return defaultValueFactory();
            }
        }

        /// <summary>
        ///     An object extension method that converts this object to a Null value.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <returns>The given data converted to a DateTime.</returns>
        public static global::System.DateTime? ToDateTimeOrNull(this object @this)
        {
            try
            {
                return global::System.Convert.ToDateTime(@this);
            }
            catch (Exception)
            {
                return null;
            }
        }
    }
}