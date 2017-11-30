using System.Web;
using System.Web.Http;
using System.Web.Mvc;

namespace ProyectoFinal4.Servicio
{
    public class Global : HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            GlobalConfiguration.Configure(WebApiConfig.Register);
        }
    }
}
