using System.Collections.Generic;
using ProyectoFinal4.Modelos.Entidades;

namespace ProyectoFinal4.Modelos.Peticiones.Gastos
{
    public class PeticionInsertarGastoViaje
    {
        public int IdViaje { get; set; }
        public List<GastoViaje> Gastos { get; set; }
    }
}
