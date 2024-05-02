using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.StaticFiles;
using Microsoft.Extensions.FileProviders;

using NHibernate.Mapping;

using Phoenix.Model.Business.Logs;
using Phoenix.Web.Service.Helper;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Phoenix.CrossCutting.Extension.System.String;
using Phoenix.CrossCutting.Helper.ApplicationSettings;

namespace Phoenix.Web.Service.Controllers.Administration
{
    [Route("api/[controller]")]
    [ApiController]
    public class LogFileController : ControllerBase
    {
        private readonly IFileProvider _fileProvider;
        public LogFileController(IFileProvider fileProvider)
        {
            _fileProvider = fileProvider;
        }


        [HttpGet]
        [Route("GetLogFiles")]
        public List<LogFile> GetLogFiles()
        {
            string folderName = Path.Combine(ApplicationSettings.Current.LogFilePath);
            string pathToRead = Path.Combine(Directory.GetCurrentDirectory(), folderName);
            List<LogFile> files = new List<LogFile>();
             var filesList = Directory.EnumerateFiles(pathToRead,"*",SearchOption.AllDirectories);
            foreach (string x in filesList)
            {
                LogFile file = new LogFile()
                {
                    FileName = Path.GetFileName(x),
                    CreatedDate = x.ToFileInfo().CreationTime,
                    LastWriteDate = x.ToFileInfo().LastWriteTime,
                    FileExtension = Path.GetExtension(x),
                    FileUrl = x,
                    FolderName =  Path.GetFileName(Path.GetDirectoryName(x).TrimEnd(Path.DirectorySeparatorChar))
                };
                files.Add(file);
            }

            return files;
        }

        [HttpGet, DisableRequestSizeLimit]
        [Route("DownloadLogFile")]
        public async Task<IActionResult> DownloadLogFile([FromQuery] string fileUrl)
        {
            var filePath = Path.Combine(Directory.GetCurrentDirectory(), fileUrl);
            string downLoadFileName = Path.GetFileName(filePath);

            if (!System.IO.File.Exists(filePath))
                return NotFound();
            var memory = new MemoryStream();
            await using (var stream = new FileStream(filePath, FileMode.Open))
            {
                await stream.CopyToAsync(memory);
            }
            memory.Position = 0;
            return File(memory, GetContentType(filePath), downLoadFileName);
        }

        private string GetContentType(string path)
        {
            var provider = new FileExtensionContentTypeProvider();
            string contentType;

            if (!provider.TryGetContentType(path, out contentType))
            {
                contentType = "application/octet-stream";
            }

            return contentType;
        }
    }
}
