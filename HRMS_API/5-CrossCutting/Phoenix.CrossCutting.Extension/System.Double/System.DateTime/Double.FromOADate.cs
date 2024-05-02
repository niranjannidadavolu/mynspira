namespace Phoenix.CrossCutting.Extension.System.Double.System.DateTime
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Returns a  equivalent to the specified OLE Automation Date.
        /// </summary>
        /// <param name="d">An OLE Automation Date value.</param>
        /// <returns>An object that represents the same date and time as .</returns>
        public static global::System.DateTime FromOADate(this double d)
        {
            return global::System.DateTime.FromOADate(d);
        }
    }
}