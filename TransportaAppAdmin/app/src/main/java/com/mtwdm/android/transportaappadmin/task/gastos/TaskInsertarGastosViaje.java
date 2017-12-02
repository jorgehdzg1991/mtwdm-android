package com.mtwdm.android.transportaappadmin.task.gastos;

import android.os.AsyncTask;

import com.mtwdm.android.transportaappadmin.core.servicios.ClienteGastos;
import com.mtwdm.android.transportaappadmin.model.peticiones.PeticionInsertarGastosViaje;
import com.mtwdm.android.transportaappadmin.model.respuestas.RespuestaApi;

public class TaskInsertarGastosViaje extends AsyncTask<Void, Void, Void> {

    private PeticionInsertarGastosViaje peticion;
    private RespuestaApi<Boolean> respuesta;

    @Override
    protected Void doInBackground(Void... voids) {
        try {
            ClienteGastos cliente = new ClienteGastos();
            respuesta = cliente.insertarGastosViaje(peticion);
        } catch (Exception ex) {
            respuesta = new RespuestaApi<>();

            respuesta.tieneError = true;
            respuesta.codigoEstadoHttp = 400;
            respuesta.mensaje = "Ha ocurrido un error en la aplicación.\n\nMensaje de la exepción: " + ex.getMessage();
        }

        return null;
    }

    @Override
    protected void onPostExecute(Void aVoid) {
        super.onPostExecute(aVoid);

        if (respuesta != null) {
            if (!respuesta.tieneError) {
                //TODO: Navegar a la actividad inicial
            } else {
                //TODO: Notificar mensaje del error
            }
        }
    }
}
