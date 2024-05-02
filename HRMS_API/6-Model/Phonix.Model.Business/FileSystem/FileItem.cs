using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace Phoenix.Model.Business.FileSystem
{
    public class FileItem
    {
        [JsonPropertyName("name")]
        public string name { get; set; }

        [JsonPropertyName("filedate")]
        public DateTime filedate { get; set; }

        [JsonIgnore]
        public string? PresignedUrl { get; set; }

        [JsonPropertyName("isDirectory")]
        public bool isDirectory { get; set; }

        [JsonPropertyName("size")]
        public long size { get; set; }

        [JsonPropertyName("items")]
        public List<FileItem> items { get; set; }

        [JsonIgnore]
        public string ParentDirectory { get; set; }

        [JsonIgnore]
        public bool IsParentDirectory { get; set; }
        public string OriginalFileName { get; set; }
    }
   
  
}
