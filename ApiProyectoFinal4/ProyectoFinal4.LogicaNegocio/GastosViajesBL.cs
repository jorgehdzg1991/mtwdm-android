using System.Collections.Generic;
using ProyectoFinal4.AccesoDatos;
using ProyectoFinal4.Modelos.Entidades;

namespace ProyectoFinal4.LogicaNegocio
{
    public static class GastosViajesBL
    {
        public static void InsertarGastosViaje(
            int idViaje, List<GastoViaje> gastos)
        {
            foreach (var gasto in gastos)
            {
                GastosViajesDAO.InsertarGastoViaje(idViaje, gasto);
            }
        }
    }
}
