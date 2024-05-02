namespace Phoenix.CrossCutting.Extension.System.Array.System.Buffer
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Copies a specified number of bytes from a source array starting at a particular offset to a destination array
        ///     starting at a particular offset.
        /// </summary>
        /// <param name="src">The source buffer.</param>
        /// <param name="srcOffset">The zero-based byte offset into .</param>
        /// <param name="dst">The destination buffer.</param>
        /// <param name="dstOffset">The zero-based byte offset into .</param>
        /// <param name="count">The number of bytes to copy.</param>
        public static void BlockCopy(this global::System.Array src, int srcOffset, global::System.Array dst, int dstOffset, int count)
        {
            global::System.Buffer.BlockCopy(src, srcOffset, dst, dstOffset, count);
        }
    }
}