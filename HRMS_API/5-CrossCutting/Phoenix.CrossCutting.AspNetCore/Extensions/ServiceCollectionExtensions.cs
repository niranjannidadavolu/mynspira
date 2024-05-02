using System;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Authorization;
using Microsoft.Extensions.DependencyInjection;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;

namespace Phoenix.CrossCutting.AspNetCore.Extensions
{
    public static class ServiceCollectionExtensions
    {
        public static void AddMvcJson(this IServiceCollection services)
        {
            void Json(MvcNewtonsoftJsonOptions json)
            {
                json.SerializerSettings.NullValueHandling = NullValueHandling.Include;
                json.SerializerSettings.ContractResolver = new DefaultContractResolver();
                json.SerializerSettings.DateTimeZoneHandling = DateTimeZoneHandling.Local;
            };
            services.AddControllers().AddNewtonsoftJson(opts =>
            {
                opts.SerializerSettings.NullValueHandling = NullValueHandling.Include;
                opts.SerializerSettings.ContractResolver = new DefaultContractResolver();
                opts.SerializerSettings.DateTimeZoneHandling = DateTimeZoneHandling.Local;
            });
            services.AddMvc(opts =>
            {
                opts.EnableEndpointRouting = false;
                opts.Filters.Add(new AllowAnonymousFilter());
            });
        }

        public static void AddSession(this IServiceCollection services)
        {
            services.AddDistributedMemoryCache();
            services.AddSession(options =>
            {
                options.Cookie.Name = ".Phoenix.Session";
                options.IdleTimeout = TimeSpan.FromMinutes(20);
                options.Cookie.HttpOnly = true;
                options.Cookie.IsEssential = true;
            });
        }
    }
}
