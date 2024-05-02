using System;
using System.Data;

namespace Phoenix.CrossCutting.Extension.System.String
{
    public static partial class Extensions
    {
        public static SqlDbType SqlTypeNameToSqlDbType(this string @this)
        {
            return @this.ToLower() switch
            {
                // 34 | "image" | SqlDbType.Image
                "image" => SqlDbType.Image,
                // 35 | "text" | SqlDbType.Text
                "text" => SqlDbType.Text,
                // 36 | "uniqueidentifier" | SqlDbType.UniqueIdentifier
                "uniqueidentifier" => SqlDbType.UniqueIdentifier,
                // 40 | "date" | SqlDbType.Date
                "date" => SqlDbType.Date,
                // 41 | "time" | SqlDbType.Time
                "time" => SqlDbType.Time,
                // 42 | "datetime2" | SqlDbType.DateTime2
                "datetime2" => SqlDbType.DateTime2,
                // 43 | "datetimeoffset" | SqlDbType.DateTimeOffset
                "datetimeoffset" => SqlDbType.DateTimeOffset,
                // 48 | "tinyint" | SqlDbType.TinyInt
                "tinyint" => SqlDbType.TinyInt,
                // 52 | "smallint" | SqlDbType.SmallInt
                "smallint" => SqlDbType.SmallInt,
                // 56 | "int" | SqlDbType.Int
                "int" => SqlDbType.Int,
                // 58 | "smalldatetime" | SqlDbType.SmallDateTime
                "smalldatetime" => SqlDbType.SmallDateTime,
                // 59 | "real" | SqlDbType.Real
                "real" => SqlDbType.Real,
                // 60 | "money" | SqlDbType.Money
                "money" => SqlDbType.Money,
                // 61 | "datetime" | SqlDbType.DateTime
                "datetime" => SqlDbType.DateTime,
                // 62 | "float" | SqlDbType.Float
                "float" => SqlDbType.Float,
                // 98 | "sql_variant" | SqlDbType.Variant
                "sql_variant" => SqlDbType.Variant,
                // 99 | "ntext" | SqlDbType.NText
                "ntext" => SqlDbType.NText,
                // 104 | "bit" | SqlDbType.Bit
                "bit" => SqlDbType.Bit,
                // 106 | "decimal" | SqlDbType.Decimal
                "decimal" => SqlDbType.Decimal,
                // 108 | "numeric" | SqlDbType.Decimal
                "numeric" => SqlDbType.Decimal,
                // 122 | "smallmoney" | SqlDbType.SmallMoney
                "smallmoney" => SqlDbType.SmallMoney,
                // 127 | "bigint" | SqlDbType.BigInt
                "bigint" => SqlDbType.BigInt,
                // 165 | "varbinary" | SqlDbType.VarBinary
                "varbinary" => SqlDbType.VarBinary,
                // 167 | "varchar" | SqlDbType.VarChar
                "varchar" => SqlDbType.VarChar,
                // 173 | "binary" | SqlDbType.Binary
                "binary" => SqlDbType.Binary,
                // 175 | "char" | SqlDbType.Char
                "char" => SqlDbType.Char,
                // 189 | "timestamp" | SqlDbType.Timestamp
                "timestamp" => SqlDbType.Timestamp,
                // 231 | "nvarchar", "sysname" | SqlDbType.NVarChar
                "nvarchar" => SqlDbType.NVarChar,
                // 231 | "nvarchar", "sysname" | SqlDbType.NVarChar
                "sysname" => SqlDbType.NVarChar,
                // 239 | "nchar" | SqlDbType.NChar
                "nchar" => SqlDbType.NChar,
                // 240 | "hierarchyid", "geometry", "geography" | SqlDbType.Udt
                "hierarchyid" => SqlDbType.Udt,
                // 240 | "hierarchyid", "geometry", "geography" | SqlDbType.Udt
                "geometry" => SqlDbType.Udt,
                // 240 | "hierarchyid", "geometry", "geography" | SqlDbType.Udt
                "geography" => SqlDbType.Udt,
                // 241 | "xml" | SqlDbType.Xml
                "xml" => SqlDbType.Xml,
                _ => throw new Exception(string.Format("Unsupported Type: {0}. Please let us know about this type and we will support it: sales@zzzprojects.com", @this)),
            };
        }
    }
}