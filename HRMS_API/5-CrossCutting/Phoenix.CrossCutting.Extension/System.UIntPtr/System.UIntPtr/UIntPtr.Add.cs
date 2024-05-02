namespace Phoenix.CrossCutting.Extension.System.UIntPtr.System.UIntPtr
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Adds an offset to the value of an unsigned pointer.
        /// </summary>
        /// <param name="pointer">The unsigned pointer to add the offset to.</param>
        /// <param name="offset">The offset to add.</param>
        /// <returns>A new unsigned pointer that reflects the addition of  to .</returns>
        public static global::System.UIntPtr Add(this global::System.UIntPtr pointer, int offset)
        {
            return global::System.UIntPtr.Add(pointer, offset);
        }
    }
}