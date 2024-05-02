namespace Phoenix.CrossCutting.Extension.System.String.System.String
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Retrieves the system&#39;s reference to the specified .
        /// </summary>
        /// <param name="str">A string to search for in the intern pool.</param>
        /// <returns>
        ///     The system&#39;s reference to , if it is interned; otherwise, a new reference to a string with the value of .
        /// </returns>
        public static string Intern(this string str)
        {
            return string.Intern(str);
        }
    }
}