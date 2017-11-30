using System;
using System.Data;
using Dapper;
using MySql.Data.MySqlClient;
using ProyectoFinal4.Soporte;

namespace ProyectoFinal4.AccesoDatos
{
    public class PosicionesViajesDAO
    {
        public static void InsertarPosicionViaje(
            int idViaje, string fecha, double latitud, double longitud)
        {
            using (var conexion = new MySqlConnection(Constantes.CadenaConexion))
            {
                var parametros = new DynamicParameters();

                parametros.Add("p_ViajesId", idViaje, DbType.Int32);
                parametros.Add("p_Fecha", fecha, DbType.DateTime);
                parametros.Add("p_Latitud", latitud, DbType.Double);
                parametros.Add("p_Longitud", longitud, DbType.Double);

                conexion.Execute(
                    ProcedimientosAlmacenados.InsertarPosicionesViaje,
                    parametros,
                    commandType: CommandType.StoredProcedure);
            }
        }
    }
}