namespace Phoenix.CrossCutting.Extension.System.DateTime
{
    public static partial class Extensions
    {
        /// <summary>
        ///     A DateTime extension method that converts the @this to an epoch time span.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <returns>@this as a TimeSpan.</returns>
        public static global::System.TimeSpan ToEpochTimeSpan(this global::System.DateTime @this)
        {
            return @this.Subtract(new global::System.DateTime(1970, 1, 1));
        }
    }
}