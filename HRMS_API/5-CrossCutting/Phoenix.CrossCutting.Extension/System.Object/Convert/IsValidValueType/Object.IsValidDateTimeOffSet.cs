namespace Phoenix.CrossCutting.Extension.System.Object.Convert.IsValidValueType
{
    public static partial class Extensions
    {
        /// <summary>
        ///     An object extension method that query if '@this' is valid System.DateTimeOffset.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <returns>true if valid System.DateTimeOffset, false if not.</returns>
        public static bool IsValidDateTimeOffSet(this object @this)
        {
            if (@this == null)
            {
                return true;
            }

            return global::System.DateTimeOffset.TryParse(@this.ToString(), out global::System.DateTimeOffset result);
        }
    }
}