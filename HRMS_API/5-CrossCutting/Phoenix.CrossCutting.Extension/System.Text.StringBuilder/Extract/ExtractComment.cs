namespace Phoenix.CrossCutting.Extension.System.Text.StringBuilder.Extract
{
    public static partial class Extensions
    {
        /// <summary>A StringBuilder extension method that extracts the comment described by @this.</summary>
        /// <param name="this">The @this to act on.</param>
        /// <returns>The extracted comment.</returns>
        public static global::System.Text.StringBuilder ExtractComment(this global::System.Text.StringBuilder @this)
        {
            return @this.ExtractComment(0);
        }

        /// <summary>A StringBuilder extension method that extracts the comment described by @this.</summary>
        /// <param name="this">The @this to act on.</param>
        /// <param name="endIndex">[out] The end index.</param>
        /// <returns>The extracted comment.</returns>
        public static global::System.Text.StringBuilder ExtractComment(this global::System.Text.StringBuilder @this, out int endIndex)
        {
            return @this.ExtractComment(0, out endIndex);
        }

        /// <summary>A StringBuilder extension method that extracts the comment described by @this.</summary>
        /// <param name="this">The @this to act on.</param>
        /// <param name="startIndex">The start index.</param>
        /// <returns>The extracted comment.</returns>
        public static global::System.Text.StringBuilder ExtractComment(this global::System.Text.StringBuilder @this, int startIndex)
        {
            return @this.ExtractComment(startIndex, out int endIndex);
        }

        /// <summary>A StringBuilder extension method that extracts the comment described by @this.</summary>
        /// <param name="this">The @this to act on.</param>
        /// <param name="startIndex">The start index.</param>
        /// <param name="endIndex">[out] The end index.</param>
        /// <returns>The extracted comment.</returns>
        public static global::System.Text.StringBuilder ExtractComment(this global::System.Text.StringBuilder @this, int startIndex, out int endIndex)
        {
            if (@this.Length > startIndex + 1)
            {
                char ch1 = @this[startIndex];
                char ch2 = @this[startIndex + 1];

                if (ch1 == '/' && ch2 == '/')
                {
                    // Single line comment

                    return @this.ExtractCommentSingleLine(startIndex, out endIndex);
                }

                if (ch1 == '/' && ch2 == '*')
                {
                    /*
                 * Multi-line comment
                 */

                    return @this.ExtractCommentMultiLine(startIndex, out endIndex);
                }
            }

            endIndex = -1;
            return null;
        }
    }
}