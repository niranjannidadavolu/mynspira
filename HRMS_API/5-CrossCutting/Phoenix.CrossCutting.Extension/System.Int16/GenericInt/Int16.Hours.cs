namespace Phoenix.CrossCutting.Extension.System.Int16.GenericInt
{
    public static partial class Extensions
    {
        /// <summary>
        ///     An Int16 extension method that hours the given this.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <returns>A TimeSpan.</returns>
        public static global::System.TimeSpan Hours(this short @this)
        {
            return global::System.TimeSpan.FromHours(@this);
        }
    }
}