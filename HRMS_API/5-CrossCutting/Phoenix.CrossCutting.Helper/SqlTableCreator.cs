﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace Phoenix.CrossCutting.Helper
{
    // Copyright (c) 2012-2013, Riyad Parvez
    // All rights reserved.
    //
    // Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
    //
    // 1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
    //
    // 2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
    //
    // 3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
    //
    // THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

    public class SqlTableCreator
    {
        private SqlConnection _connection;

        public SqlConnection Connection
        {
            get { return this._connection; }
            set { this._connection = value; }
        }

        private SqlTransaction _transaction;

        public SqlTransaction Transaction
        {
            get { return this._transaction; }
            set { this._transaction = value; }
        }

        private string _tableName;

        public string DestinationTableName
        {
            get { return this._tableName; }
            set { this._tableName = value; }
        }

        public SqlTableCreator() { }

        public SqlTableCreator(SqlConnection connection)
            : this(connection, null) { }

        public SqlTableCreator(SqlConnection connection, SqlTransaction transaction)
        {
            this._connection = connection;
            this._transaction = transaction;
        }

        public object Create(DataTable schema)
        {
            return this.Create(schema, null);
        }

        public object Create(DataTable schema, int numKeys)
        {
            int[] primaryKeys = new int[numKeys];
            for (int i = 0; i < numKeys; i++)
            {
                primaryKeys[i] = i;
            }

            return this.Create(schema, primaryKeys);
        }

        public object Create(DataTable schema, int[] primaryKeys)
        {
            primaryKeys = new int[0];
            string sql = GetCreateSQL(this._tableName, schema, primaryKeys);

            SqlCommand cmd;
            if (this._transaction != null && this._transaction.Connection != null)
            {
                cmd = new SqlCommand(sql, this._connection, this._transaction);
            }
            else
            {
                cmd = new SqlCommand(sql, this._connection);
            }

            return cmd.ExecuteNonQuery();
        }

        public object CreateFromDataTable(DataTable table, string schemaName, string tableName)
        {
            if (string.IsNullOrEmpty(tableName))
            {
                tableName = this._tableName;
            }

            string sql = GetCreateFromDataTableSQL(schemaName, tableName, table);

            SqlCommand cmd;
            if (this._connection.State == ConnectionState.Open)
            {
                this._connection.Close();
                this._connection.Open();
            }
            else
            {
                this._connection.Open();
            }

            if (this._transaction != null && this._transaction.Connection != null)
            {
                cmd = new SqlCommand(sql, this._connection, this._transaction);
            }
            else
            {
                cmd = new SqlCommand(sql, this._connection);
            }

            if (sql != string.Empty)
            {
                return cmd.ExecuteNonQuery();
            }

            this._connection.Close();
            return null;
        }

        public void CopyDataToTable(DataTable table, string schemaName, string tableName)
        {
            if (this._connection.State == ConnectionState.Open)
            {
                this._connection.Close();
                this._connection.Open();
            }
            else
            {
                this._connection.Open();
            }

            SqlTableCopier copier = new(this._connection, this._transaction, this._tableName);
            copier.CopyData(table, schemaName, tableName);
            this._connection.Close();
        }

        public static string GetCreateSQL(string tableName, DataTable schema, int[] primaryKeys)
        {
            primaryKeys = new int[0];
            string sql = "CREATE TABLE " + tableName + " (\n";

            // columns
            foreach (DataRow column in schema.Rows)
            {
                if (!(schema.Columns.Contains("IsHidden") && (bool)column["IsHidden"]))
                {
                    sql += column["ColumnName"].ToString() + " " + SQLGetType(column) + ",\n";
                }
            }

            sql = sql.TrimEnd(new char[] { ',', '\n' }) + "\n";

            // primary keys
            string pk = "CONSTRAINT PK_" + tableName + " PRIMARY KEY CLUSTERED (";
            bool hasKeys = primaryKeys != null && primaryKeys.Length > 0;
            if (hasKeys)
            {
                // user defined keys
                foreach (int key in primaryKeys)
                {
                    pk += schema.Rows[key]["ColumnName"].ToString() + ", ";
                }
            }
            else
            {
                // check schema for keys
                string keys = string.Join(", ", GetPrimaryKeys(schema));
                pk += keys;
                hasKeys = keys.Length > 0;
            }

            pk = pk.TrimEnd(new char[] { ',', ' ', '\n' }) + ")\n";
            if (hasKeys)
            {
                sql += pk;
            }

            sql += ")";

            return sql;
        }

        public static string GetCreateFromDataTableSQL(string schemaName, string tableName, DataTable table)
        {
            string sql = string.Empty;
            if (table != null)
            {
                sql = "IF NOT EXISTS ( SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[" + schemaName + "].[" + tableName + "]')) CREATE TABLE [" + schemaName + "].[" + tableName + "] (\n";
                // columns
                foreach (DataColumn column in table.Columns)
                {
                    sql += "[" + column.ColumnName + "] " + SQLGetType(column) + ",\n";
                }

                sql = sql.TrimEnd(new char[] { ',', '\n' }) + "\n";
                // primary keys
                // if (table.PrimaryKey.Length > 0)
                // {
                //    sql += "CONSTRAINT [PK_" + tableName + "] PRIMARY KEY CLUSTERED (";
                //    foreach (DataColumn column in table.PrimaryKey)
                //    {
                //        sql += "[" + column.ColumnName + "],";
                //    }

                // sql = sql.TrimEnd(new char[] { ',' }) + "))\n";
                // }
                // else
                // {
                sql = sql.TrimEnd(new char[] { ',' }) + ")\n";
                // }
            }

            return sql;
        }

        public static string[] GetPrimaryKeys(DataTable schema)
        {
            List<string> keys = new();

            foreach (DataRow column in schema.Rows)
            {
                if (schema.Columns.Contains("IsKey") && (bool)column["IsKey"])
                {
                    keys.Add(column["ColumnName"].ToString());
                }
            }

            return keys.ToArray();
        }

        // Return T-SQL data type definition, based on schema definition for a column
        public static string SQLGetType(object type, int columnSize, int numericPrecision, int numericScale)
        {
            switch (type.ToString())
            {
                case "System.String":
                    return "VARCHAR(" + ((columnSize == -1) ? "MAX" : columnSize.ToString()) + ")";

                case "System.Decimal":
                    if (numericScale > 0)
                    {
                        return "REAL";
                    }
                    else if (numericPrecision > 10)
                    {
                        return "BIGINT";
                    }
                    else
                    {
                        return "INT";
                    }

                case "System.Double":
                case "System.Single":
                    return "REAL";

                case "System.Int64":
                    return "BIGINT";

                case "System.Int16":
                case "System.Int32":
                    return "INT";

                case "System.DateTime":
                    return "DATETIME";

                default:
                    throw new Exception(type.ToString() + " not implemented.");
            }
        }

        // Overload based on row from schema table
        public static string SQLGetType(DataRow schemaRow)
        {
            return SQLGetType(schemaRow["DataType"],
                                int.Parse(schemaRow["ColumnSize"].ToString()),
                                int.Parse(schemaRow["NumericPrecision"].ToString()),
                                int.Parse(schemaRow["NumericScale"].ToString()));
        }

        // Overload based on DataColumn from DataTable type
        public static string SQLGetType(DataColumn column)
        {
            return SQLGetType(column.DataType, column.MaxLength, 10, 2);
        }
    }
}
