namespace Phoenix.CrossCutting.Extension.System.DateTime
{
    public static partial class Extensions
    {
        /// <summary>
        ///     A DateTime extension method that elapsed the given datetime.
        /// </summary>
        /// <param name="datetime">The datetime to act on.</param>
        /// <returns>A TimeSpan.</returns>
        public static global::System.TimeSpan Elapsed(this global::System.DateTime datetime)
        {
            return global::System.DateTime.Now - datetime;
        }
    }
}