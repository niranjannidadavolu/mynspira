namespace Phoenix.CrossCutting.Extension.System.Int16.System.Net.IPAddress
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Converts a short value from host byte order to network byte order.
        /// </summary>
        /// <param name="host">The number to convert, expressed in host byte order.</param>
        /// <returns>A short value, expressed in network byte order.</returns>
        public static short HostToNetworkOrder(this short host)
        {
            return global::System.Net.IPAddress.HostToNetworkOrder(host);
        }
    }
}