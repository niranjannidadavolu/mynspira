using System;
using System.Globalization;
using System.Security.Cryptography;
using System.Text;

namespace Phoenix.CrossCutting.Extension.System.String
{
    public static partial class Extensions
    {
        /// <summary>
        ///     A string extension method that decrypt a string.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <param name="key">The key.</param>
        /// <returns>The decrypted string.</returns>
        public static string DecryptRSA(this string @this, string key)
        {
            RSACryptoServiceProvider rsa = new RSACryptoServiceProvider(2048);
            string[] decryptArray = @this.Split(new[] { "-" }, StringSplitOptions.None);
            byte[] decryptByteArray = global::System.Array.ConvertAll(decryptArray, s => Convert.ToByte(byte.Parse(s, NumberStyles.HexNumber)));
            byte[] bytes = rsa.Decrypt(decryptByteArray, true);

            return Encoding.UTF8.GetString(bytes);
        }
    }
}