namespace Phoenix.CrossCutting.Extension.System.Object.Convert.ToValueType
{
    public static partial class Extensions
    {
        /// <summary>
        ///     An object extension method that converts the @this to a double.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <returns>@this as a double.</returns>
        public static double ToDouble(this object @this)
        {
            return global::System.Convert.ToDouble(@this);
        }
    }
}