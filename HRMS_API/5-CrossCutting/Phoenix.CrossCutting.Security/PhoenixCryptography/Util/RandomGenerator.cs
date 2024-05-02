using System;
using System.Security.Cryptography;
using System.Text;


namespace Phoenix.CrossCutting.Security.PhoenixCryptography.Util
{
    /// <summary>
    /// The random generator
    /// </summary>
    public static class RandomGenerator
    {
        private const string StringCharacters = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";

        private static readonly int StringCharactersLength = StringCharacters.Length;

        /// <summary>
        /// Gets the int array.
        /// </summary>
        /// <param name="bits">The bits.</param>
        /// <param name="min">The minimum.</param>
        /// <param name="max">The maximum.</param>
        /// <returns></returns>
        /// <exception cref="ArgumentOutOfRangeException">
        /// bits - bits must be greater than 0
        /// or
        /// max - max value must be greater than min value
        /// </exception>
        public static int[] GetIntArray(int bits, int min = int.MinValue, int max = int.MaxValue)
        {
            if (bits < 1) throw new ArgumentOutOfRangeException(nameof(bits), "bits must be greater than 0");

            if (min > max) throw new ArgumentOutOfRangeException(nameof(max), "max value must be greater than min value");

            byte[] b = new byte[4];

#if NET35
            new RNGCryptoServiceProvider().GetBytes(b);
#else
            using (RNGCryptoServiceProvider provider = new RNGCryptoServiceProvider())
            {
                provider.GetBytes(b);
            }
#endif

            Random random = new Random(BitConverter.ToInt32(b, 0));

            int[] val = new int[bits];

            for (int i = 0; i < bits; i++)
            {
                val[i] = random.Next(min, max);
            }

            return val;
        }

        /// <summary>
        /// Gets the string.
        /// </summary>
        /// <param name="bits">The bits.</param>
        /// <returns></returns>
        public static string GetString(int bits = 8)
        {
            int[] indexs = GetIntArray(bits, 0, StringCharactersLength);

            StringBuilder builder = new StringBuilder();

            for (int i = 0; i < bits; i++)
            {
                builder.Append(StringCharacters.Substring(indexs[i], 1));
            }

            return builder.ToString();
        }
    }
}
