namespace Phoenix.CrossCutting.Extension.System.Int32.System.Net.IPAddress
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Converts an integer value from network byte order to host byte order.
        /// </summary>
        /// <param name="network">The number to convert, expressed in network byte order.</param>
        /// <returns>An integer value, expressed in host byte order.</returns>
        public static int NetworkToHostOrder(this int network)
        {
            return global::System.Net.IPAddress.NetworkToHostOrder(network);
        }
    }
}