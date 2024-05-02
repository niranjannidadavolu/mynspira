using System;
using System.Data;

namespace Phoenix.CrossCutting.Extension.System.Int16
{
    public static partial class Extensions
    {
        public static SqlDbType SqlSystemTypeToSqlDbType(this short @this)
        {
            return @this switch
            {
                // 34 | "image" | SqlDbType.Image
                34 => SqlDbType.Image,
                // 35 | "text" | SqlDbType.Text
                35 => SqlDbType.Text,
                // 36 | "uniqueidentifier" | SqlDbType.UniqueIdentifier
                36 => SqlDbType.UniqueIdentifier,
                // 40 | "date" | SqlDbType.Date
                40 => SqlDbType.Date,
                // 41 | "time" | SqlDbType.Time
                41 => SqlDbType.Time,
                // 42 | "datetime2" | SqlDbType.DateTime2
                42 => SqlDbType.DateTime2,
                // 43 | "datetimeoffset" | SqlDbType.DateTimeOffset
                43 => SqlDbType.DateTimeOffset,
                // 48 | "tinyint" | SqlDbType.TinyInt
                48 => SqlDbType.TinyInt,
                // 52 | "smallint" | SqlDbType.SmallInt
                52 => SqlDbType.SmallInt,
                // 56 | "int" | SqlDbType.Int
                56 => SqlDbType.Int,
                // 58 | "smalldatetime" | SqlDbType.SmallDateTime
                58 => SqlDbType.SmallDateTime,
                // 59 | "real" | SqlDbType.Real
                59 => SqlDbType.Real,
                // 60 | "money" | SqlDbType.Money
                60 => SqlDbType.Money,
                // 61 | "datetime" | SqlDbType.DateTime
                61 => SqlDbType.DateTime,
                // 62 | "float" | SqlDbType.Float
                62 => SqlDbType.Float,
                // 98 | "sql_variant" | SqlDbType.Variant
                98 => SqlDbType.Variant,
                // 99 | "ntext" | SqlDbType.NText
                99 => SqlDbType.NText,
                // 104 | "bit" | SqlDbType.Bit
                104 => SqlDbType.Bit,
                // 106 | "decimal" | SqlDbType.Decimal
                106 => SqlDbType.Decimal,
                // 108 | "numeric" | SqlDbType.Decimal
                108 => SqlDbType.Decimal,
                // 122 | "smallmoney" | SqlDbType.SmallMoney
                122 => SqlDbType.SmallMoney,
                // 127 | "bigint" | SqlDbType.BigInt
                127 => SqlDbType.BigInt,
                // 165 | "varbinary" | SqlDbType.VarBinary
                165 => SqlDbType.VarBinary,
                // 167 | "varchar" | SqlDbType.VarChar
                167 => SqlDbType.VarChar,
                // 173 | "binary" | SqlDbType.Binary
                173 => SqlDbType.Binary,
                // 175 | "char" | SqlDbType.Char
                175 => SqlDbType.Char,
                // 189 | "timestamp" | SqlDbType.Timestamp
                189 => SqlDbType.Timestamp,
                // 231 | "nvarchar", "sysname" | SqlDbType.NVarChar
                231 => SqlDbType.NVarChar,
                // 239 | "nchar" | SqlDbType.NChar
                239 => SqlDbType.NChar,
                // 240 | "hierarchyid", "geometry", "geography" | SqlDbType.Udt
                240 => SqlDbType.Udt,
                // 241 | "xml" | SqlDbType.Xml
                241 => SqlDbType.Xml,
                _ => throw new Exception(string.Format("Unsupported Type: {0}. Please let us know about this type and we will support it: sales@zzzprojects.com", @this)),
            };
        }
    }
}