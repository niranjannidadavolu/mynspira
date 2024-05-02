﻿using System;
using System.IO;

namespace Phoenix.CrossCutting.Extension.File
{
    public static partial class Extensions
    {
        public static string ConvertToBase64(this Stream stream)
        {
            byte[] bytes;
            using (var memoryStream = new MemoryStream())
            {
                stream.CopyTo(memoryStream);
                bytes = memoryStream.ToArray();
            }
            string base64 = Convert.ToBase64String(bytes);
            return base64;
        }


    }
}
