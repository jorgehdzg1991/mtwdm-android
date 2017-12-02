package com.mtwdm.android.transportaappadmin.task.viajes;

import android.os.AsyncTask;

import com.mtwdm.android.transportaappadmin.core.servicios.ClienteViajes;
import com.mtwdm.android.transportaappadmin.model.entidades.Viaje;
import com.mtwdm.android.transportaappadmin.model.respuestas.RespuestaApi;

public class TaskObtenerDetalleViaje extends AsyncTask<Void, Void, Void> {

    private int idViaje;
    private RespuestaApi<Viaje> respuesta;

    public TaskObtenerDetalleViaje(int idViaje) {
        this.idViaje = idViaje;
    }

    @Override
    protected Void doInBackground(Void... voids) {
        try {
            ClienteViajes cliente = new ClienteViajes();
            respuesta = cliente.obtenerDetalleViaje(idViaje);
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
                //TODO: Navegar a la actividad de detalle de viaje
            } else {
                //TODO: Notificar mensaje del error
            }
        }
    }
}
