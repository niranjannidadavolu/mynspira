namespace Phoenix.CrossCutting.Extension.System.Text.StringBuilder.Extract
{
    public static partial class Extensions
    {
        /// <summary>A StringBuilder extension method that extracts the hexadecimal described by @this.</summary>
        /// <param name="this">The @this to act on.</param>
        /// <returns>The extracted hexadecimal.</returns>
        public static global::System.Text.StringBuilder ExtractHexadecimal(this global::System.Text.StringBuilder @this)
        {
            return @this.ExtractHexadecimal(0);
        }

        /// <summary>A StringBuilder extension method that extracts the hexadecimal described by @this.</summary>
        /// <param name="this">The @this to act on.</param>
        /// <param name="endIndex">[out] The end index.</param>
        /// <returns>The extracted hexadecimal.</returns>
        public static global::System.Text.StringBuilder ExtractHexadecimal(this global::System.Text.StringBuilder @this, out int endIndex)
        {
            return @this.ExtractHexadecimal(0, out endIndex);
        }

        /// <summary>A StringBuilder extension method that extracts the hexadecimal described by @this.</summary>
        /// <param name="this">The @this to act on.</param>
        /// <param name="startIndex">The start index.</param>
        /// <returns>The extracted hexadecimal.</returns>
        public static global::System.Text.StringBuilder ExtractHexadecimal(this global::System.Text.StringBuilder @this, int startIndex)
        {
            return @this.ExtractHexadecimal(startIndex, out int endIndex);
        }

        /// <summary>A StringBuilder extension method that extracts the hexadecimal described by @this.</summary>
        /// <param name="this">The @this to act on.</param>
        /// <param name="startIndex">The start index.</param>
        /// <param name="endIndex">[out] The end index.</param>
        /// <returns>The extracted hexadecimal.</returns>
        public static global::System.Text.StringBuilder ExtractHexadecimal(this global::System.Text.StringBuilder @this, int startIndex, out int endIndex)
        {
            // WARNING: This method support all kind of suffix for .NET Runtime Compiler
            // An operator can be any sequence of supported operator character

            if (startIndex + 1 < @this.Length && @this[startIndex] == '0'
                && (@this[startIndex + 1] == 'x' || @this[startIndex + 1] == 'X'))
            {
                global::System.Text.StringBuilder sb = new();

                bool hasNumber = false;
                bool hasSuffix = false;

                sb.Append(@this[startIndex]);
                sb.Append(@this[startIndex + 1]);

                int pos = startIndex + 2;

                while (pos < @this.Length)
                {
                    char ch = @this[pos];
                    pos++;

                    if (((ch >= '0' && ch <= '9')
                         || (ch >= 'a' && ch <= 'f')
                         || (ch >= 'A' && ch <= 'F'))
                        && !hasSuffix)
                    {
                        hasNumber = true;
                        sb.Append(ch);
                    }
                    else if ((ch >= 'a' && ch <= 'z') || (ch >= 'A' && ch <= 'Z'))
                    {
                        hasSuffix = true;
                        sb.Append(ch);
                    }
                    else
                    {
                        pos -= 2;
                        break;
                    }
                }

                if (hasNumber)
                {
                    endIndex = pos;
                    return sb;
                }
            }

            endIndex = -1;
            return null;
        }
    }
}