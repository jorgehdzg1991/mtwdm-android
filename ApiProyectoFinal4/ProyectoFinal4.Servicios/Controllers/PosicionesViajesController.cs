using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using ProyectoFinal4.LogicaNegocio;
using ProyectoFinal4.Modelos.Peticiones.Posiciones;
using ProyectoFinal4.Modelos.Respuestas;

namespace ProyectoFinal4.Servicios.Controllers
{
    [EnableCors("*", "*", "*")]
    [RoutePrefix("api/v1/posiciones")]
    public class PosicionesViajesController : ApiController
    {
        [HttpPost]
        [Route("insertarPosicionesViaje")]
        public HttpResponseMessage InsertarPosicionesViaje(
            PeticionInsertarPosicionesViaje peticion)
        {
            var respuesta = new RespuestaApi<bool>();

            try
            {
                PosicionesViajesBL.InsertarPosicionesViaje(
                    peticion.IdViaje, peticion.Posiciones);
            }
            catch (Exception ex)
            {
                respuesta.ManejarExepcion(ex);
            }

            return Request.CreateResponse(respuesta.CodigoEstadoHttp, respuesta);
        }
    }
}
