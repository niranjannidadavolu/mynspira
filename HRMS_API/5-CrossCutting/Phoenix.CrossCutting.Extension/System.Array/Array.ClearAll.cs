namespace Phoenix.CrossCutting.Extension.System.Array
{
    public static partial class Extensions
    {
        /// <summary>
        ///     An Array extension method that clears the array.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        public static void ClearAll(this global::System.Array @this)
        {
            global::System.Array.Clear(@this, 0, @this.Length);
        }
    }
}