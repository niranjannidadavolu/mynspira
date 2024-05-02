namespace Phoenix.Web.Service.Helper.FileSystem
{
    public class FileSystemLoadItemOptions
    {
        public FileSystemItemInfo Directory { get; private set; }
        public FileSystemLoadItemOptions(FileSystemItemInfo directory)
        {
            Directory = directory;
        }
    }
}
