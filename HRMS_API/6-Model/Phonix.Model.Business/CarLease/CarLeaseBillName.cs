
namespace Phoenix.Model.Business.CarLease
{
    public class CarLeaseBillName
    {
        public CarLeaseBillName()
        {
            Name=string.Empty;
        }
        public int CarLeaseSLno { get; set; }
        public int From_CC { get; set; }
        public decimal Max_Amt { get; set; }
        public string Name { get; set; }
        public int To_CC { get; set; }
    }
}
