using System.Xml;

namespace Phoenix.CrossCutting.Extension.System.String
{
    public static partial class Extensions
    {
        /// <summary>
        ///     A string extension method that converts the @this to an XmlDocument.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <returns>@this as an XmlDocument.</returns>
        public static XmlDocument ToXmlDocument(this string @this)
        {
            XmlDocument doc = new();
            doc.LoadXml(@this);
            return doc;
        }
    }
}