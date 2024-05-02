using System;
using System.Linq;
using System.Collections.Generic;
using System.Text;

using System;
using System.Linq;
namespace Phoenix.CrossCutting.Extension.System.String
{
    public static partial class Extensions
    {
        /// <summary>
        ///     A string extension method that return string after removing the non printable characters.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <returns>null if the value is empty, otherwise the value.</returns>
        public static string RemoveAllNonPrintableCharacters(string target)
        {
            return Regex.Replace(target, @"\p{C}+", string.Empty);
        }
    }
}
