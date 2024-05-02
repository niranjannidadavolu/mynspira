using System.Text;
using System.Security.Cryptography;
using Phoenix.CrossCutting.Security.PhoenixCryptography.Symmetric.Internal;

namespace Phoenix.CrossCutting.Security.PhoenixCryptography.Symmetric
{
    /// <summary>
    /// Symmetric/DES encryption.
    /// </summary>
    public class DES : SymmetricBase<DESCryptoServiceProvider>
    {
        /// <summary>
        /// DES encryption.
        /// </summary>
        /// <param name="data">The string to be encrypted,not null.</param>
        /// <param name="password">The password used to derive the key.</param>
        /// <param name="vector">The initialization vector (IV) to use to derive the key.</param>
        /// <param name="salt">The key salt to use to derive the key.The default is <paramref name="password"/>.</param>
        /// <param name="encoding">The <see cref="T:System.Text.Encoding"/>,default is <see cref="Encoding.UTF8"/>.</param>
        /// <param name="iterations">The number of iterations for the operation.</param>
        /// <param name="mode">The mode for operation of the symmetric algorithm.</param>
        /// <param name="padding">The padding mode used in the symmetric algorithm. The default is System.Security.Cryptography.PaddingMode.PKCS7.</param>
        /// <returns>The encrypted string.</returns>
        public static string Encrypt(string data, string password, string vector = null, string salt = null, Encoding encoding = null, int iterations = 1000, CipherMode mode = CipherMode.ECB, PaddingMode padding = PaddingMode.PKCS7)
        {
            return EncryptOrDecryptString(EncryptionTypes.Encrypt, data, password, salt, vector, 64, 64, encoding, iterations, mode, padding);
        }

        /// <summary>
        /// DES decryption.
        /// </summary>
        /// <param name="data">The string to be decrypted,not null.</param>
        /// <param name="password">The password used to derive the key.</param>
        /// <param name="vector">The initialization vector (IV) to use to derive the key.</param>
        /// <param name="salt">The key salt to use to derive the key.The default is <paramref name="password"/>.</param>
        /// <param name="encoding">The <see cref="T:System.Text.Encoding"/>,default is <see cref="Encoding.UTF8"/>.</param>
        /// <param name="iterations">The number of iterations for the operation.</param>
        /// <param name="mode">The mode for operation of the symmetric algorithm.</param>
        /// <param name="padding">The padding mode used in the symmetric algorithm. The default is System.Security.Cryptography.PaddingMode.PKCS7.</param>
        /// <returns>The decryption string.</returns>
        public static string Decrypt(string data, string password, string vector = null, string salt = null, Encoding encoding = null, int iterations = 1000, CipherMode mode = CipherMode.ECB, PaddingMode padding = PaddingMode.PKCS7)
        {
            return EncryptOrDecryptString(EncryptionTypes.Decrypt, data, password, salt, vector, 64, 64, encoding, iterations, mode, padding);
        }

        /// <summary>
        /// DES encryption.
        /// </summary>
        /// <param name="data">The string to be encrypted,not null.</param>
        /// <param name="password">The password used to derive the key.</param>
        /// <param name="vector">The initialization vector (IV) to use to derive the key.</param>
        /// <param name="salt">The key salt to use to derive the key.The default is <paramref name="password"/>.</param>
        /// <param name="encoding">The <see cref="T:System.Text.Encoding"/>,default is <see cref="Encoding.UTF8"/>.</param>
        /// <param name="iterations">The number of iterations for the operation.</param>
        /// <param name="mode">The mode for operation of the symmetric algorithm.</param>
        /// <param name="padding">The padding mode used in the symmetric algorithm. The default is System.Security.Cryptography.PaddingMode.PKCS7.</param>
        /// <returns>The encrypted byte array.</returns>
        public static byte[] EncryptBytes(string data, string password, string vector = null, string salt = null, Encoding encoding = null, int iterations = 1000, CipherMode mode = CipherMode.ECB, PaddingMode padding = PaddingMode.PKCS7)
        {
            return EncryptOrDecryptBytes(EncryptionTypes.Encrypt, data, password, salt, vector, 64, 64, encoding, iterations, mode, padding);
        }

        /// <summary>
        /// DES decryption.
        /// </summary>
        /// <param name="data">The string to be decrypted,not null.</param>
        /// <param name="password">The password used to derive the key.</param>
        /// <param name="vector">The initialization vector (IV) to use to derive the key.</param>
        /// <param name="salt">The key salt to use to derive the key.The default is <paramref name="password"/>.</param>
        /// <param name="encoding">The <see cref="T:System.Text.Encoding"/>,default is <see cref="Encoding.UTF8"/>.</param>
        /// <param name="iterations">The number of iterations for the operation.</param>
        /// <param name="mode">The mode for operation of the symmetric algorithm.</param>
        /// <param name="padding">The padding mode used in the symmetric algorithm. The default is System.Security.Cryptography.PaddingMode.PKCS7.</param>
        /// <returns>The decryption byte array.</returns>
        public static byte[] DecryptBytes(string data, string password, string vector = null, string salt = null, Encoding encoding = null, int iterations = 1000, CipherMode mode = CipherMode.ECB, PaddingMode padding = PaddingMode.PKCS7)
        {
            return EncryptOrDecryptBytes(EncryptionTypes.Decrypt, data, password, salt, vector, 64, 64, encoding, iterations, mode, padding);
        }
    }
}
