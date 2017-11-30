using System.Collections.Generic;
using ProyectoFinal4.AccesoDatos;
using ProyectoFinal4.Modelos.Entidades;

namespace ProyectoFinal4.LogicaNegocio
{
    public static class ViajesBL
    {
        public static void ActualizarEstatusViaje(
            int idViaje, EstatusViaje estatus, DetalleViaje detalles)
        {
            ViajesDAO.ActualizarEstatusViaje(idViaje, estatus);

            if (estatus == EstatusViaje.Terminado && detalles != null)
            {
                DetallesViajesDAO.InsertarDetallesViaje(idViaje, detalles);
            }
        }

        public static List<Viaje> ObtenerViajesOperador(int idOperador)
        {
            return ViajesDAO.ObtenerViajesOperador(idOperador);
        }

        public static Viaje ObtenerDetalleViaje(int idViaje)
        {
            return ViajesDAO.ObtenerDetalleViaje(idViaje);
        }

        public static List<Viaje> ObtenerTodosViajes()
        {
            return ViajesDAO.ObtenerTodosViajes();
        }
    }
}
