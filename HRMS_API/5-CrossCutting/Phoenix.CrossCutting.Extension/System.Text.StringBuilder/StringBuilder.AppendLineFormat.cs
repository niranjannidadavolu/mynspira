using System.Collections.Generic;

namespace Phoenix.CrossCutting.Extension.System.Text.StringBuilder
{
    public static partial class Extensions
    {
        /// <summary>
        ///     A StringBuilder extension method that appends a line format.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <param name="format">Describes the format to use.</param>
        /// <param name="args">A variable-length parameters list containing arguments.</param>
        public static global::System.Text.StringBuilder AppendLineFormat(this global::System.Text.StringBuilder @this, string format, params object[] args)
        {
            @this.AppendLine(string.Format(format, args));

            return @this;
        }

        /// <summary>
        ///     A StringBuilder extension method that appends a line format.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <param name="format">Describes the format to use.</param>
        /// <param name="args">A variable-length parameters list containing arguments.</param>
        public static global::System.Text.StringBuilder AppendLineFormat(this global::System.Text.StringBuilder @this, string format, List<IEnumerable<object>> args)
        {
            @this.AppendLine(string.Format(format, args));

            return @this;
        }
    }
}