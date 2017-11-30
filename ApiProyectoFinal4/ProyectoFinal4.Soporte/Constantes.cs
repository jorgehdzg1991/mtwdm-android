using System.Configuration;

namespace ProyectoFinal4.Soporte
{
    public static class Constantes
    {
        public static string CadenaConexion =
            ConfigurationManager.ConnectionStrings["ConexionMysql"].ToString();
    }
}
