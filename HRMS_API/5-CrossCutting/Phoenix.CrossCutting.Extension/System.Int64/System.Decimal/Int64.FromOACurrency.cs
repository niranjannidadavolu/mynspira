namespace Phoenix.CrossCutting.Extension.System.Int64.System.Decimal
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Converts the specified 64-bit signed integer, which contains an OLE Automation Currency value, to the
        ///     equivalent  value.
        /// </summary>
        /// <param name="cy">An OLE Automation Currency value.</param>
        /// <returns>A  that contains the equivalent of .</returns>
        public static decimal FromOACurrency(this long cy)
        {
            return decimal.FromOACurrency(cy);
        }
    }
}