using Newtonsoft.Json;

namespace Phoenix.CrossCutting.Extension.System.Object.Cloning
{
    public static partial class Extensions
    {
        /// <summary>
        ///     A T extension method that makes a deep copy of '@this' object.
        /// </summary>
        /// <typeparam name="T">Generic type parameter.</typeparam>
        /// <param name="this">The @this to act on.</param>
        /// <returns>the copied object.</returns>
        //public static T DeepClone<T>(this T @this)
        //{
        //    IFormatter formatter = new BinaryFormatter();
        //    using (MemoryStream stream = new MemoryStream())
        //    {
        //        formatter.Serialize(stream, @this);
        //        stream.Seek(0, SeekOrigin.Begin);
        //        return (T)formatter.Deserialize(stream);
        //    }
        //}
        public static T DeepClone<T>(this T @this)
        {
            var serialized = JsonConvert.SerializeObject(@this);
            return JsonConvert.DeserializeObject<T>(serialized);
        }
    }
}