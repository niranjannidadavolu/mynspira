using System.Linq;

namespace Phoenix.CrossCutting.Helper
{
    public class AppHelper
    {
        public int CalculateChecksumDigit(string barCode)
        {
            // EAN-13 check sum being calculated in reverse order for compatibility with UPC-A barcodes.
            var degits = barCode.Take(12).Select(x => x - '0').Reverse();
            var even = degits.Where((x, i) => i % 2 == 0).Sum() * 3;
            var odd = degits.Where((x, i) => i % 2 != 0).Sum();

            int checkDegit = (10 - ((even + odd) % 10)) % 10;

            return checkDegit;
        }
    }
}
