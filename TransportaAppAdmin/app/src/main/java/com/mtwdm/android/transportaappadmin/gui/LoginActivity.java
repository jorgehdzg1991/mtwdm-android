package com.mtwdm.android.transportaappadmin.gui;

import android.content.Intent;
import android.os.AsyncTask;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import com.mtwdm.android.transportaappadmin.R;
import com.mtwdm.android.transportaappadmin.core.servicios.ClienteUsuarios;
import com.mtwdm.android.transportaappadmin.db.HelperBaseDatos;
import com.mtwdm.android.transportaappadmin.model.entidades.Usuario;
import com.mtwdm.android.transportaappadmin.model.peticiones.PeticionObtenerUsuarioCredencial;
import com.mtwdm.android.transportaappadmin.model.respuestas.RespuestaApi;

public class LoginActivity extends AppCompatActivity {

    EditText txtCorreo;
    EditText txtContrasena;
    Button btnIniciarSesion;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        txtCorreo = findViewById(R.id.txtCorreo);
        txtContrasena = findViewById(R.id.txtContrasena);
        btnIniciarSesion = findViewById(R.id.btnIniciarSesion);

        btnIniciarSesion.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String correo = txtCorreo.getText().toString();
                String contrasena = txtContrasena.getText().toString();

                PeticionObtenerUsuarioCredencial peticion = new PeticionObtenerUsuarioCredencial(correo, contrasena);

                TaskObtenerUsuarioCredencial tareaObtenerUsuarioCredencial = new TaskObtenerUsuarioCredencial(peticion);

                tareaObtenerUsuarioCredencial.execute();
            }
        });
    }

    public void mostrarMensaje(String mensaje, int length) {
        Snackbar.make(findViewById(android.R.id.content), mensaje, length).show();
    }

    public void guardarCacheUsuario(Usuario usuario) {
        HelperBaseDatos db = new HelperBaseDatos(getApplicationContext());

        db.insertarConfiguracion("CORREO_SESION", usuario.correo);
        db.insertarConfiguracion("CONTRASENA_SESION", usuario.contrasena);
        db.insertarConfiguracion("NOMBRE_SESION", usuario.nombre);
    }

    public void navegarMainActivity() {
        Intent intent = new Intent(this, MainActivity.class);

        intent.putExtra("ES_LOGIN", true);

        startActivity(intent);
    }

    class TaskObtenerUsuarioCredencial extends AsyncTask<Void, Void, Void> {

        private PeticionObtenerUsuarioCredencial peticion;
        private RespuestaApi<Usuario> respuesta = new RespuestaApi<>();

        public TaskObtenerUsuarioCredencial(PeticionObtenerUsuarioCredencial peticion) {
            this.peticion = peticion;
        }

        @Override
        protected Void doInBackground(Void... voids) {
            try {
                ClienteUsuarios modulo = new ClienteUsuarios();
                respuesta = modulo.obtenerUsuarioCredencial(peticion);
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

            try {
                if (respuesta != null) {
                    if (!respuesta.tieneError) {
                        guardarCacheUsuario(respuesta.datos);
                        navegarMainActivity();
                    } else {
                        mostrarMensaje("Error de usuario o contraseña.", Snackbar.LENGTH_INDEFINITE);
                    }
                }
            } catch (Exception ex) {
                mostrarMensaje(ex.getMessage(), Snackbar.LENGTH_INDEFINITE);
            }
        }
    }
}
