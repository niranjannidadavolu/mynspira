namespace Phoenix.CrossCutting.Extension.System.UIntPtr.System.UIntPtr
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Subtracts an offset from the value of an unsigned pointer.
        /// </summary>
        /// <param name="pointer">The unsigned pointer to subtract the offset from.</param>
        /// <param name="offset">The offset to subtract.</param>
        /// <returns>A new unsigned pointer that reflects the subtraction of  from .</returns>
        public static global::System.UIntPtr Subtract(this global::System.UIntPtr pointer, int offset)
        {
            return global::System.UIntPtr.Subtract(pointer, offset);
        }
    }
}