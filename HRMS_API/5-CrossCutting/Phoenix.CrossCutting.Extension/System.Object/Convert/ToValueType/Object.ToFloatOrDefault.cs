using System;

namespace Phoenix.CrossCutting.Extension.System.Object.Convert.ToValueType
{
    public static partial class Extensions
    {
        /// <summary>
        ///     An object extension method that converts this object to a float or default.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <returns>The given data converted to a float.</returns>
        public static float ToFloatOrDefault(this object @this)
        {
            try
            {
                return global::System.Convert.ToSingle(@this);
            }
            catch (Exception)
            {
                return default;
            }
        }

        /// <summary>
        ///     An object extension method that converts this object to a float or default.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <param name="defaultValue">The default value.</param>
        /// <returns>The given data converted to a float.</returns>
        public static float ToFloatOrDefault(this object @this, float defaultValue)
        {
            try
            {
                return global::System.Convert.ToSingle(@this);
            }
            catch (Exception)
            {
                return defaultValue;
            }
        }

        /// <summary>
        ///     An object extension method that converts this object to a float or default.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <param name="defaultValueFactory">The default value factory.</param>
        /// <returns>The given data converted to a float.</returns>
        public static float ToFloatOrDefault(this object @this, Func<float> defaultValueFactory)
        {
            try
            {
                return global::System.Convert.ToSingle(@this);
            }
            catch (Exception)
            {
                return defaultValueFactory();
            }
        }
    }
}