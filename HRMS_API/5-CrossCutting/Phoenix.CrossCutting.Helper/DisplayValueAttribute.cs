using System;

namespace Phoenix.CrossCutting.Helper
{
    [AttributeUsage(AttributeTargets.Field)]
    public class DisplayValueAttribute : Attribute
    {
        public string StringifiedValue { get; set; }

        public DisplayValueAttribute(string strValue)
        {
            StringifiedValue = strValue;
        }
    }
}
