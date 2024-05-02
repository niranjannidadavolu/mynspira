using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using Amazon;
using Amazon.S3;
using Amazon.S3.Model;
using Amazon.S3.Transfer;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Phoenix.CrossCutting.Helper.ApplicationSettings;
using Phoenix.CrossCutting.Helper.Constants;
using Phoenix.Model.Business.FileSystem;
using Phoenix.Web.Service.Base;
using Phoenix.Web.Service.Helper;
using Phoenix.Web.Service.Helper.FileSystem;

namespace Phoenix.Web.Service.Controllers.DocumentManagement
{
    [Route("api/[controller]")]
    [ApiController]
    public class DocumentManagementController : BaseController
    {
        readonly IAmazonS3 _s3Client;
        public DocumentManagementController()
        {

            _s3Client = new AmazonS3Client(S3BucketSettings.Current.AccessKey, S3BucketSettings.Current.SecretKey, RegionEndpoint.APSouth1);
        }

        [Authorize]
        [HttpGet]
        [Route("GetAllFiles")]
        public async Task<List<FileItem>> GetAllFilesAsync(string folderName)
        {
            List<FileItem> fileItems = null;
            string modifiedPrefix = string.Format("employeesinfo/{0}", folderName);
            var request = new ListObjectsV2Request()
            {
                BucketName = S3BucketSettings.Current.BucketName,
                Prefix = modifiedPrefix,
            };
            ListObjectsV2Response result = await _s3Client.ListObjectsV2Async(request);
            if (result != null)
            {
                List<S3Object> s3Objects = result.S3Objects;
                var rootFileItem = GetDirectoryTree(s3Objects, folderName);
                if (rootFileItem.items.Count > 0)
                {
                    fileItems = rootFileItem.items[0].items;
                }
            }
            return fileItems;
        }

        private FileItem GetDirectoryTree(List<S3Object> paths, string name = null)
        {
            var node = new FileItem
            {
                name = name ?? "Root",
                items = new List<FileItem>()
            };
            string modifiedPrefix = string.Format("{0}/", name);
            foreach (var path in paths)
            {
                var directories = path.Key.Split("/").ToList();
                if (String.IsNullOrWhiteSpace(directories.Last())) { directories.Remove(""); }
                var current = node;

                for (int i = 0; i < directories.Count; i++)
                {
                    var directoryName = directories[i];
                    var child = current.items.FirstOrDefault(c => c.name == directoryName);

                    if (child == null)
                    {
                        child = new FileItem
                        {
                            name = directoryName,
                            items = new List<FileItem>(),
                            OriginalFileName = path.Key.ToString(),
                            filedate = path.LastModified,
                            size = path.Size,
                            isDirectory = !directoryName.Contains("."),
                            ParentDirectory = path.Key == modifiedPrefix ? null : modifiedPrefix,
                            IsParentDirectory = path.Key == modifiedPrefix,
                        };
                        current.items.Add(child);
                    }

                    current = child;
                }
            }

            return node;
        }

        [HttpGet]
        [Authorize]
        [Route("DownloadFiles")]
        public async Task<dynamic> DownloadFiles(string fileKey)
        {
            MemoryStream ms = null;
            string fileDownloadName = string.Empty;
            fileKey = string.Format("{0}/{1}", "employeesinfo", fileKey);
            
            GetObjectRequest getObjectRequest = new GetObjectRequest
            {
                BucketName = S3BucketSettings.Current.BucketName,
                Key = fileKey
            };

            using (var response = await _s3Client.GetObjectAsync(getObjectRequest))
            {
                if (response.HttpStatusCode == HttpStatusCode.OK)
                {
                    using (ms = new MemoryStream())
                    {
                        await response.ResponseStream.CopyToAsync(ms);
                    }
                }
            }

            if (ms is null || ms.ToArray().Length < 1)
                throw new FileNotFoundException(string.Format("The document '{0}' is not found", fileKey));

            string[] fileNames = fileKey.Split("/");
            if(fileNames.Length > 0)
            {
                var x = fileNames.Reverse<string>();
                fileDownloadName = x.FirstOrDefault();
            }
            return File(ms.ToArray(), Constants.PDFMIMETYPE, fileDownloadName);
        }

        [HttpPost]
        [Route("UploadFile")]
        public async Task<bool> UploadFile(IFormFile file, string folderPath)
        {
            try
            {
                using (var newMemoryStream = new MemoryStream())
                {
                    file.CopyTo(newMemoryStream);

                    var uploadRequest = new TransferUtilityUploadRequest
                    {
                        InputStream = newMemoryStream,
                        Key = folderPath + '/' + file.FileName,
                        BucketName = S3BucketSettings.Current.BucketName,
                        ContentType = file.ContentType
                    };

                    var fileTransferUtility = new TransferUtility(_s3Client);

                    await fileTransferUtility.UploadAsync(uploadRequest);

                    return true;
                }
            }
            catch (Exception)
            {
                return false;
                throw;
            }
        }

        private async Task<IEnumerable<FileSystemItem>> GetItems(string folderName)
        {
            var result = new List<FileSystemItem>();
            var continuationtoken = string.Empty;
            var dirKey = folderName;

            var objrequest = new ListObjectsV2Request
            {
                BucketName = S3BucketSettings.Current.BucketName,
                Delimiter = "/",
                Prefix = dirKey,
                ContinuationToken = "123456",
            };
            ListObjectsV2Response response = await _s3Client.ListObjectsV2Async(objrequest);
            var x = response;
            do
            {
                continuationtoken = response.ContinuationToken;
                foreach (var obj in response.S3Objects)
                {
                    var filename = Path.GetFileName(obj.Key);

                    var item = new FileSystemItem
                    {
                        Name = filename,
                        DateModified = obj.LastModified,
                        Size = obj.Size,
                        Key = obj.Key,
                        IsDirectory = false
                    };
                    result.Add(item);
                }
                foreach (var p in response.CommonPrefixes)
                {
                    var rootfolder = p.Count(f => f == '/');
                    if (rootfolder>1)
                    {
                        var subfolder = p.Replace(dirKey, "");
                        var folder = subfolder.Split('/').First();
                        var item = new FileSystemItem
                        {
                            IsDirectory = true,
                            HasSubDirectories = true,
                            Name = folder,
                        };
                        result.Add(item);
                    }
                    else
                    {
                        var folder = p.Split('/').First();
                        var item = new FileSystemItem
                        {
                            IsDirectory = true,
                            HasSubDirectories = true,
                            Name = folder,
                        };
                        result.Add(item);
                    }
                }
            } while (continuationtoken != null);
            return result.OrderByDescending(item => item.IsDirectory)
                .ThenBy(item => item.Name)
                .ToList();
        }
    }


}
