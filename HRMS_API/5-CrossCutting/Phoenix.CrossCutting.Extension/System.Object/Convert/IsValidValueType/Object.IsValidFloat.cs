namespace Phoenix.CrossCutting.Extension.System.Object.Convert.IsValidValueType
{
    public static partial class Extensions
    {
        /// <summary>
        ///     An object extension method that query if '@this' is valid float.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <returns>true if valid float, false if not.</returns>
        public static bool IsValidFloat(this object @this)
        {
            if (@this == null)
            {
                return true;
            }

            return float.TryParse(@this.ToString(), out float result);
        }
    }
}