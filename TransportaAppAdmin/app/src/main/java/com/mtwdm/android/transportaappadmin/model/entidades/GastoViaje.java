package com.mtwdm.android.transportaappadmin.model.entidades;

public class GastoViaje {

    public int gastoViajeId;
    public int viajeId;
    public int claveTipoGasto;
    public double monto;

    public String getDescripcionTipoGasto() throws Exception {
        switch (claveTipoGasto) {
            case TipoGasto.GASOLINA:
                return "Gasolina";
            case TipoGasto.CASETAS:
                return "Casetas";
            case TipoGasto.ALIMENTOS:
                return "Alimentos";
            case TipoGasto.HOSPEDAJE:
                return "Hospedaje";
            case TipoGasto.OTROS:
                return "Otros";
            default:
                throw new Exception("Tipo de gasto desconocido");
        }
    }

}
