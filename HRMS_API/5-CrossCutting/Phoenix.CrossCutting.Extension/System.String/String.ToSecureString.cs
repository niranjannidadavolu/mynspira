using System.Security;

namespace Phoenix.CrossCutting.Extension.System.String
{
    public static partial class Extensions
    {
        /// <summary>
        ///     A String extension method that converts the @this to a secure string.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <returns>@this as a SecureString.</returns>
        public static SecureString ToSecureString(this string @this)
        {
            SecureString secureString = new();
            foreach (char c in @this)
            {
                secureString.AppendChar(c);
            }

            return secureString;
        }
    }
}