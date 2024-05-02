using System;
using System.Text;

namespace Phoenix.CrossCutting.Extension.System.Double
{
    public static partial class Extensions
    {
        /// <summary>
        ///     A Double extension method that converts the @this to a money.
        /// </summary>
        /// <param name="this">The @this to act on.</param>
        /// <returns>@this as a Double.</returns>
        public static string ToIndianRupees(this double @this)
        {
            string words = ConvertAmount(@this);
            return words;
        }

        private static string ConvertAmount(double amount)
        {
            long amount_int = (long)amount;
            long amount_dec = (long)Math.Round((amount - (double)(amount_int)) * 100);
            StringBuilder sbWords;
            if (amount_dec == 0)
            {
                sbWords = new StringBuilder();
                sbWords = sbWords.AppendFormat("{0} Only", ConvertToRupees(amount_int));
                return sbWords.ToString();
            }
            else
            {
                sbWords = new StringBuilder();
                sbWords = sbWords.AppendFormat("{0} And {1} Only", ConvertToRupees(amount_int), ConvertToRupees(amount_dec));
                return sbWords.ToString();
            }
        }

        private static string ConvertToRupees(long amount)
        {
            if (amount < 20)
            {
                return units[amount];
            }
            if (amount < 100)
            {
                return tens[amount / 10] + ((amount % 10 > 0) ? " " + ConvertToRupees(amount % 10) : "");
            }
            if (amount < 1000)
            {
                return units[amount / 100] + " Hundred"
                        + ((amount % 100 > 0) ? " And " + ConvertToRupees(amount % 100) : "");
            }
            if (amount < 100000)
            {
                return ConvertToRupees(amount / 1000) + " Thousand "
                + ((amount % 1000 > 0) ? " " + ConvertToRupees(amount % 1000) : "");
            }
            if (amount < 10000000)
            {
                return ConvertToRupees(amount / 100000) + " Lakh "
                        + ((amount % 100000 > 0) ? " " + ConvertToRupees(amount % 100000) : "");
            }
            if (amount < 1000000000)
            {
                return ConvertToRupees(amount / 10000000) + " Crore "
                        + ((amount % 10000000 > 0) ? " " + ConvertToRupees(amount % 10000000) : "");
            }
            return ConvertToRupees(amount / 1000000000) + " Arab "
                    + ((amount % 1000000000 > 0) ? " " + ConvertToRupees(amount % 1000000000) : "");
        }

        private static string[] units = { "Zero", "One", "Two", "Three",
        "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven",
        "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen",
        "Seventeen", "Eighteen", "Nineteen" };


        private static string[] tens = { "", "", "Twenty", "Thirty", "Forty",
        "Fifty", "Sixty", "Seventy", "Eighty", "Ninety" };
    }
}