using System;

namespace Phoenix.CrossCutting.Extension.System.Object.Convert.ToValueType
{
    public static partial class Extensions
    {
        /// <summary>
        ///     An object extension method that converts this object to a unique identifier or default.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <returns>The given data converted to a GUID.</returns>
        public static global::System.Guid ToGuidOrDefault(this object @this)
        {
            try
            {
                return new global::System.Guid(@this.ToString());
            }
            catch (Exception)
            {
                return global::System.Guid.Empty;
            }
        }

        /// <summary>
        ///     An object extension method that converts this object to a unique identifier or default.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <param name="defaultValue">The default value.</param>
        /// <returns>The given data converted to a GUID.</returns>
        public static global::System.Guid ToGuidOrDefault(this object @this, global::System.Guid defaultValue)
        {
            try
            {
                return new global::System.Guid(@this.ToString());
            }
            catch (Exception)
            {
                return defaultValue;
            }
        }

        /// <summary>
        ///     An object extension method that converts this object to a unique identifier or default.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <param name="defaultValueFactory">The default value factory.</param>
        /// <returns>The given data converted to a GUID.</returns>
        public static global::System.Guid ToGuidOrDefault(this object @this, Func<global::System.Guid> defaultValueFactory)
        {
            try
            {
                return new global::System.Guid(@this.ToString());
            }
            catch (Exception)
            {
                return defaultValueFactory();
            }
        }
    }
}