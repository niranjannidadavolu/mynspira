using System;
using System.Security.Cryptography;
using System.Text;

namespace Phoenix.CrossCutting.Extension.System.String
{
    public static partial class Extensions
    {
        /// <summary>
        ///     A string extension method that encrypts the string.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <param name="key">The key.</param>
        /// <returns>The encrypted string.</returns>
        public static string EncryptRSA(this string @this, string key)
        {
            RSACryptoServiceProvider rsa = new RSACryptoServiceProvider(2048);
            byte[] bytes = rsa.Encrypt(Encoding.UTF8.GetBytes(@this), true);

            return BitConverter.ToString(bytes);
        }
    }
}