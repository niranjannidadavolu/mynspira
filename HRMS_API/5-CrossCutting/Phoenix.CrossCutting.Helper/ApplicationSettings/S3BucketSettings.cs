namespace Phoenix.CrossCutting.Helper.ApplicationSettings
{
    public class S3BucketSettings
    {
        public static S3BucketSettings Current { get; set; }

        public S3BucketSettings()
        {
            Current = this;
        }

        public string BucketName { get; set; }
        public string AccessKey { get; set; }
        public string SecretKey { get; set; }
        public string Region { get; set; }

        public string EmployeesFolder { get; set; }

    }
}
