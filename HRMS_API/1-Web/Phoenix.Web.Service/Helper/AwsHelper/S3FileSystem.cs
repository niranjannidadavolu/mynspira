using Amazon.S3.Model;
using Amazon.S3;
using DocumentFormat.OpenXml.Wordprocessing;
using System.Collections.Generic;
using System.IO;
using System;
using System.Linq;
using System.Threading.Tasks;
using Amazon;
using Phoenix.CrossCutting.Helper.ApplicationSettings;

namespace Phoenix.Web.Service.Helper.AwsHelper
{
    public class S3FileSystem : IFileSystem
    {
        private readonly AmazonS3Client _s3Client;
        private readonly string _bucketName;
        private const string RootURL = @"https://s3.amazonaws.com/{0}/{1}";
        private const string EmptyFilename = @"__empty";

        public S3FileSystem()
        {
            _bucketName = S3BucketSettings.Current.BucketName;
            _s3Client = new AmazonS3Client(S3BucketSettings.Current.AccessKey, S3BucketSettings.Current.SecretKey, RegionEndpoint.APSouth1);
        }

        #region Implementation of IFileSystem

        public async Task<IEnumerable<FileData>> GetFiles(string parentVirtualPath)
        {
            var request = new ListObjectsRequest()
            {
                BucketName = _bucketName,
                Prefix = await FixVirtualPath(parentVirtualPath),
                Delimiter = @"/"
            };

            var response = await _s3Client.ListObjectsAsync(request);
            IEnumerable<FileData> files = response.S3Objects.Where(file => file.Size > 0).Select(file => new FileData
            {
                VirtualPath = file.Key,
                Name = file.Key.Substring(file.Key.LastIndexOf('/') + 1),
                Length = file.Size,
                Created = file.LastModified,
                Updated = file.LastModified
            });
            return files;
        }

        public async Task<FileData> GetFile(string virtualPath)
        {
            var request = new GetObjectRequest()
            {
                BucketName = _bucketName,
                Key = await FixVirtualPath(virtualPath)
            };
            FileData file;
            using (var response = await _s3Client.GetObjectAsync(request))
            {
                file = new FileData
                {
                    Name = response.Key.Substring(response.Key.LastIndexOf('/') + 1),
                    Updated = DateTime.Now,
                    Created = DateTime.Now,
                    Length = response.ContentLength,
                    VirtualPath = response.Key
                };
            }
            return file;
        }

        public async Task<IEnumerable<DirectoryData>> GetDirectories(string parentVirtualPath)
        {
            parentVirtualPath = await FixVirtualPath(parentVirtualPath);

            var request = new ListObjectsRequest()
            {
                BucketName = _bucketName,
                Prefix = parentVirtualPath,
                Delimiter = @"/"
            };

            var response = await _s3Client.ListObjectsAsync(request);
            IEnumerable<DirectoryData> directories = response.CommonPrefixes.Select(dir => new DirectoryData
            {
                Created = DateTime.Now,
                Updated = DateTime.Now,
                Name = dir.TrimEnd('/').Substring(dir.TrimEnd('/').LastIndexOf('/') + 1),
                VirtualPath = dir
            });
            return directories;
        }

        public async Task<DirectoryData> GetDirectory(string virtualPath)
        {
            virtualPath = await FixVirtualPath(virtualPath);
            return new DirectoryData
            {
                Name = string.Format(RootURL, _bucketName, virtualPath),
                VirtualPath = virtualPath,
                Created = DateTime.Now,
                Updated = DateTime.Now
            };
        }

        public async Task<bool> FileExists(string virtualPath)
        {
            var request = new GetObjectMetadataRequest()
            {
                BucketName = _bucketName,
                Key = await FixVirtualPath(virtualPath)
            };

            try
            {
                await _s3Client.GetObjectMetadataAsync(request);
            }
            catch (AmazonS3Exception)
            {
                return false;
            }
            return true;
        }

        public async Task MoveFile(string fromVirtualPath, string destinationVirtualPath)
        {
            await CopyFile(fromVirtualPath, destinationVirtualPath);
            await DeleteFile(fromVirtualPath);
        }

        public async Task DeleteFile(string virtualPath)
        {
            var request = new DeleteObjectRequest()
            {
                BucketName = _bucketName,
                Key = await FixVirtualPath(virtualPath)
            };

            await _s3Client.DeleteObjectAsync(request);
        }

