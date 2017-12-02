package com.mtwdm.android.transportaappadmin.model.peticiones;

public class PeticionObtenerUsuarioCredencial {

    public String correo;
    public String contrasena;

    public PeticionObtenerUsuarioCredencial(String correo, String contrasena) {
        this.correo = correo;
        this.contrasena = contrasena;
    }
}
