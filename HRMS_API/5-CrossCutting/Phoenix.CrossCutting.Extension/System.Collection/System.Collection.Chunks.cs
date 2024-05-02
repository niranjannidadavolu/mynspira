using System.Collections.Generic;
using System.Linq;

namespace Phoenix.CrossCutting.Extension.System.Collection
{
    public static partial class Extensions
    {
        public static List<List<T>> SplitData<T>(this List<T> collection, int size)
        {
            List<List<T>> chunks = new();
            int chunkCount = collection.Count / size;

            if (collection.Count % size > 0)
            {
                chunkCount++;
            }

            for (int i = 0; i < chunkCount; i++)
            {
                chunks.Add(collection.Skip(i * size).Take(size).ToList());
            }

            return chunks;
        }
    }
}
