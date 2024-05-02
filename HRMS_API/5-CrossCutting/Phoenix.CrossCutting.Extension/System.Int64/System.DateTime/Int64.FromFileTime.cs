namespace Phoenix.CrossCutting.Extension.System.Int64.System.DateTime
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Converts the specified Windows file time to an equivalent local time.
        /// </summary>
        /// <param name="fileTime">A Windows file time expressed in ticks.</param>
        /// <returns>
        ///     An object that represents the local time equivalent of the date and time represented by the  parameter.
        /// </returns>
        public static global::System.DateTime FromFileTime(this long fileTime)
        {
            return global::System.DateTime.FromFileTime(fileTime);
        }
    }
}