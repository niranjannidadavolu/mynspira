using System.Collections.Generic;
using System.IO;
using System.Threading.Tasks;

namespace Phoenix.Web.Service.Helper.AwsHelper
{
    public interface IFileSystem
    {
         Task<IEnumerable<FileData>> GetFiles(string parentVirtualPath);
         Task<FileData> GetFile(string virtualPath);
         Task<IEnumerable<DirectoryData>> GetDirectories(string parentVirtualPath);
         Task<DirectoryData> GetDirectory(string virtualPath);
         Task<bool> FileExists(string virtualPath);
         Task MoveFile(string fromVirtualPath, string destinationVirtualPath);
         Task DeleteFile(string virtualPath);

        Task CopyFile(string fromVirtualPath, string destinationVirtualPath);

         Task<Stream> OpenFile(string virtualPath, bool readOnly = false);
         Task WriteFile(string virtualPath, Stream inputStream);
         Task ReadFileContents(string virtualPath, Stream outputStream);
         Task<bool> DirectoryExists(string virtualPath);
         Task MoveDirectory(string fromVirtualPath, string destinationVirtualPath);
         Task DeleteDirectory(string virtualPath);
         Task CreateDirectory(string virtualPath);
    }
}
