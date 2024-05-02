namespace Phoenix.Model.Business.Administration
{
    public class LoginInformation
    {
        public string UserName { get; set; }
        public string Password { get; set; }
        public int LoginType { get; set; }
        public PreviousParameters PreviousParameters { get; set; }
    }
    public class PreviousParameters
    {
        public int preId { get; set; }
        public int cid { get; set; }
        public int CId { get; set; }
        public int JobId { get; set; }
        public string CurrentUrl { get; set; }
    }
}
