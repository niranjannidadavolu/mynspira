using Amazon.S3;

namespace Phoenix.FileProviders
{
    public class AwsFileProvider : IAwsFileProvider
    {
        private readonly string _tempdirpath;
        private const string TempFilePrefix = "awsdownload_";
        private static IAmazonS3 _s3Client { get; set; }
        private const string existingBucketName = "engdrawings";

        public AwsFileProvider(string tempdirpath, IAmazonS3 s3Client)
        {
            _s3Client = s3Client;
            _tempdirpath = tempdirpath;
        }
    }
}
