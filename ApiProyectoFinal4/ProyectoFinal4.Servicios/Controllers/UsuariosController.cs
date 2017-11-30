using ProyectoFinal4.LogicaNegocio;
using ProyectoFinal4.Modelos.Entidades;
using ProyectoFinal4.Modelos.Peticiones.Usuarios;
using ProyectoFinal4.Modelos.Respuestas;
using System;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace ProyectoFinal4.Servicios.Controllers
{
    [RoutePrefix("api/v1/usuarios")]
    [EnableCors("*", "*", "*")]
    public class UsuariosController : ApiController
    {
        [HttpPost]
        [Route("obtenerUsuarioCredencial")]
        public HttpResponseMessage ObtenerUsuarioCredencial(
            PeticionObtenerUsuarioCredencial peticion)
        {
            var respuesta = new RespuestaApi<Usuario>();

            try
            {
                var usuario = UsuariosBL.ObtenerUsuarioPorCredencial(
                    peticion.Correo, peticion.Contrasena);

                if (usuario == null)
                {
                    respuesta.CodigoEstadoHttp = HttpStatusCode.NotFound;
                }

                respuesta.Datos = usuario;
            }
            catch (Exception ex)
            {
                respuesta.ManejarExepcion(ex);
            }

            return Request.CreateResponse(
                respuesta.CodigoEstadoHttp, respuesta);
        }
    }
}
