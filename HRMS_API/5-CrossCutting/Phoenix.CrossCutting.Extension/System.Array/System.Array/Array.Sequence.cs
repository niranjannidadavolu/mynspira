using System.Linq;

namespace Phoenix.CrossCutting.Extension.System.Array.System.Array
{
    public static partial class Extensions
    {
        public static bool IsConsecutive(this int[] ints)
        {
            // if (!ints.Any())
            //    return true; //Is empty consecutive?
            // I think I prefer exception for empty list but I guess it depends
            int start = ints.First();
            return !ints.Where((x, i) => x != i + start).Any();
        }
    }
}
