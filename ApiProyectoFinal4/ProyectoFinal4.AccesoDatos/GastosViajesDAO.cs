using System.Data;
using Dapper;
using MySql.Data.MySqlClient;
using ProyectoFinal4.Soporte;
using ProyectoFinal4.Modelos.Entidades;

namespace ProyectoFinal4.AccesoDatos
{
    public static class GastosViajesDAO
    {
        public static void InsertarGastoViaje(int idViaje, GastoViaje gasto)
        {
            using (var conexion = new MySqlConnection(Constantes.CadenaConexion))
            {
                var parametros = new DynamicParameters();

                parametros.Add("p_ViajesId", idViaje, DbType.Int32);
                parametros.Add("p_TipoGastoId", gasto.ClaveTipoGasto,DbType.Int32);
                parametros.Add("p_Monto", gasto.Monto, DbType.Int32);

                conexion.Execute(
                    ProcedimientosAlmacenados.InsertarGastoViaje,
                    parametros,
                    commandType: CommandType.StoredProcedure);
            }
        }
    }
}
