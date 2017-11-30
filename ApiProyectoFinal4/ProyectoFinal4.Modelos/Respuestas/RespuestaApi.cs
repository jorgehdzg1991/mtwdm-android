using System;
using System.Net;

namespace ProyectoFinal4.Modelos.Respuestas
{
    public class RespuestaApi<T>
    {
        private const string MensajeError =
            "Ha ocurrido un error en el servidor.\n\nMensaje de la excepción:\n\n";

        public bool TieneError { get; set; }
        public string Mensaje { get; set; }
        public HttpStatusCode CodigoEstadoHttp { get; set; }
        public T Datos { get; set; }

        public RespuestaApi()
        {
            CodigoEstadoHttp = HttpStatusCode.OK;
        }

        public void ManejarExepcion(Exception ex)
        {
            TieneError = true;
            Mensaje = MensajeError + ex.Message;
            CodigoEstadoHttp = HttpStatusCode.InternalServerError;
        }
    }
}
