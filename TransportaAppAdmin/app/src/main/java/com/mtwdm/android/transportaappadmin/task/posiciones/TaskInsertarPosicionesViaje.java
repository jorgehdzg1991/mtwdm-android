package com.mtwdm.android.transportaappadmin.task.posiciones;

import android.os.AsyncTask;

import com.mtwdm.android.transportaappadmin.core.servicios.ClientePosiciones;
import com.mtwdm.android.transportaappadmin.model.peticiones.PeticionInsertarPosicionesViaje;
import com.mtwdm.android.transportaappadmin.model.respuestas.RespuestaApi;

/**
 * Created by jorgehernandezgarcia on 01/12/17.
 */

public class TaskInsertarPosicionesViaje extends AsyncTask<Void, Void, Void> {

    private PeticionInsertarPosicionesViaje peticion;
    private RespuestaApi<Boolean> respuesta;

    public TaskInsertarPosicionesViaje(PeticionInsertarPosicionesViaje peticion) {
        this.peticion = peticion;
    }

    @Override
    protected Void doInBackground(Void... voids) {
        try {
            ClientePosiciones cliente = new ClientePosiciones();
            respuesta = cliente.insertarPosicionesViaje(peticion);
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
                //TODO: Manejar inserción de posiciones del viaje
            } else {
                //TODO: Notificar mensaje del error
            }
        }
    }
}
