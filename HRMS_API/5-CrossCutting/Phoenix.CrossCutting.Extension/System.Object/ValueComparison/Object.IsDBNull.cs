namespace Phoenix.CrossCutting.Extension.System.Object.ValueComparison
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Returns an indication whether the specified object is of type .
        /// </summary>
        /// <typeparam name="T">Generic type parameter.</typeparam>
        /// <param name="value">An object.</param>
        /// <returns>true if  is of type ; otherwise, false.</returns>
        public static bool IsDBNull<T>(this T value) where T : class
        {
            return global::System.Convert.IsDBNull(value);
        }
    }
}