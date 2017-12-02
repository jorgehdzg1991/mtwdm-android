package com.mtwdm.android.transportaappadmin.gui;

import android.content.Intent;
import android.os.AsyncTask;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;

import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.widget.Spinner;
import android.widget.TextView;

import com.mtwdm.android.transportaappadmin.R;
import com.mtwdm.android.transportaappadmin.core.servicios.ClienteViajes;
import com.mtwdm.android.transportaappadmin.db.HelperBaseDatos;
import com.mtwdm.android.transportaappadmin.gui.componentes.AdapterViaje;
import com.mtwdm.android.transportaappadmin.model.entidades.Viaje;
import com.mtwdm.android.transportaappadmin.model.respuestas.RespuestaApi;

import java.util.List;

public class MainActivity extends AppCompatActivity {

    List<Viaje> viajes;
    AdapterViaje adaptador;

    Spinner spnOperador;
    RecyclerView rclvViajes;
    TextView lblNoHayRegistros;
    RecyclerView.LayoutManager layoutManager;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        spnOperador = findViewById(R.id.spnOperador);
        rclvViajes = findViewById(R.id.rclvViajes);
        lblNoHayRegistros = findViewById(R.id.lblNoHayRegistros);

        layoutManager = new LinearLayoutManager(getApplicationContext());
        rclvViajes.setLayoutManager(layoutManager);

        try {
            Intent intent = getIntent();

            if (intent.hasExtra("ES_LOGIN")) {
                Boolean esLogin = intent.getBooleanExtra("ES_LOGIN", false);

                if (!esLogin) {
                    validarSesion();
                }
            } else {
                validarSesion();
            }

            obtenerViajes();
        } catch (Exception ex) {
            mostrarMensaje(ex.getMessage(), Snackbar.LENGTH_INDEFINITE);
        }

    }

    public void mostrarMensaje(String mensaje, int length) {
        Snackbar.make(findViewById(android.R.id.content), mensaje, length)
                .show();
    }

    private void validarSesion() {
        HelperBaseDatos db = new HelperBaseDatos(getApplicationContext());

        String correo = db.obtenerConfiguracion("CORREO_SESION");

        if (correo == null) {
            navegarLogin();
        }
    }

    private void navegarLogin() {
        Intent intent = new Intent(this, LoginActivity.class);
        startActivity(intent);
    }

    private void obtenerViajes() {
        TaskObtenerTodosViajes tareaObtenerViajes = new TaskObtenerTodosViajes();
        tareaObtenerViajes.execute();
    }

    public void actualizarViajes() {
        adaptador = new AdapterViaje(viajes);
        rclvViajes.setAdapter(adaptador);

        if (viajes.isEmpty()) {
            rclvViajes.setVisibility(View.GONE);
            lblNoHayRegistros.setVisibility(View.VISIBLE);
        } else {
            rclvViajes.setVisibility(View.VISIBLE);
            lblNoHayRegistros.setVisibility(View.GONE);
        }
    }

    class TaskObtenerTodosViajes extends AsyncTask<Void, Void, Void> {

        private RespuestaApi<List<Viaje>> respuesta;

        @Override
        protected Void doInBackground(Void... voids) {
            try {
                ClienteViajes cliente = new ClienteViajes();
                respuesta = cliente.obtenerTodosViajes();
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
                    viajes = respuesta.datos;
                    actualizarViajes();
                } else {
                    mostrarMensaje("Error al cargar los viajes.", Snackbar.LENGTH_INDEFINITE);
                }
            }
        }
    }

}
