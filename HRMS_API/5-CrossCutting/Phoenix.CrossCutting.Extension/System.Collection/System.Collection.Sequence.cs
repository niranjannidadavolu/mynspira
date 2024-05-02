using System.Collections.Generic;
using System.Linq;

namespace Phoenix.CrossCutting.Extension.System.Collection
{
    public static partial class Extensions
    {
        public static bool IsConsecutive(this List<int> ints)
        {
            // if (!ints.Any())
            //    return true; //Is empty consecutive?
            // I think I prefer exception for empty list but I guess it depends
            if (ints.Count > 0)
            {
                int start = ints.First();
                return !ints.Where((x, i) => x != i + start).Any();
            }
            else
                return false;
        }
    }
}
