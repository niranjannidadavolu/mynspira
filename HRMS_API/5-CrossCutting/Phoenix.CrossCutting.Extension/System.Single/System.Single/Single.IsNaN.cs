namespace Phoenix.CrossCutting.Extension.System.Single.System.Single
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Returns a value that indicates whether the specified value is not a number ().
        /// </summary>
        /// <param name="f">A single-precision floating-point number.</param>
        /// <returns>true if  evaluates to not a number (); otherwise, false.</returns>
        public static bool IsNaN(this float f)
        {
            return float.IsNaN(f);
        }
    }
}