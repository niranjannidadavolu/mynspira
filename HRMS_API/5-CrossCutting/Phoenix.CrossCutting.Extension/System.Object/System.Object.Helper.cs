namespace Phoenix.CrossCutting.Extension.System.Object
{
    public static partial class Extensions
    {
        public static object GetPropertyValue(this object t, string propName)
        {
            return t.GetType().GetProperty(propName)?.GetValue(t, null);
        }
    }
}
