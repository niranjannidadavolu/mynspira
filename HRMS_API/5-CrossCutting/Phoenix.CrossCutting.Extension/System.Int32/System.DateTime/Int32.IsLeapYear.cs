namespace Phoenix.CrossCutting.Extension.System.Int32.System.DateTime
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Returns an indication whether the specified year is a leap year.
        /// </summary>
        /// <param name="year">A 4-digit year.</param>
        /// <returns>true if  is a leap year; otherwise, false.</returns>
        public static bool IsLeapYear(this int year)
        {
            return global::System.DateTime.IsLeapYear(year);
        }
    }
}