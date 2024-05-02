using System.IO;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System;
using Microsoft.AspNetCore.Mvc;
using Phoenix.CrossCutting.Helper.Constants;

namespace Phoenix.Web.Service.Base
{
    [Route("api/[controller]")]
    [ApiController]
    public class BaseApiController : BaseController
    {


        [HttpPost]
        [Route("DownloadFile")]
        public async Task<dynamic> DownloadFile()
        {
            byte[] response = null;
            string file = Request.Form["fileUrl"].ToString();
            string[] fileData = file.Split('\\');
            FileInfo fileInfo = new FileInfo(file);
            if (fileData != null && fileData.Length > 0)
            {
                string filePath = string.Join('/', fileData);
                StringBuilder strBuilder = new StringBuilder();
                strBuilder.Append(filePath);
                Uri uri = new Uri(strBuilder.ToString());
                response = new WebClient().DownloadData(uri.AbsoluteUri);
            }
            return File(response, Constants.IMGMIMETYPE, fileInfo.Extension);
        }
    }
}
