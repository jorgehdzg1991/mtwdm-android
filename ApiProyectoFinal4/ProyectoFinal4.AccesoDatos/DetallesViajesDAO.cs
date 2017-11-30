using System.Data;
using Dapper;
using MySql.Data.MySqlClient;
using ProyectoFinal4.Soporte;
using ProyectoFinal4.Modelos.Entidades;

namespace ProyectoFinal4.AccesoDatos
{
    public static class DetallesViajesDAO
    {
        public static void InsertarDetallesViaje(
            int idViaje, DetalleViaje detalles)
        {
            using (var conexion = new MySqlConnection(Constantes.CadenaConexion))
            {
                var parametros = new DynamicParameters();

                parametros.Add("p_ViajesId", idViaje, DbType.Int32);
                parametros.Add("p_FechaInicio", detalles.FechaInicio, DbType.DateTime);
                parametros.Add("p_FechaFin", detalles.FechaFin, DbType.DateTime);
                parametros.Add("p_KilometrajeInicial", detalles.KilometrajeInicial, DbType.Double);
                parametros.Add("p_KilometrajeFinal", detalles.KilometrajeFinal, DbType.Double);
                parametros.Add("p_Observaciones", detalles.Observaciones, DbType.String);

                conexion.Execute(
                    ProcedimientosAlmacenados.InsertarDetallesViaje,
                    parametros,
                    commandType: CommandType.StoredProcedure);
            }
        }
    }
}
