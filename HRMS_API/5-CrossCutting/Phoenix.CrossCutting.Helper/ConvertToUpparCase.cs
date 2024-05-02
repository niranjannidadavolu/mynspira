using Phoenix.CrossCutting.Extension.TArray.System.Array;

namespace Phoenix.CrossCutting.Helper
{
    public static class ConvertToUpparCase
    {
        public static  void StringToUpparCase<t>(t classObj)
        {
            classObj.GetType().GetProperties().ForEach(p =>
            {
                if (p.PropertyType == typeof(string) && p.GetValue(classObj) != null)
                    p.SetValue(classObj, p.GetValue(classObj).ToString().ToUpper());
            });
        }
    }
}
