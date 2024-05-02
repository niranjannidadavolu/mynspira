using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.AccessControl;
using System.Text;
using System.Threading.Tasks;

namespace Phoenix.Model.Business.SiteNotification
{
    public class SiteNotificationDetails
    {
        public int Notification_Id { get; set; }
        public string Notification { get; set; }
        public int Office_Type_Slno { get; set; }
        public int Created_By { get; set; }
        public DateTime Created_Date { get; set; }
        public int Display_Duration { get;}
        public bool Status { get;}
        public int FileType { get; set; }
        public string VideoId { get; set; }

        public bool IsVideo
        {
            get
            {
                bool isVideo = false;
                if (FileType == 2)
                {
                    isVideo = true;
                }
                return isVideo;
            }
        }
       
            

    }
}
