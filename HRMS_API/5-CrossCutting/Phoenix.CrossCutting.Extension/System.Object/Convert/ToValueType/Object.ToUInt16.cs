namespace Phoenix.CrossCutting.Extension.System.Object.Convert.ToValueType
{
    public static partial class Extensions
    {
        /// <summary>
        ///     An object extension method that converts the @this to an u int 16.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <returns>@this as an ushort.</returns>
        public static ushort ToUInt16(this object @this)
        {
            return global::System.Convert.ToUInt16(@this);
        }
    }
}