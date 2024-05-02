using System.Collections.Generic;

namespace Phoenix.CrossCutting.Extension.System.String
{
    public static partial class Extensions
    {
        /// <summary>
        ///     A string extension method that converts the @this to a byte array.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <returns>@this as a byte[].</returns>
        public static List<long> ToLong(this string @this)
        {
            List<long> longList = null;
            if (!@this.IsNullOrEmpty())
            {
                string[] listValues = @this.Split(",");
                longList = new List<long>();
                foreach (string item in listValues)
                {
                    if (long.TryParse(item, out long longValue))
                    {
                        longList.Add(longValue);
                    }
                }
            }

            return longList;
        }
    }
}