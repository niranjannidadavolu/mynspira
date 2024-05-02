namespace Phoenix.CrossCutting.Extension.System.TimeSpan
{
    public static partial class Extensions
    {
        /// <summary>
        ///     A TimeSpan extension method that add the specified TimeSpan to the current DateTime.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <returns>The current DateTime with the specified TimeSpan added to it.</returns>
        public static global::System.DateTime FromNow(this global::System.TimeSpan @this)
        {
            return global::System.DateTime.Now.Add(@this);
        }
    }
}