namespace Phoenix.CrossCutting.Extension.System.Int64._CoreObject
{
    public static partial class Extensions
    {
        /// <summary>
        ///     A T extension method to determines whether the object is equal to any of the provided values.
        /// </summary>
        /// <param name="this">The object to be compared.</param>
        /// <param name="values">The value list to compare with the object.</param>
        /// <returns>true if the values list contains the object, else false.</returns>
        /// ###
        /// <typeparam name="T">Generic type parameter.</typeparam>
        public static bool In(this long @this, params long[] values)
        {
            return global::System.Array.IndexOf(values, @this) != -1;
        }
    }
}