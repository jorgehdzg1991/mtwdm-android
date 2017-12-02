package com.mtwdm.android.transportaappadmin.core.servicios;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mtwdm.android.transportaappadmin.model.Constantes;
import com.mtwdm.android.transportaappadmin.model.entidades.Usuario;
import com.mtwdm.android.transportaappadmin.model.peticiones.PeticionObtenerUsuarioCredencial;
import com.mtwdm.android.transportaappadmin.model.respuestas.RespuestaApi;

import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

public class ClienteUsuarios {

    private static final String MODULO = "/usuarios";

    public RespuestaApi<Usuario> obtenerUsuarioCredencial(PeticionObtenerUsuarioCredencial peticion) throws Exception {
        String servicio = "/obtenerUsuarioCredencial";
        String metodoHttp = "POST";

        String urlServicio = Constantes.RUTA_SERVICIO_REST + MODULO + servicio;

        JSONObject cuerpoPeticion = new JSONObject();

        cuerpoPeticion.put("correo", peticion.correo);
        cuerpoPeticion.put("contrasena", peticion.contrasena);

        URL url = new URL(urlServicio);

        HttpURLConnection conexion = (HttpURLConnection) url.openConnection();

        conexion.setRequestMethod(metodoHttp);
        conexion.setRequestProperty("Content-Type", "application/json");
        conexion.setDoOutput(true);
        conexion.setDoInput(true);

        OutputStreamWriter wr = new OutputStreamWriter(conexion.getOutputStream());
        wr.write(cuerpoPeticion.toString());
        wr.flush();

        StringBuilder sb = new StringBuilder();

        BufferedReader br = new BufferedReader(
                new InputStreamReader(conexion.getInputStream(), "utf-8"));

        String salida;

        while ((salida = br.readLine()) != null) {
            sb.append(salida).append("\n");
        }

        br.close();

        String json = sb.toString();

        conexion.disconnect();

        ObjectMapper mapper = new ObjectMapper();

        return mapper.readValue(json, new TypeReference<RespuestaApi<Usuario>>(){});
    }

}
