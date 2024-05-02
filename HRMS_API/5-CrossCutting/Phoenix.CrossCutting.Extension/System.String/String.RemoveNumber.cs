using System.Linq;

namespace Phoenix.CrossCutting.Extension.System.String
{
    public static partial class Extensions
    {
        /// <summary>
        ///     A string extension method that removes the number described by @this.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <returns>A string.</returns>
        public static string RemoveNumber(this string @this)
        {
            return new string(@this.ToCharArray().Where(x => !char.IsNumber(x)).ToArray());
        }
    }
}