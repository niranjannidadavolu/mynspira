namespace Phoenix.CrossCutting.Extension.System.Text.StringBuilder.Extract
{
    public static partial class Extensions
    {
        /// <summary>A StringBuilder extension method that extracts the string described by @this.</summary>
        /// <param name="this">The @this to act on.</param>
        /// <returns>The extracted string.</returns>
        public static global::System.Text.StringBuilder ExtractString(this global::System.Text.StringBuilder @this)
        {
            return @this.ExtractString(0);
        }

        /// <summary>A StringBuilder extension method that extracts the string described by @this.</summary>
        /// <param name="this">The @this to act on.</param>
        /// <param name="endIndex">[out] The end index.</param>
        /// <returns>The extracted string.</returns>
        public static global::System.Text.StringBuilder ExtractString(this global::System.Text.StringBuilder @this, out int endIndex)
        {
            return @this.ExtractString(0, out endIndex);
        }

        /// <summary>A StringBuilder extension method that extracts the string described by @this.</summary>
        /// <param name="this">The @this to act on.</param>
        /// <param name="startIndex">The start index.</param>
        /// <returns>The extracted string.</returns>
        public static global::System.Text.StringBuilder ExtractString(this global::System.Text.StringBuilder @this, int startIndex)
        {
            return @this.ExtractString(startIndex, out int endIndex);
        }

        /// <summary>A StringBuilder extension method that extracts the string described by @this.</summary>
        /// <param name="this">The @this to act on.</param>
        /// <param name="startIndex">The start index.</param>
        /// <param name="endIndex">[out] The end index.</param>
        /// <returns>The extracted string.</returns>
        public static global::System.Text.StringBuilder ExtractString(this global::System.Text.StringBuilder @this, int startIndex, out int endIndex)
        {
            if (@this.Length > startIndex + 1)
            {
                char ch1 = @this[startIndex];
                char ch2 = @this[startIndex + 1];

                if (ch1 == '@' && ch2 == '"')
                {
                    // @"my string"

                    return @this.ExtractStringArobasDoubleQuote(startIndex, out endIndex);
                }

                if (ch1 == '@' && ch2 == '\'')
                {
                    // WARNING: This is not a valid string, however single quote is often used to make it more readable in text templating
                    // @'my string'

                    return @this.ExtractStringArobasSingleQuote(startIndex, out endIndex);
                }

                if (ch1 == '"')
                {
                    // "my string"

                    return @this.ExtractStringDoubleQuote(startIndex, out endIndex);
                }

                if (ch1 == '\'')
                {
                    // WARNING: This is not a valid string, however single quote is often used to make it more readable in text templating
                    // 'my string'

                    return @this.ExtractStringSingleQuote(startIndex, out endIndex);
                }
            }

            endIndex = -1;
            return null;
        }
    }
}