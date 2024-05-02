using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace Phoenix.CrossCutting.Extension.System.Database
{
    public static partial class Extensions
    {
        /// <summary>
        /// Datas the table to list.
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="table">The table.</param>
        /// <param name="configValue">The configuration value.</param>
        /// <param name="separator">The separator.</param>
        /// <returns></returns>
        public static Tuple<bool, List<string>, List<T>> DataTableToList<T>(this DataTable table, string configValue, char separator) where T : class, new()
        {
            try
            {
                T tempT = new();
                Type tType = tempT.GetType();
                List<T> dataList = new();
                Tuple<bool, List<string>, List<T>> dataTableWithErrorMessages;
                List<string> inValidColumns = new();
                List<string> missingColumns = new();
                var dataTblFieldNames = (from DataColumn aHeader in table.Columns
                                         select new
                                         {
                                             Name = aHeader.ColumnName.Replace(" ", ""),
                                             Type = aHeader.DataType,
                                         }).ToList();
                List<string> configValues = configValue.Split(separator).ToList();
                missingColumns = configValues.Except(dataTblFieldNames.Select(f => f.Name)).ToList();
                inValidColumns = dataTblFieldNames.Select(f => f.Name).Except(configValues).ToList();
                if (inValidColumns.Count == 0 && missingColumns.Count == 0)
                {
                    foreach (DataColumn col in table.Columns)
                    {
                        col.ColumnName = col.ColumnName.Replace(" ", "");
                    }

                    foreach (DataRow row in table.Rows.Cast<DataRow>())
                    {
                        T tableData = new();
                        foreach (global::System.Reflection.PropertyInfo prop in tableData.GetType().GetProperties())
                        {
                            if (row.Table.Columns.Contains(prop.Name))
                            {
                                global::System.Reflection.PropertyInfo propertyInfo = tType.GetProperty(prop.Name);
                                object rowValue = row[prop.Name];
                                Type t = Nullable.GetUnderlyingType(propertyInfo.PropertyType) ?? propertyInfo.PropertyType;
                                try
                                {
                                    object safeValue = (rowValue == null || DBNull.Value.Equals(rowValue)) ? null : Convert.ChangeType(rowValue, t);
                                    propertyInfo.SetValue(tableData, safeValue, null);
                                }
                                catch (Exception ex)
                                {
                                    throw ex;
                                }
                            }
                        }

                        dataList.Add(tableData);
                    }

                    dataTableWithErrorMessages = Tuple.Create(true, inValidColumns, dataList);
                }
                else
                {
                    inValidColumns = inValidColumns.Select(x => { x += " Column is Invalid"; return x; }).ToList();
                    missingColumns = missingColumns.Select(x => { x += " Column is Missing"; return x; }).ToList();
                    inValidColumns.AddRange(missingColumns);
                    dataTableWithErrorMessages = Tuple.Create(false, inValidColumns, dataList);
                }

                return dataTableWithErrorMessages;
            }
            catch
            {
                return null;
            }
        }
    }
}