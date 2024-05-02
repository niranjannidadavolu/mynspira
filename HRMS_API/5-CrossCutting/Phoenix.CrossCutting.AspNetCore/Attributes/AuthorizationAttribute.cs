using System;
using Microsoft.AspNetCore.Authorization;

namespace Phoenix.CrossCutting.AspNetCore.Attributes
{
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method, AllowMultiple = true)]
    public sealed class AuthorizationAttribute : AuthorizeAttribute
    {
        //public AuthorizationAttribute(params Roles[] roles)
        //{
        //    this.Roles = string.Join(", ", roles.Select(role => Enum.GetName(role.GetType(), role)));
        //}
    }
}
