namespace Phoenix.CrossCutting.Extension.System.String._CoreObject
{
    public static partial class Extensions
    {
        /// <summary>
        ///     A T extension method that query if '@this' is null.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <returns>true if null, false if not.</returns>
        public static bool IsNull(this string @this)
        {
            return @this == null;
        }
    }
}