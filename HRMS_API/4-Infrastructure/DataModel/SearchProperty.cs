using System;

namespace Phonix.Infrastructure.DataModel
{
    public class SearchProperty
    {
        public string ColumnName { get; set; }

        public string DatabaseColumnName { get; set; }

        public Type DataType { get; set; }

        public SearchProperty(string columnName, string condition, Type dataType)
        {
            ColumnName = columnName;
            DatabaseColumnName = condition;
            DataType = dataType;
        }
    }
}
