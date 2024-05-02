namespace Phoenix.CrossCutting.Extension.System.Object.Convert.IsValidValueType
{
    public static partial class Extensions
    {
        /// <summary>
        ///     An object extension method that query if '@this' is valid char.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <returns>true if valid char, false if not.</returns>
        public static bool IsValidChar(this object @this)
        {
            return char.TryParse(@this.ToString(), out char result);
        }
    }
}