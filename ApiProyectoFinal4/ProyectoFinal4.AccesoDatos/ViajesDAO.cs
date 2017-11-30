using System.Data;
using System.Linq;
using System.Collections.Generic;
using Dapper;
using MySql.Data.MySqlClient;
using ProyectoFinal4.Soporte;
using ProyectoFinal4.Modelos.Entidades;

namespace ProyectoFinal4.AccesoDatos
{
    public static class ViajesDAO
    {
        public static void ActualizarEstatusViaje(
            int idViaje, EstatusViaje estatus)
        {
            using (var conexion = new MySqlConnection(Constantes.CadenaConexion))
            {
                var parametros = new DynamicParameters();

                parametros.Add("p_ViajesId", idViaje, DbType.Int32);
                parametros.Add("p_EstatusViaje", estatus, DbType.Int32);

                conexion.Execute(
                    ProcedimientosAlmacenados.ActualizarEstatusViaje,
                    parametros,
                    commandType: CommandType.StoredProcedure);
            }
        }

        public static List<Viaje> ObtenerViajesOperador(int idOperador)
        {
            using (var conexion = new MySqlConnection(Constantes.CadenaConexion))
            {
                var parametros = new DynamicParameters();

                parametros.Add("p_OperadorId", idOperador, DbType.Int32);

                return conexion.Query<Viaje>(
                    ProcedimientosAlmacenados.ObtenerViajesOperador,
                    parametros,
                    commandType: CommandType.StoredProcedure).AsList();
            }
        }

        public static Viaje ObtenerDetalleViaje(int idViaje)
        {
            using (var conexion = new MySqlConnection(Constantes.CadenaConexion))
            {
                var parametros = new DynamicParameters();

                parametros.Add("p_ViajesId", idViaje, DbType.Int32);

                using (var consulta = conexion.QueryMultiple(
                    ProcedimientosAlmacenados.ObtenerDetalleViaje,
                    parametros,
                    commandType: CommandType.StoredProcedure))
                {
                    var viaje = consulta.Read<Viaje>().FirstOrDefault();

                    viaje.Detalle = consulta.Read<DetalleViaje>().FirstOrDefault();
                    viaje.Gastos = consulta.Read<GastoViaje>().AsList();
                    viaje.Posiciones = consulta
                        .Read<PosicionViaje, Coordenada, PosicionViaje>(
                            (posicion, coordenada) =>
                    {
                        posicion.Coordenada = coordenada;
                        return posicion;
                    }).AsList();

                    return viaje;
                }
            }
        }

        public static List<Viaje> ObtenerTodosViajes()
        {
            using (var conexion = new MySqlConnection(Constantes.CadenaConexion))
            {
                return conexion.Query<Viaje>(
                    ProcedimientosAlmacenados.ObtenerTodosViajes,
                    commandType: CommandType.StoredProcedure).AsList();
            }
        }
    }
}
