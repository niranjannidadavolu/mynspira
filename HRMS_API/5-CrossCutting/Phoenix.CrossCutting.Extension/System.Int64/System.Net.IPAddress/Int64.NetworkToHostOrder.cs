namespace Phoenix.CrossCutting.Extension.System.Int64.System.Net.IPAddress
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Converts a long value from network byte order to host byte order.
        /// </summary>
        /// <param name="network">The number to convert, expressed in network byte order.</param>
        /// <returns>A long value, expressed in host byte order.</returns>
        public static long NetworkToHostOrder(this long network)
        {
            return global::System.Net.IPAddress.NetworkToHostOrder(network);
        }
    }
}