using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;

namespace Phoenix.CrossCutting.Utils.Extensions
{
    public static class PropertyInfoExtensions
    {
        public static IDictionary ToDictionary(this IEnumerable<PropertyInfo> properties)
        {
            return properties?
                .Where(property => !string.IsNullOrWhiteSpace(property.GetValue(null) as string))
                .ToDictionary(property => property.Name.CamelCase(), property => property.GetValue(null) as string);
        }
    }
}
