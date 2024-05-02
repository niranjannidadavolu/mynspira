using System;

namespace Phoenix.CrossCutting.Extension.System.Text.StringBuilder.Extract
{
    public static partial class Extensions
    {
        /// <summary>A StringBuilder extension method that extracts the character described by @this.</summary>
        /// <param name="this">The @this to act on.</param>
        /// <returns>The extracted character.</returns>
        public static char ExtractChar(this global::System.Text.StringBuilder @this)
        {
            return @this.ExtractChar(0);
        }

        /// <summary>A StringBuilder extension method that extracts the character described by @this.</summary>
        /// <param name="this">The @this to act on.</param>
        /// <param name="endIndex">[out] The end index.</param>
        /// <returns>The extracted character.</returns>
        public static char ExtractChar(this global::System.Text.StringBuilder @this, out int endIndex)
        {
            return @this.ExtractChar(0, out endIndex);
        }

        /// <summary>A StringBuilder extension method that extracts the character described by @this.</summary>
        /// <param name="this">The @this to act on.</param>
        /// <param name="startIndex">The start index.</param>
        /// <returns>The extracted character.</returns>
        public static char ExtractChar(this global::System.Text.StringBuilder @this, int startIndex)
        {
            return @this.ExtractChar(startIndex, out int endIndex);
        }

        /// <summary>A StringBuilder extension method that extracts the character described by @this.</summary>
        /// <exception cref="Exception">Thrown when an exception error condition occurs.</exception>
        /// <param name="this">The @this to act on.</param>
        /// <param name="startIndex">The start index.</param>
        /// <param name="endIndex">[out] The end index.</param>
        /// <returns>The extracted character.</returns>
        public static char ExtractChar(this global::System.Text.StringBuilder @this, int startIndex, out int endIndex)
        {
            if (@this.Length > startIndex + 1)
            {
                char ch1 = @this[startIndex];
                char ch2 = @this[startIndex + 1];
                char ch3 = @this[startIndex + 2];

                if (ch1 == '\'' && ch3 == '\'')
                {
                    endIndex = startIndex + 2;
                    return ch2;
                }
            }

            throw new Exception("Invalid char at position: " + startIndex);
        }
    }
}