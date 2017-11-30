﻿using System;
using System.Collections.Generic;
using ProyectoFinal4.AccesoDatos;
using ProyectoFinal4.Modelos.Entidades;

namespace ProyectoFinal4.LogicaNegocio
{
    public static class PosicionesViajesBL
    {
        public static void InsertarPosicionesViaje(int idViaje, List<PosicionViaje> posiciones)
        {
            foreach (var posicion in posiciones)
            {
                var coordenada = posicion.Coordenada;

                var fechaFormato = String.Format("{0:yyyy-MM-dd HH:mm:ss}", posicion.Fecha);

                PosicionesViajesDAO.InsertarPosicionViaje(
                    idViaje, fechaFormato, coordenada.Latitud, coordenada.Longitud);
            }
        }
    }
}