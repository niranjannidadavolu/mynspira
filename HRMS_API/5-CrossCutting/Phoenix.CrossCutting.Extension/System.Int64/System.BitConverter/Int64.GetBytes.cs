namespace Phoenix.CrossCutting.Extension.System.Int64.System.BitConverter
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Returns the specified 64-bit signed integer value as an array of bytes.
        /// </summary>
        /// <param name="value">The number to convert.</param>
        /// <returns>An array of bytes with length 8.</returns>
        public static byte[] GetBytes(this long value)
        {
            return global::System.BitConverter.GetBytes(value);
        }
    }
}