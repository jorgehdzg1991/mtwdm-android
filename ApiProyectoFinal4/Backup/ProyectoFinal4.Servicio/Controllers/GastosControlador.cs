using System;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using ProyectoFinal4.LogicaNegocio;
using ProyectoFinal4.Modelos.Respuestas;
using ProyectoFinal4.Modelos.Peticiones.Gastos;

namespace ProyectoFinal4.Servicio.Controllers
{
    [EnableCors("*", "*", "*")]
    [RoutePrefix("api/v1/gastos")]
    public class GastosControlador : ApiController
    {
        [HttpPost]
        [Route("insertarGastosViaje")]
        public HttpResponseMessage InsertarGastosViaje(
            PeticionInsertarGastoViaje peticion)
        {
            var respuesta = new RespuestaApi<bool>();

            try
            {
                GastosViajesBL.InsertarGastosViaje(
                    peticion.IdViaje, peticion.Gastos);

                respuesta.Datos = true;
            }
            catch (Exception ex)
            {
                respuesta.ManejarExepcion(ex);
            }

            return Request.CreateResponse(respuesta.CodigoEstadoHttp, respuesta);
        }
    }
}
