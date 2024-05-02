using System.IO;
using System.Linq;

namespace Phoenix.CrossCutting.Helper.FileService
{
    public class FileService
    {
        private string _rootPath;

        public FileService(string rootPath)
        {
            _rootPath = rootPath;
        }

        
        public string GetEmailTemplateContent(string emailTemplateName)
        {
            string[] allFiles = Directory.GetFiles(_rootPath);

            string templateFileName = allFiles.FirstOrDefault(x => x.Contains(emailTemplateName));

            string emailContent = File.ReadAllText(Path.Combine(templateFileName));
            return emailContent;
        }
    }
}
