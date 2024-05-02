namespace Phoenix.CrossCutting.Extension.System.Object.Convert.IsValidValueType
{
    public static partial class Extensions
    {
        /// <summary>
        ///     An object extension method that query if '@this' is valid long.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <returns>true if valid long, false if not.</returns>
        public static bool IsValidLong(this object @this)
        {
            if (@this == null)
            {
                return true;
            }

            return long.TryParse(@this.ToString(), out long result);
        }
    }
}