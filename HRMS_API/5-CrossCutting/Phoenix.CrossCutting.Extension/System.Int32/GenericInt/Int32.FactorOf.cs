namespace Phoenix.CrossCutting.Extension.System.Int32.GenericInt
{
    public static partial class Extensions
    {
        /// <summary>
        ///     An Int32 extension method that factor of.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <param name="factorNumer">The factor numer.</param>
        /// <returns>true if it succeeds, false if it fails.</returns>
        public static bool FactorOf(this int @this, int factorNumer)
        {
            return factorNumer % @this == 0;
        }
    }
}