        public async Task CopyFile(string fromVirtualPath, string destinationVirtualPath)
        {
            var copyRequest = new CopyObjectRequest()
            {
                SourceBucket = _bucketName,
                SourceKey = fromVirtualPath,
                DestinationBucket = _bucketName,
                DestinationKey = destinationVirtualPath,
                CannedACL = S3CannedACL.PublicRead
            };

            await _s3Client.CopyObjectAsync(copyRequest);
        }


        public async Task<Stream> OpenFile(string virtualPath, bool readOnly = false)
        {
            var request = new GetObjectRequest()
            {
                BucketName = _bucketName,
                Key = await FixVirtualPath(virtualPath)
            };

            var stream = new MemoryStream();

            using (var response = await _s3Client.GetObjectAsync(request))
            {
                var buffer = new byte[32768];
                while (true)
                {
                    var read = response.ResponseStream.Read(buffer, 0, buffer.Length);
                    if (read <= 0)
                        break;
                    stream.Write(buffer, 0, read);
                }
            }
            return stream;
        }

        public async Task WriteFile(string virtualPath, Stream inputStream)
        {
            var request = new PutObjectRequest()
            {
                BucketName = _bucketName,
                CannedACL = S3CannedACL.PublicRead,
                Key = await FixVirtualPath(virtualPath),
                InputStream = inputStream
            };
            await _s3Client.PutObjectAsync(request);
        }

        public async Task ReadFileContents(string virtualPath, Stream outputStream)
        {
            var request = new GetObjectRequest()
            {
                BucketName = _bucketName,
                Key = await FixVirtualPath(virtualPath)
            };

            using (var response = await _s3Client.GetObjectAsync(request))
            {
                var buffer = new byte[32768];
                while (true)
                {
                    var read = response.ResponseStream.Read(buffer, 0, buffer.Length);
                    if (read <= 0) break;
                    outputStream.Write(buffer, 0, read);
                }
            }
        }

        public async Task<bool> DirectoryExists(string virtualPath)
        {
            virtualPath = FixVirtualPath(virtualPath) + EmptyFilename;

            var request = new GetObjectMetadataRequest()
            {
                BucketName = _bucketName,
                Key = virtualPath
            };

            try
            {
                await _s3Client.GetObjectMetadataAsync(request);
            }
            catch (AmazonS3Exception)
            {
                return false;
            }
            return true;
        }

        public Task MoveDirectory(string fromVirtualPath, string destinationVirtualPath)
        {
            throw new NotImplementedException();
        }

        public async Task DeleteDirectory(string virtualPath)
        {
            virtualPath = await FixVirtualPath(virtualPath);
            DeleteDirectoryAndChildren(virtualPath);
        }

        public async Task CreateDirectory(string virtualPath)
        {
            virtualPath = string.Format("{0}/{1}", FixVirtualPath(virtualPath), EmptyFilename);

            var request = new PutObjectRequest()
            {
                BucketName = _bucketName,
                Key = virtualPath,
                ContentBody = string.Empty
            };
            await _s3Client.PutObjectAsync(request);
        }

        #endregion

        private async Task<string> FixVirtualPath(string virtualPath)
        {
            if (virtualPath.StartsWith(@"~/"))
                return virtualPath.Replace(@"~/", string.Empty).TrimStart('/');

            if (virtualPath.StartsWith(@"/N2/"))
                return virtualPath.Replace(@"/N2/", string.Empty).TrimStart('/');

            if (virtualPath.StartsWith(@"/upload/"))
                return virtualPath;

            return virtualPath.TrimStart('/');
        }

        private async Task DeleteDirectoryAndChildren(string virtualPath)
        {
            var directories = await GetDirectories(virtualPath);
            foreach (var directory in directories)
                await DeleteDirectoryAndChildren(directory.VirtualPath);

            var files = await GetFiles(virtualPath);
            foreach (var file in files)
                await DeleteFile(file.VirtualPath);

            var request = new DeleteObjectRequest()
            {
                BucketName = _bucketName,
                Key = virtualPath + EmptyFilename
            };
            await _s3Client.DeleteObjectAsync(request);
        }

    }
}
