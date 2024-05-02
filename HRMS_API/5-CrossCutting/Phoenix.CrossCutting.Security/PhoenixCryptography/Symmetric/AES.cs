// Decompiled with JetBrains decompiler
// Type: Phoenix.CrossCutting.Security.PhoenixCryptography.Symmetric.AES
// Assembly: Phoenix.CrossCutting.Security, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null
// MVID: F576A95B-037E-4C0A-A44B-5D1A46E06178
// Assembly location: C:\Users\SeshuKumar\Downloads\portalApi\portalApi\Phoenix.CrossCutting.Security.dll

using Phoenix.CrossCutting.Security.PhoenixCryptography.Symmetric.Enum;
using Phoenix.CrossCutting.Security.PhoenixCryptography.Symmetric.Internal;

using System.Security.Cryptography;
using System.Text;

namespace Phoenix.CrossCutting.Security.PhoenixCryptography.Symmetric
{
    public class AES : SymmetricBase<AesCryptoServiceProvider>
    {
        public static string Encrypt(
          string data,
          string password,
          string vector = null,
          string salt = null,
          AESKeySizeFlags keySize = AESKeySizeFlags.L256,
          Encoding encoding = null,
          int iterations = 1000,
          CipherMode mode = CipherMode.ECB,
          PaddingMode padding = PaddingMode.PKCS7)
        {
            return EncryptOrDecryptString(EncryptionTypes.Encrypt, data, password, salt, vector, (int)keySize, encoding: encoding, iterations: iterations, mode: mode, padding: padding);
        }

        public static string Decrypt(
          string data,
          string password,
          string vector = null,
          string salt = null,
          AESKeySizeFlags keySize = AESKeySizeFlags.L256,
          Encoding encoding = null,
          int iterations = 1000,
          CipherMode mode = CipherMode.ECB,
          PaddingMode padding = PaddingMode.PKCS7)
        {
            return EncryptOrDecryptString(EncryptionTypes.Decrypt, data, password, salt, vector, (int)keySize, encoding: encoding, iterations: iterations, mode: mode, padding: padding);
        }

        public static byte[] EncryptBytes(
          string data,
          string password,
          string vector = null,
          string salt = null,
          AESKeySizeFlags keySize = AESKeySizeFlags.L256,
          Encoding encoding = null,
          int iterations = 1000,
          CipherMode mode = CipherMode.ECB,
          PaddingMode padding = PaddingMode.PKCS7)
        {
            return EncryptOrDecryptBytes(EncryptionTypes.Encrypt, data, password, salt, vector, (int)keySize, encoding: encoding, iterations: iterations, mode: mode, padding: padding);
        }

        public static byte[] DecryptBytes(
          string data,
          string password,
          string vector = null,
          string salt = null,
          AESKeySizeFlags keySize = AESKeySizeFlags.L256,
          Encoding encoding = null,
          int iterations = 1000,
          CipherMode mode = CipherMode.ECB,
          PaddingMode padding = PaddingMode.PKCS7)
        {
            return EncryptOrDecryptBytes(EncryptionTypes.Decrypt, data, password, salt, vector, (int)keySize, encoding: encoding, iterations: iterations, mode: mode, padding: padding);
        }
    }
}
