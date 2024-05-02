namespace Phoenix.CrossCutting.Extension.System.Guid
{
    public static partial class Extensions
    {
        /// <summary>A GUID extension method that queries if a not is empty.</summary>
        /// <param name="this">The @this to act on.</param>
        /// <returns>true if a not is empty, false if not.</returns>
        public static bool IsNotEmpty(this global::System.Guid @this)
        {
            return @this != global::System.Guid.Empty;
        }
    }
}