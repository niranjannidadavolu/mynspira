namespace Phoenix.CrossCutting.Extension.System.Object.Convert.IsValidValueType
{
    public static partial class Extensions
    {
        /// <summary>
        ///     An object extension method that query if '@this' is valid System.Guid.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <returns>true if valid System.Guid, false if not.</returns>
        public static bool IsValidGuid(this object @this)
        {
            return global::System.Guid.TryParse(@this.ToString(), out global::System.Guid result);
        }
    }
}