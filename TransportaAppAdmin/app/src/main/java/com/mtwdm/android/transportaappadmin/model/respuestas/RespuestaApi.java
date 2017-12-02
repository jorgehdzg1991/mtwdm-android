package com.mtwdm.android.transportaappadmin.model.respuestas;

public class RespuestaApi<T> {

    public Boolean tieneError;
    public String mensaje;
    public int codigoEstadoHttp;
    public T datos;

}
