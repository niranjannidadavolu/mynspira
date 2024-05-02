namespace Phoenix.CrossCutting.Extension.System.Object.Convert.ToValueType
{
    public static partial class Extensions
    {
        /// <summary>
        ///     An object extension method that converts the @this to a date time off set.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <returns>@this as a DateTimeOffset.</returns>
        public static global::System.DateTimeOffset ToDateTimeOffSet(this object @this)
        {
            return new global::System.DateTimeOffset(global::System.Convert.ToDateTime(@this), global::System.TimeSpan.Zero);
        }
    }
}