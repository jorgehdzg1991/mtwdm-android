package com.mtwdm.android.transportaappadmin.task.viajes;

import android.os.AsyncTask;

import com.mtwdm.android.transportaappadmin.core.servicios.ClienteViajes;
import com.mtwdm.android.transportaappadmin.model.entidades.Viaje;
import com.mtwdm.android.transportaappadmin.model.respuestas.RespuestaApi;

import java.util.List;

public class TaskObtenerViajesOperador extends AsyncTask<Void, Void, Void> {

    private int idOperador;
    private RespuestaApi<List<Viaje>> respuesta;

    public TaskObtenerViajesOperador(int idOperador) {
        this.idOperador = idOperador;
    }

    @Override
    protected Void doInBackground(Void... voids) {
        try {
            ClienteViajes cliente = new ClienteViajes();
            respuesta = cliente.obtenerViajesOperador(idOperador);
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
        if (respuesta != null) {
            if (!respuesta.tieneError) {
                //TODO: Mostrar listado de viajes del operador en el fragment
            } else {
                //TODO: Notificar mensaje del error
            }
        }
    }
}
