using System;
using System.Collections.Generic;

namespace Phoenix.Web.Service.Helper.FileSystem
{
    public class FileSystemItem
    {
        public string Key { get; set; }
        public string Name { get; set; }
        public bool IsDirectory { get; set; }
        public DateTime DateModified { get; set; }
        public long Size { get; set; }
        public bool HasSubDirectories { get; set; }
        public string Thumbnail { get; set; }
        public IDictionary<string, object> CustomFields { get; }
        public FileSystemItem()
        {
            CustomFields = new Dictionary<string, object>();
        }
    }
}
