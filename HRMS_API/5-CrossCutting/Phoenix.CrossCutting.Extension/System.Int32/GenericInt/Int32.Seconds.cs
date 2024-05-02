namespace Phoenix.CrossCutting.Extension.System.Int32.GenericInt
{
    public static partial class Extensions
    {
        /// <summary>
        ///     An Int32 extension method that seconds the given this.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <returns>A TimeSpan.</returns>
        public static global::System.TimeSpan Seconds(this int @this)
        {
            return global::System.TimeSpan.FromSeconds(@this);
        }
    }
}