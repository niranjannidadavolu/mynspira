namespace Phoenix.CrossCutting.Extension.System.Text.StringBuilder.Extract
{
    public static partial class Extensions
    {
        /// <summary>A StringBuilder extension method that extracts the keyword described by @this.</summary>
        /// <param name="this">The @this to act on.</param>
        /// <returns>The extracted keyword.</returns>
        public static global::System.Text.StringBuilder ExtractKeyword(this global::System.Text.StringBuilder @this)
        {
            return @this.ExtractKeyword(0);
        }

        /// <summary>A StringBuilder extension method that extracts the keyword described by @this.</summary>
        /// <param name="this">The @this to act on.</param>
        /// <param name="endIndex">[out] The end index.</param>
        /// <returns>The extracted keyword.</returns>
        public static global::System.Text.StringBuilder ExtractKeyword(this global::System.Text.StringBuilder @this, out int endIndex)
        {
            return @this.ExtractKeyword(0, out endIndex);
        }

        /// <summary>A StringBuilder extension method that extracts the keyword described by @this.</summary>
        /// <param name="this">The @this to act on.</param>
        /// <param name="startIndex">The start index.</param>
        /// <returns>The extracted keyword.</returns>
        public static global::System.Text.StringBuilder ExtractKeyword(this global::System.Text.StringBuilder @this, int startIndex)
        {
            return @this.ExtractKeyword(startIndex, out int endIndex);
        }

        /// <summary>A StringBuilder extension method that extracts the keyword described by @this.</summary>
        /// <param name="this">The @this to act on.</param>
        /// <param name="startIndex">The start index.</param>
        /// <param name="endIndex">[out] The end index.</param>
        /// <returns>The extracted keyword.</returns>
        public static global::System.Text.StringBuilder ExtractKeyword(this global::System.Text.StringBuilder @this, int startIndex, out int endIndex)
        {
            // WARNING: This method support custom operator for .NET Runtime Compiler
            // An operator can be any sequence of supported operator character
            global::System.Text.StringBuilder sb = new();

            int pos = startIndex;
            bool hasCharacter = false;

            while (pos < @this.Length)
            {
                char ch = @this[pos];
                pos++;

                if ((ch >= 'a' && ch <= 'z') || (ch >= 'A' && ch <= 'Z'))
                {
                    hasCharacter = true;
                    sb.Append(ch);
                }
                else if (ch == '@')
                {
                    sb.Append(ch);
                }
                else if (ch >= '0' && ch <= '9' && hasCharacter)
                {
                    sb.Append(ch);
                }
                else
                {
                    pos -= 2;
                    break;
                }
            }

            if (hasCharacter)
            {
                endIndex = pos;
                return sb;
            }

            endIndex = -1;
            return null;
        }
    }
}