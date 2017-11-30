using ProyectoFinal4.AccesoDatos;
using ProyectoFinal4.Modelos.Entidades;
using ProyectoFinal4.Soporte;

namespace ProyectoFinal4.LogicaNegocio
{
    public static class UsuariosBL
    {
        public static Usuario ObtenerUsuarioPorCredencial(
            string correo, string contrasena)
        {
            var contrasenaEncriptadaMD5 = Criptografia.CrearMD5(contrasena);

            return UsuariosDAO.ObtenerUsuarioCredenciales(
                correo, contrasenaEncriptadaMD5);
        }
    }
}
