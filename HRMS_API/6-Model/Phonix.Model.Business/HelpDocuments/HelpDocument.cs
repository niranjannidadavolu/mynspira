
namespace Phoenix.Model.Business.HelpDocuments
{
    public class HelpDocument
    {
        public int HelpDocumentSlno { get; set; }
        public string FileName { get; set; }
        public string FileDisplayName { get; set; }
        public string FilePath { get; set; }
        public int Status { get; set; }
        public long CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        public int EmployeeSlno { get; set; }
        public bool CanDownload { get; set; }
        public bool CanPreview { get; set; }
        public int DocType { get; set; }

        public string FileExtension
        {
            get
            {
                string extension = string.Empty;
                extension = Path.GetExtension(FileName);
                return extension;
            }
        }
        public string DisplayName
        {
            get
            {
                string fileName = string.Empty;
                fileName = Path.GetFileNameWithoutExtension(FileName);
                fileName = fileName.Replace("_", " ");
                return fileName;
            }
        }


        public HelpDocument()
        {
            FileName = string.Empty;
            FileDisplayName = string.Empty;
            FilePath = string.Empty;
        }
    }
}
