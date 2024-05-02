using System;
using System.Data;
using System.Data.SqlClient;
using System.Reflection;
using System.Text.RegularExpressions;

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

    public class SqlTableCopier
    {
        private SqlConnection connection;
        private SqlTransaction transaction;
        private string destinationTableName;

        public SqlTableCopier() { }

        public SqlTableCopier(SqlConnection connection)
            : this(connection, null, string.Empty) { }

        public SqlTableCopier(SqlConnection connection, SqlTransaction transaction, string destinationTableName)
        {
            this.connection = connection;
            this.transaction = transaction;
            this.destinationTableName = destinationTableName;
        }

        protected string GetBulkCopyColumnException(Exception ex, SqlBulkCopy bulkcopy)

        {
            string message = string.Empty;
            if (ex.Message.Contains("Received an invalid column length from the bcp client for colid"))

            {
                string pattern = @"\d+";
                Match match = Regex.Match(ex.Message.ToString(), pattern);
                var index = Convert.ToInt32(match.Value) - 1;

                FieldInfo fi = typeof(SqlBulkCopy).GetField("_sortedColumnMappings", BindingFlags.NonPublic | BindingFlags.Instance);
                var sortedColumns = fi.GetValue(bulkcopy);
                var items = (Object[])sortedColumns.GetType().GetField("_items", BindingFlags.NonPublic | BindingFlags.Instance).GetValue(sortedColumns);

                FieldInfo itemdata = items[index].GetType().GetField("_metadata", BindingFlags.NonPublic | BindingFlags.Instance);
                var metadata = itemdata.GetValue(items[index]);
                var column = metadata.GetType().GetField("column", BindingFlags.Public | BindingFlags.NonPublic | BindingFlags.Instance).GetValue(metadata);
                var length = metadata.GetType().GetField("length", BindingFlags.Public | BindingFlags.NonPublic | BindingFlags.Instance).GetValue(metadata);
                message = string.Format("Column: {0} contains data with a length greater than: {1}", column, length);
            }

            return message;
        }

        public void CopyData(DataTable sourceData, string schemaName, string tableName)
        {
            SqlBulkCopy bulkCopy = null;
            try
            {
                if (this.connection.State == ConnectionState.Open)
                {
                    this.connection.Close();
                    this.connection.Open();
                }
                else
                {
                    this.connection.Open();
                }

                using (bulkCopy = new SqlBulkCopy(this.connection))
                {
                    this.destinationTableName = string.Empty;
                    if (string.IsNullOrEmpty(this.destinationTableName))
                    {
                        this.destinationTableName = string.Format("[{0}].[{1}]", schemaName, tableName);
                    }

                    bulkCopy.DestinationTableName = this.destinationTableName;
                    bulkCopy.WriteToServer(sourceData);
                }
            }
            catch (Exception ex)
            {
                if (ex.Message.Contains("Received an invalid column length from the bcp client for colid"))
                {
                    // this method gives message with column name with length.  
                    string errorMessage = this.GetBulkCopyColumnException(ex, bulkCopy);
                    // errorMessage contains "Column: "XYZ" contains data with a length greater than: 20", column, length  
                    Exception exInvlidColumn = new(errorMessage, ex);
                    // base.LogDataAccessException(exInvlidColumn, System.Reflection.MethodBase.GetCurrentMethod().Name);
                }
            }
        }
    }
}
