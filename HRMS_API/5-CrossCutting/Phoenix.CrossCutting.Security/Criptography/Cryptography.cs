using Phoenix.CrossCutting.Security.PhoenixCryptography.Symmetric;
using Phoenix.CrossCutting.Security.PhoenixCryptography.Symmetric.Enum;

namespace Phoenix.CrossCutting.Security.Criptography
{
    public class Cryptography : ICryptography
    {
        public string Encrypt(string source, string key)
        {
            string encryptedString = string.Empty;
            encryptedString = AES.Encrypt(source, key, "NSPIRA_HUMAN_RESOURCE", keySize: AESKeySizeFlags.L128);
            return encryptedString;
        }

        public string Decrypt(string encodedText, string key)
        {
            string plainText = string.Empty;
            if (!string.IsNullOrEmpty(encodedText))
            {
                plainText = AES.Decrypt(encodedText, key, "NSPIRA_HUMAN_RESOURCE", keySize: AESKeySizeFlags.L128);
            }
            return plainText;
        }
    }
}
