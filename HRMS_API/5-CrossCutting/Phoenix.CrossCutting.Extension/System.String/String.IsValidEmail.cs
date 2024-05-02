using System.ComponentModel.DataAnnotations;

namespace Phoenix.CrossCutting.Extension.System.String
{
    public static partial class Extensions
    {
        /// <summary>
        ///     A string extension method that query if '@this' is Alpha.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <returns>true if Alpha, false if not.</returns>
        public static bool IsValidEmail(this string @this)
        {
            return new EmailAddressAttribute().IsValid(@this);
        }
    }
}