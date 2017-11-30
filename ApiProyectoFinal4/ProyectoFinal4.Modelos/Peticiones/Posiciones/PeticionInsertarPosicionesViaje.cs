using System.Collections.Generic;
using ProyectoFinal4.Modelos.Entidades;

namespace ProyectoFinal4.Modelos.Peticiones.Posiciones
{
    public class PeticionInsertarPosicionesViaje
    {
        public int IdViaje { get; set; }
        public List<PosicionViaje> Posiciones { get; set; }
    }
}