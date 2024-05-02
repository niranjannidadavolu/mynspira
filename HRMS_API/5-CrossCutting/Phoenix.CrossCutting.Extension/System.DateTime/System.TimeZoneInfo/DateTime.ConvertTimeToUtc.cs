namespace Phoenix.CrossCutting.Extension.System.DateTime.System.TimeZoneInfo
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Converts the current date and time to Coordinated Universal Time (UTC).
        /// </summary>
        /// <param name="dateTime">The date and time to convert.</param>
        /// <returns>
        ///     The Coordinated Universal Time (UTC) that corresponds to the  parameter. The  value&#39;s  property is always
        ///     set to .
        /// </returns>
        public static global::System.DateTime ConvertTimeToUtc(this global::System.DateTime dateTime)
        {
            return global::System.TimeZoneInfo.ConvertTimeToUtc(dateTime);
        }

        /// <summary>
        ///     Converts the time in a specified time zone to Coordinated Universal Time (UTC).
        /// </summary>
        /// <param name="dateTime">The date and time to convert.</param>
        /// <param name="sourceTimeZone">The time zone of .</param>
        /// <returns>
        ///     The Coordinated Universal Time (UTC) that corresponds to the  parameter. The  object&#39;s  property is
        ///     always set to .
        /// </returns>
        public static global::System.DateTime ConvertTimeToUtc(this global::System.DateTime dateTime, global::System.TimeZoneInfo sourceTimeZone)
        {
            return global::System.TimeZoneInfo.ConvertTimeToUtc(dateTime, sourceTimeZone);
        }
    }
}