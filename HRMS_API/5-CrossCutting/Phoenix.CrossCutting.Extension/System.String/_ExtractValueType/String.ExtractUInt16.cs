using System;
using System.Text;

namespace Phoenix.CrossCutting.Extension.System.String._ExtractValueType
{
    public static partial class Extensions
    {
        /// <summary>
        ///     A string extension method that extracts the UInt16 from the string.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <returns>The extracted UInt16.</returns>
        public static ushort ExtractUInt16(this string @this)
        {
            StringBuilder sb = new();
            for (int i = 0; i < @this.Length; i++)
            {
                if (char.IsDigit(@this[i]))
                {
                    sb.Append(@this[i]);
                }
            }

            return Convert.ToUInt16(sb.ToString());
        }
    }
}