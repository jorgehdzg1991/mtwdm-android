using System.Security.Cryptography;
using System.Text;

namespace ProyectoFinal4.Soporte
{
    public static class Criptografia
    {
        public static string CrearMD5(string input)
        {
            using (var md5 = MD5.Create())
            {
                var inputBytes = Encoding.ASCII.GetBytes(input);
                var hashBytes = md5.ComputeHash(inputBytes);

                var sb = new StringBuilder();

                foreach (var b in hashBytes)
                    sb.Append(b.ToString("X2"));

                return sb.ToString();
            }
        }
    }
}