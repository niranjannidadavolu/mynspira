namespace Phoenix.Infrastructure.BusinessSearchCriteria
{
    public class SearchBaseEntity
    {
        public SearchBaseEntity()
        {
            //this.SearchValue = string.Empty;
        }
        //public string SearchValue { get; set; }
        public int StartIndex { get; set; }
        public int EndIndex { get; set; }
    }
}
