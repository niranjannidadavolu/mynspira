namespace Phoenix.CrossCutting.Extension.System.Guid
{
    public static partial class Extensions
    {
        /// <summary>A GUID extension method that query if '@this' is empty.</summary>
        /// <param name="this">The @this to act on.</param>
        /// <returns>true if empty, false if not.</returns>
        public static bool IsEmpty(this global::System.Guid @this)
        {
            return @this == global::System.Guid.Empty;
        }
    }
}