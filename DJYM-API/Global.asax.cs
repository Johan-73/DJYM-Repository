using DJYM_WebApplication.Helpers;
using DJYM_WebApplication.Models;
using DJYM_WebApplication.Servicios;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Metadata.Edm;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using Unity;
using Unity.Lifetime;

namespace DJYM_WebApplication
{
    public class WebApiApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            GlobalConfiguration.Configure(WebApiConfig.Register);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            // Configurar Dependency Injection
            var container = new UnityContainer(); // Puedes usar otro contenedor si prefieres
            container.RegisterType<DBSuper_DJYMEntities>(new HierarchicalLifetimeManager());

            // Configura el DI en el Web API
            GlobalConfiguration.Configuration.DependencyResolver = new UnityResolver(container);
        }
    }
}
