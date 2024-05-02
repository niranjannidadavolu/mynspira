namespace Phoenix.CrossCutting.Extension.System.Object__.System.Type
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Gets the types of the objects in the specified array.
        /// </summary>
        /// <param name="args">An array of objects whose types to determine.</param>
        /// <returns>An array of  objects representing the types of the corresponding elements in .</returns>
        public static global::System.Type[] GetTypeArray(this object[] args)
        {
            return global::System.Type.GetTypeArray(args);
        }
    }
}