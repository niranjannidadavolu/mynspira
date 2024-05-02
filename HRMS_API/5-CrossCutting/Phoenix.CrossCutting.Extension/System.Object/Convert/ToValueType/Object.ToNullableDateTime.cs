using System;

namespace Phoenix.CrossCutting.Extension.System.Object.Convert.ToValueType
{
    public static partial class Extensions
    {
        /// <summary>
        ///     An object extension method that converts the @this to a nullable date time.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <returns>@this as a DateTime?.</returns>
        public static global::System.DateTime? ToNullableDateTime(this object @this)
        {
            if (@this == null || @this == DBNull.Value)
            {
                return null;
            }

            return global::System.Convert.ToDateTime(@this);
        }
    }
}