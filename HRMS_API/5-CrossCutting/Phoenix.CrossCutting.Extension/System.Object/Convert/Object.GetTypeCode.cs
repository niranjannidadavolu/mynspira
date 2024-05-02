using System;

namespace Phoenix.CrossCutting.Extension.System.Object.Convert
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Returns the  for the specified object.
        /// </summary>
        /// <param name="value">An object that implements the  interface.</param>
        /// <returns>The  for , or  if  is null.</returns>
        public static TypeCode GetTypeCode(this object value)
        {
            return global::System.Convert.GetTypeCode(value);
        }
    }
}