namespace Phoenix.CrossCutting.Extension.System.Object.ValueComparison
{
    public static partial class Extensions
    {
        /// <summary>
        ///     Determines whether the specified  instances are the same instance.
        /// </summary>
        /// <param name="objA">The first object to compare.</param>
        /// <param name="objB">The second object  to compare.</param>
        /// <returns>true if  is the same instance as  or if both are null; otherwise, false.</returns>
        public static bool ReferenceEquals(this object objA, object objB)
        {
            return object.ReferenceEquals(objA, objB);
        }
    }
}