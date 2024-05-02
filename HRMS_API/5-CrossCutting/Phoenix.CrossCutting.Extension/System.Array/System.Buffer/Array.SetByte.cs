namespace Phoenix.CrossCutting.Extension.System.Array.System.Buffer
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Assigns a specified value to a byte at a particular location in a specified array.
        /// </summary>
        /// <param name="array">An array.</param>
        /// <param name="index">A location in the array.</param>
        /// <param name="value">A value to assign.</param>
        public static void SetByte(this global::System.Array array, int index, byte value)
        {
            global::System.Buffer.SetByte(array, index, value);
        }
    }
}