using System;

namespace Phoenix.CrossCutting.Extension.System.Object.Convert.ToValueType
{
    public static partial class Extensions
    {
        /// <summary>
        ///     An object extension method that converts the @this to a nullable u int 16.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <returns>@this as an ushort?.</returns>
        public static ushort? ToNullableUInt16(this object @this)
        {
            if (@this == null || @this == DBNull.Value)
            {
                return null;
            }

            return global::System.Convert.ToUInt16(@this);
        }
    }
}