namespace Phoenix.CrossCutting.Extension.System.Int64.System.Net.IPAddress
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Converts a long value from host byte order to network byte order.
        /// </summary>
        /// <param name="host">The number to convert, expressed in host byte order.</param>
        /// <returns>A long value, expressed in network byte order.</returns>
        public static long HostToNetworkOrder(this long host)
        {
            return global::System.Net.IPAddress.HostToNetworkOrder(host);
        }
    }
}