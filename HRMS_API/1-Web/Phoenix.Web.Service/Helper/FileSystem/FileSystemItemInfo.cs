using System.Linq;
using System;

namespace Phoenix.Web.Service.Helper.FileSystem
{
    public class FileSystemItemInfo
    {
        public string Path { get; }
        public string[] PathKeys { get; }
        public bool IsDirectory { get; }
        public string Name { get; }
        public string Key { get; }
        public FileSystemItemInfo(string path, bool isDirectory, string[] pathKeys = null)
        {
            Path = path.Trim('/', '\\');
            IsDirectory = isDirectory;
            PathKeys = pathKeys ?? GetDefaultPathKeys(path);
            Key = ((path == string.Empty) ? string.Empty : PathKeys.Last());
            Name = System.IO.Path.GetFileName(Path);
        }
        private string[] GetDefaultPathKeys(string path)
        {
            string[] array = path.Split(new char[1] { System.IO.Path.DirectorySeparatorChar }, StringSplitOptions.RemoveEmptyEntries);
            string[] array2 = new string[array.Length];
            for (int i = 0; i < array.Length; i++)
            {
                array2[i] = ((i == 0) ? array[i] : System.IO.Path.Combine(array2[i - 1], array[i]));
            }

            return array2;
        }
    }

}
