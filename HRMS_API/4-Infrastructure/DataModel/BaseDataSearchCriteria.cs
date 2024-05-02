using Newtonsoft.Json;

using NHibernate.Criterion;

using Phonix.CrossCutting.Extension.System.Object.Convert.ToValueType;
using Phonix.CrossCutting.Extension.System.String;

using System;
using System.Collections.Generic;
using System.Linq;


namespace Phonix.Infrastructure.DataModel
{
    public class BaseDataSearchCriteria
    {
        private enum FilterComparator
        {
            Equals,
            NotEquals,
            Contains,
            GreaterThan,
            GreaterThanOrEqual,
            LessThan,
            LessThanOrEqual,
        }

        public string SearchString { get; set; }

        public List<int> SelectedStatuses { get; set; }

        public int PageIndex { get; set; }

        public int PageSize { get; set; }

        public bool SortOrder { get; set; }

        public string SortField { get; set; }

        public DetachedCriteria PrepareCritera(DetachedCriteria baseCriteria, string columnName, string condition, string searchValue, Type dataType)
        {
            FilterComparator comparator = ParseComparator(condition);
            switch (comparator)
            {
                case FilterComparator.Equals:
                    if (searchValue.IsNotNullOrEmpty())
                    {
                        baseCriteria = baseCriteria.Add(Restrictions.Eq(columnName, Convert.ChangeType(searchValue, dataType)));
                    }

                    break;
                case FilterComparator.NotEquals:
                    if (searchValue.IsNotNullOrEmpty())
                    {
                        baseCriteria = baseCriteria.Add(!Restrictions.Eq(columnName, Convert.ChangeType(searchValue, dataType)));
                    }

                    break;
                case FilterComparator.Contains:
                    if (searchValue.IsNotNullOrEmpty())
                    {
                        baseCriteria = baseCriteria.Add(Restrictions.Like(columnName, searchValue, MatchMode.Anywhere));
                    }

                    break;
                case FilterComparator.GreaterThan:
                    if (searchValue.IsNotNullOrEmpty())
                    {
                        baseCriteria = baseCriteria.Add(Restrictions.Gt(columnName, Convert.ChangeType(searchValue, dataType).ToInt32OrDefault()));
                    }

                    break;
                case FilterComparator.GreaterThanOrEqual:
                    if (searchValue.IsNotNullOrEmpty())
                    {
                        baseCriteria = baseCriteria.Add(Restrictions.Ge(columnName, Convert.ChangeType(searchValue, dataType).ToInt32OrDefault()));
                    }

                    break;
                case FilterComparator.LessThan:
                    if (searchValue.IsNotNullOrEmpty())
                    {
                        baseCriteria = baseCriteria.Add(Restrictions.Lt(columnName, Convert.ChangeType(searchValue, dataType).ToInt32OrDefault()));
                    }

                    break;
                case FilterComparator.LessThanOrEqual:
                    if (searchValue.IsNotNullOrEmpty())
                    {
                        baseCriteria = baseCriteria.Add(Restrictions.Le(columnName, Convert.ChangeType(searchValue, dataType).ToInt32OrDefault()));
                    }

                    break;
            }

            return baseCriteria;
        }

        public List<Order> GetOrders(string sortOderList, List<SearchProperty> columnMappings)
        {
            List<Order> orders = null;
            if (sortOderList != null)
            {
                List<SortOrder> sortOrders = JsonConvert.DeserializeObject<List<SortOrder>>(sortOderList);
                if (sortOrders != null && sortOrders.Count > 0)
                {
                    orders = new List<Order>();
                    foreach (SortOrder item in sortOrders)
                    {
                        SearchProperty searchProperty = columnMappings.FirstOrDefault(x => x.ColumnName == item.selector);
                        if (searchProperty != null)
                        {
                            string sortField = searchProperty.DatabaseColumnName;
                            Order order = new(sortField, item.desc);
                            orders.Add(order);
                        }
                    }
                }
            }

            return orders;
        }

        private FilterComparator ParseComparator(string pComparator)
        {
            if (pComparator == "=")
            {
                return FilterComparator.Equals;
            }
            else if (pComparator == "contains")
            {
                return FilterComparator.Contains;
            }
            else if (pComparator == ">")
            {
                return FilterComparator.GreaterThan;
            }
            else if (pComparator == ">=")
            {
                return FilterComparator.GreaterThanOrEqual;
            }
            else if (pComparator == "<")
            {
                return FilterComparator.LessThan;
            }
            else if (pComparator == "<=")
            {
                return FilterComparator.LessThanOrEqual;
            }
            else// if (pComparator == "!=")
            {
                return FilterComparator.NotEquals;
            }
        }

        // public TConvertType ChangeType<TConvertType>(object value, string dataType)
        // {
        //    bool hasConverted = false;
        //    switch (dataType)
        //    {
        //        case "byte":
        //            TConvertType t = DoConvert<byte>(value, out hasConverted);
        //            break;
        //        case "sbyte":
        //            return ChangeType<sbyte>(value);
        //            break;
        //        case "short":
        //            break;
        //        case "ushort":
        //            break;
        //        case "int":
        //            break;
        //        case "uint":
        //            break;
        //        case "long":
        //            break;
        //        case "ulong":
        //            break;
        //        case "float":
        //            break;
        //        case "double":
        //            break;
        //        case "decimal":
        //            break;
        //        case "char":
        //            break;
        //        case "bool":
        //            break;
        //        case "object":
        //            break;
        //        case "string":
        //            break;
        //        case "DateTime":
        //            break;
        //        default:
        //            break;
        //    }
        //    return (T)ChangeType(typeof(T), value);
        // }
        // public TConvertType DoConvert<TConvertType>(object convertValue, out bool hasConverted)
        // {
        //    hasConverted = false;
        //    var converted = default(TConvertType);
        //    try
        //    {
        //        converted = (TConvertType)Convert.ChangeType(convertValue, typeof(TConvertType));
        //        hasConverted = true;
        //    }
        //    catch (InvalidCastException)
        //    {
        //    }
        //    catch (ArgumentNullException)
        //    {
        //    }
        //    catch (FormatException)
        //    {
        //    }
        //    catch (OverflowException)
        //    {
        //    }

        // return converted;
        // }
    }
}
