using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Mvc;
using Phoenix.Model.Business.Administration;
using System;
using Microsoft.Extensions.Primitives;
using System.Linq;
using Phoenix.CrossCutting.Utils.Token;

namespace Phoenix.Web.Service.Helper
{
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method)]
    public class AuthorizeAttribute : Attribute, IAuthorizationFilter
    {
        public void OnAuthorization(AuthorizationFilterContext context)
        {
            StringValues authorizationTokenHeader;
            StringValues clientDateHeader;
            DateTime clientDate = DateTime.MinValue;
            string authorizationToken = string.Empty;
            IJwtAuthManager jwtAuthManager = new JwtAuthManager();
            var user = (UserInformation)context.HttpContext.Items["UserInformation"];
            context.HttpContext.Request.Headers.TryGetValue("Authorization", out authorizationTokenHeader);
            context.HttpContext.Request.Headers.TryGetValue("X-Client-Date", out clientDateHeader);
            DateTime.TryParse(clientDateHeader, out clientDate);
            if(authorizationTokenHeader.Count > 0 && authorizationTokenHeader.FirstOrDefault().StartsWith("Bearer "))
            {
                authorizationToken = authorizationTokenHeader[0];
            }

            if (clientDate != DateTime.MinValue)
            {
                var serverDate = DateTime.Now;
                if (serverDate.Date != clientDate.Date)
                {
                    context.Result = new JsonResult(new { Title = "Invalid Time Information", Message = "Your client timezone information is missing or invalid. Please change to a valid timezone or Date & Time and try again.", ErrorCode = "101" }) { StatusCode = StatusCodes.Status400BadRequest };
                    return;
                }                
            }
            var token = authorizationTokenHeader.FirstOrDefault()?.Split(" ").Last();
           
            if (!jwtAuthManager.ValidateToken(token))
            {
                context.Result = new JsonResult(new { message = "Unauthorized" }) { StatusCode = StatusCodes.Status401Unauthorized };
            }
        }
    }
}
