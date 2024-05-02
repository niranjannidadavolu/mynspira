namespace Phoenix.CrossCutting.Extension.System.Text.StringBuilder.Extract
{
    public static partial class Extensions
    {
        /// <summary>
        ///     A StringBuilder extension method that extracts the comment single line described by
        ///     @this.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <returns>The extracted comment single line.</returns>
        public static global::System.Text.StringBuilder ExtractCommentSingleLine(this global::System.Text.StringBuilder @this)
        {
            return @this.ExtractCommentSingleLine(0);
        }

        /// <summary>
        ///     A StringBuilder extension method that extracts the comment single line described by
        ///     @this.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <param name="endIndex">[out] The end index.</param>
        /// <returns>The extracted comment single line.</returns>
        public static global::System.Text.StringBuilder ExtractCommentSingleLine(this global::System.Text.StringBuilder @this, out int endIndex)
        {
            return @this.ExtractCommentSingleLine(0, out endIndex);
        }

        /// <summary>
        ///     A StringBuilder extension method that extracts the comment single line described by
        ///     @this.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <param name="startIndex">The start index.</param>
        /// <returns>The extracted comment single line.</returns>
        public static global::System.Text.StringBuilder ExtractCommentSingleLine(this global::System.Text.StringBuilder @this, int startIndex)
        {
            return @this.ExtractCommentSingleLine(startIndex, out int endIndex);
        }

        /// <summary>
        ///     A StringBuilder extension method that extracts the comment single line described by
        ///     @this.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <param name="startIndex">The start index.</param>
        /// <param name="endIndex">[out] The end index.</param>
        /// <returns>The extracted comment single line.</returns>
        public static global::System.Text.StringBuilder ExtractCommentSingleLine(this global::System.Text.StringBuilder @this, int startIndex, out int endIndex)
        {
            global::System.Text.StringBuilder sb = new();

            if (@this.Length > startIndex + 1)
            {
                char ch1 = @this[startIndex];
                char ch2 = @this[startIndex + 1];

                if (ch1 == '/' && ch2 == '/')
                {
                    // Single line comment

                    sb.Append(ch1);
                    sb.Append(ch2);
                    int pos = startIndex + 2;

                    while (pos < @this.Length)
                    {
                        char ch = @this[pos];
                        pos++;

                        if (ch == '\r' && pos < @this.Length && @this[pos] == '\n')
                        {
                            endIndex = pos - 1;
                            return sb;
                        }

                        sb.Append(ch);
                    }

                    endIndex = pos;
                    return sb;
                }
            }

            endIndex = -1;
            return null;
        }
    }
}