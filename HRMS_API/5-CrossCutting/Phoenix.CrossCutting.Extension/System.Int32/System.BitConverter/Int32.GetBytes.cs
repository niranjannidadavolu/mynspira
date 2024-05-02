namespace Phoenix.CrossCutting.Extension.System.Int32.System.BitConverter
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Returns the specified 32-bit signed integer value as an array of bytes.
        /// </summary>
        /// <param name="value">The number to convert.</param>
        /// <returns>An array of bytes with length 4.</returns>
        public static byte[] GetBytes(this int value)
        {
            return global::System.BitConverter.GetBytes(value);
        }
    }
}