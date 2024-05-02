namespace Phoenix.CrossCutting.Extension.System.Decimal.System.Decimal
{
    public static partial class Extensions
    {
        public static string ConvertCurrencyToWords(this decimal currency)
        {
            if (currency == 0) return "Zero rupees";

            int rupees = (int)currency;
            int paise = (int)((currency - rupees) * 100);

            string rupeesWords = ConvertNumberToWords(rupees);
            string paiseWords = ConvertNumberToWords(paise);

            string currencyInWords = rupeesWords + " rupee" + (rupees == 1 ? "" : "s");

            if (paise > 0)
            {
                currencyInWords += " and " + paiseWords + " paise";
            }

            return currencyInWords;
        }

        public static string ConvertNumberToWords(long number)
        {
            if (number == 0) return "Zero";

            string[] ones = new string[] { "", "One", "Two", "Three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen" };

            string[] tens = new string[] { "", "", "twenty", "thirty", "fourty", "fifty", "sixty", "seventy", "eighty", "ninety" };

            if (number < 20)
                return ones[number];

            if (number < 100)
                return tens[number / 10] + ((number % 10 > 0) ? " " + ones[number % 10] : "");

            if (number < 1000)
                return ones[number / 100] + " hundred" + ((number % 100 > 0) ? " and " + ConvertNumberToWords(number % 100) : "");

            if (number < 100000)
                return ConvertNumberToWords(number / 1000) + " thousand" + ((number % 1000 > 0) ? ", " + ConvertNumberToWords(number % 1000) : "");

            if (number < 10000000)
                return ConvertNumberToWords(number / 100000) + " lakh" + ((number % 100000 > 0) ? ", " + ConvertNumberToWords(number % 100000) : "");

            if (number < 1000000000)
                return ConvertNumberToWords(number / 10000000) + " crore" + ((number % 10000000 > 0) ? ", " + ConvertNumberToWords(number % 10000000) : "");

            return "";
        }
    }
}