namespace Phoenix.CrossCutting.Extension.System.Int16.System.BitConverter
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Returns the specified 16-bit signed integer value as an array of bytes.
        /// </summary>
        /// <param name="value">The number to convert.</param>
        /// <returns>An array of bytes with length 2.</returns>
        public static byte[] GetBytes(this short value)
        {
            return global::System.BitConverter.GetBytes(value);
        }
    }
}