﻿using System;

namespace ProyectoFinal4.Modelos.Entidades
{
    public class PosicionViaje
    {
        public int PosicionViajeId { get; set; }
        public int ViajeId { get; set; }
        public int CoordenadaId { get; set; }
        public DateTime Fecha { get; set; }

        public Coordenada Coordenada { get; set; }
    }
}
