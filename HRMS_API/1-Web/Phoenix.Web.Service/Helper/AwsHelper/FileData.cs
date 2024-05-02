using System;

namespace Phoenix.Web.Service.Helper.AwsHelper
{
    /// <summary>
    /// Represents an item provided through the <see cref="IFileSystem"/>.
    /// </summary>
    public abstract class AbstractFileSystemItem
    {
        public string Name { get; set; }
        public string RootPath { get; set; }
        public string VirtualPath { get; set; }
        public DateTime Created { get; set; }
        public DateTime Updated { get; set; }
    }

    /// <summary>
    /// Represents a file provided through the <see cref="IFileSystem"/>.
    /// </summary>
    public class FileData : AbstractFileSystemItem
    {
        public long Length { get; set; }
    }
}
