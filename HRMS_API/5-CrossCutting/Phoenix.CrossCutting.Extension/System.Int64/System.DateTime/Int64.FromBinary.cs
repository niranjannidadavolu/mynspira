namespace Phoenix.CrossCutting.Extension.System.Int64.System.DateTime
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Deserializes a 64-bit binary value and recreates an original serialized  object.
        /// </summary>
        /// <param name="dateData">
        ///     A 64-bit signed integer that encodes the  property in a 2-bit field and the  property in
        ///     a 62-bit field.
        /// </param>
        /// <returns>An object that is equivalent to the  object that was serialized by the  method.</returns>
        public static global::System.DateTime FromBinary(this long dateData)
        {
            return global::System.DateTime.FromBinary(dateData);
        }
    }
}