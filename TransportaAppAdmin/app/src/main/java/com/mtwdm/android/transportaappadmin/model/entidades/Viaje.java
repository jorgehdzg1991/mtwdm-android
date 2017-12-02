package com.mtwdm.android.transportaappadmin.model.entidades;

import java.util.List;

public class Viaje {

    public int viajeId;
    public int operadorId;
    public String origen;
    public String destino;
    public String fecha;
    public int claveEstatusViaje;
    public String descripcionEstatusViaje;
    public DetalleViaje detalle;
    public List<GastoViaje> gastos;
    public List<PosicionViaje> posiciones;
    
}
