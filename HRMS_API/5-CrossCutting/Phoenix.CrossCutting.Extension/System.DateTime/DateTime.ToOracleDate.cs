using System;

namespace Phoenix.CrossCutting.Extension.System.DateTime
{
    public static partial class Extensions
    {
        /// <summary>
        ///     A DateTime extension method that tomorrows the given this.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <returns>Tomorrow date at same time.</returns>
        public static global::System.DateTime ToOracleDate(this global::System.DateTime @this)
        {
            string datetimeInString = @this.ToString("yyyy-MM-dd HH:mm:ss");
            return Convert.ToDateTime(datetimeInString);
        }
    }
}