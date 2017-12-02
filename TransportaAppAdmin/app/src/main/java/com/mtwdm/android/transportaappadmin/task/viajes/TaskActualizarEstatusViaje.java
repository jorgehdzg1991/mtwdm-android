package com.mtwdm.android.transportaappadmin.task.viajes;

import android.os.AsyncTask;

import com.mtwdm.android.transportaappadmin.core.servicios.ClienteViajes;
import com.mtwdm.android.transportaappadmin.model.peticiones.PeticionActualizarEstatusViaje;
import com.mtwdm.android.transportaappadmin.model.respuestas.RespuestaApi;

public class TaskActualizarEstatusViaje extends AsyncTask<Void, Void, Void> {

    private PeticionActualizarEstatusViaje peticion;
    private RespuestaApi<Boolean> respuesta;

    public TaskActualizarEstatusViaje(PeticionActualizarEstatusViaje peticion) {
        this.peticion = peticion;
    }

    @Override
    protected Void doInBackground(Void... voids) {
        try {
            ClienteViajes cliente = new ClienteViajes();
            respuesta = cliente.actualizarEstatusViaje(peticion);
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
                //TODO: Manejar cambio de estatus de viaje
            } else {
                //TODO: Notificar mensaje del error
            }
        }
    }
}
