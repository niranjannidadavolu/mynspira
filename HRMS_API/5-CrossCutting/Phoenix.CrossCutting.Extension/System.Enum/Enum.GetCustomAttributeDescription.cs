using System.Linq;

namespace Phoenix.CrossCutting.Extension.System.Enum
{
    public static partial class Extensions
    {
        /// <summary>
        ///     An object extension method that gets description attribute.
        /// </summary>
        /// <param name="value">The value to act on.</param>
        /// <returns>The description attribute.</returns>
        public static string GetCustomAttributeDescription(this global::System.Enum value)
        {
            var type = value.GetType();
            var name = global::System.Enum.GetName(type, value);
            var attribute1 = type.GetField(name).CustomAttributes.FirstOrDefault();
            string description = attribute1.ConstructorArguments.FirstOrDefault().Value.ToString();
            return description;
        }
    }
}