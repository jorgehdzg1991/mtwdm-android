using System.Data;
using System.Linq;
using Dapper;
using MySql.Data.MySqlClient;
using ProyectoFinal4.Soporte;
using ProyectoFinal4.Modelos.Entidades;

namespace ProyectoFinal4.AccesoDatos
{
    public static class UsuariosDAO
    {
        public static Usuario ObtenerUsuarioCredenciales(
            string correo, string contrasena)
        {
            using (var conexion = new MySqlConnection(Constantes.CadenaConexion))
            {
                var parametros = new DynamicParameters();

                parametros.Add("p_Correo", correo, DbType.String);
                parametros.Add("p_Contrasena", contrasena, DbType.String);

                return conexion
                    .Query<Usuario>(
                        ProcedimientosAlmacenados.ObtenerUsuarioPorCredenciales,
                        parametros,
                        commandType: CommandType.StoredProcedure)
                    .FirstOrDefault();
            }
        }
    }
}
