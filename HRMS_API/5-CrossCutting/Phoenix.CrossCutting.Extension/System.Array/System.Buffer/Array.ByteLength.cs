namespace Phoenix.CrossCutting.Extension.System.Array.System.Buffer
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Returns the number of bytes in the specified array.
        /// </summary>
        /// <param name="array">An array.</param>
        /// <returns>The number of bytes in the array.</returns>
        public static int ByteLength(this global::System.Array array)
        {
            return global::System.Buffer.ByteLength(array);
        }
    }
}