using System;
using System.Text;

namespace Phoenix.CrossCutting.Extension.System.String._ExtractValueType
{
    public static partial class Extensions
    {
        /// <summary>
        ///     A string extension method that extracts the Int16 from the string.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <returns>The extracted Int16.</returns>
        public static short ExtractInt16(this string @this)
        {
            StringBuilder sb = new();
            for (int i = 0; i < @this.Length; i++)
            {
                if (char.IsDigit(@this[i]))
                {
                    if (sb.Length == 0 && i > 0 && @this[i - 1] == '-')
                    {
                        sb.Append('-');
                    }

                    sb.Append(@this[i]);
                }
            }

            return Convert.ToInt16(sb.ToString());
        }
    }
}