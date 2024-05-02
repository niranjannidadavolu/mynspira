namespace Phoenix.CrossCutting.Extension.System.Object.Casting
{
    public static partial class Extensions
    {
        /// <summary>
        ///     An object extension method that query if '@this' is assignable from.
        /// </summary>
        /// <typeparam name="T">Generic type parameter.</typeparam>
        /// <param name="this">The @this to act on.</param>
        /// <returns>true if assignable from, false if not.</returns>
        public static bool IsAssignableFrom<T>(this object @this)
        {
            global::System.Type type = @this.GetType();
            return type.IsAssignableFrom(typeof(T));
        }

        /// <summary>
        ///     An object extension method that query if '@this' is assignable from.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <param name="targetType">Type of the target.</param>
        /// <returns>true if assignable from, false if not.</returns>
        public static bool IsAssignableFrom(this object @this, global::System.Type targetType)
        {
            global::System.Type type = @this.GetType();
            return type.IsAssignableFrom(targetType);
        }
    }
}