namespace Phoenix.CrossCutting.Extension.System.Int16.System.Net.IPAddress
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Converts a short value from network byte order to host byte order.
        /// </summary>
        /// <param name="network">The number to convert, expressed in network byte order.</param>
        /// <returns>A short value, expressed in host byte order.</returns>
        public static short NetworkToHostOrder(this short network)
        {
            return global::System.Net.IPAddress.NetworkToHostOrder(network);
        }
    }
}