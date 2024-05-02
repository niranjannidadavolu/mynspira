namespace Phoenix.CrossCutting.Extension.System.Random
{
    public static partial class Extensions
    {
        /// <summary>
        ///     A Random extension method that flip a coin toss.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <returns>true 50% of time, otherwise false.</returns>
        public static bool CoinToss(this global::System.Random @this)
        {
            return @this.Next(2) == 0;
        }
    }
}