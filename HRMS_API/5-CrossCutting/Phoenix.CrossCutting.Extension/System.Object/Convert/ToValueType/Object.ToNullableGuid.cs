using System;

namespace Phoenix.CrossCutting.Extension.System.Object.Convert.ToValueType
{
    public static partial class Extensions
    {
        /// <summary>
        ///     An object extension method that converts the @this to a nullable unique identifier.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <returns>@this as a Guid?.</returns>
        public static global::System.Guid? ToNullableGuid(this object @this)
        {
            if (@this == null || @this == DBNull.Value)
            {
                return null;
            }

            return new global::System.Guid(@this.ToString());
        }
    }
}