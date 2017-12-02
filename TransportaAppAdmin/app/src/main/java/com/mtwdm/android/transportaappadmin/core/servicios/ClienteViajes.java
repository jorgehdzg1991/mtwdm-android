package com.mtwdm.android.transportaappadmin.core.servicios;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mtwdm.android.transportaappadmin.model.Constantes;
import com.mtwdm.android.transportaappadmin.model.entidades.Viaje;
import com.mtwdm.android.transportaappadmin.model.peticiones.PeticionActualizarEstatusViaje;
import com.mtwdm.android.transportaappadmin.model.respuestas.RespuestaApi;

import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

public class ClienteViajes {

    private static final String MODULO = "/viajes";

    public RespuestaApi<List<Viaje>> obtenerTodosViajes() throws Exception {
        String servicio = "/obtenerTodosViajes";
        String metodoHttp = "GET";

        String urlServicio = Constantes.RUTA_SERVICIO_REST + MODULO + servicio;

        URL url = new URL(urlServicio);

        HttpURLConnection conexion = (HttpURLConnection) url.openConnection();

        conexion.setRequestMethod(metodoHttp);

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

        return mapper.readValue(json, new TypeReference<RespuestaApi<List<Viaje>>>(){});
    }

    public RespuestaApi<List<Viaje>> obtenerViajesOperador(int idOperador) throws Exception {
        String servicio = "/obtenerViajesOperador";
        String metodoHttp = "GET";

        String urlServicio = Constantes.RUTA_SERVICIO_REST + MODULO + servicio;
        urlServicio += "/" + String.valueOf(idOperador);

        URL url = new URL(urlServicio);

        HttpURLConnection conexion = (HttpURLConnection) url.openConnection();

        conexion.setRequestMethod(metodoHttp);
        conexion.setRequestProperty("Content-Type", "application/json");
        conexion.setDoOutput(true);
        conexion.setDoInput(true);

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

        return mapper.readValue(json, new TypeReference<RespuestaApi<List<Viaje>>>(){});
    }

    public RespuestaApi<Viaje> obtenerDetalleViaje(int idViaje) throws Exception {
        String servicio = "/obtenerDetalleViaje";
        String metodoHttp = "GET";

        String urlServicio = Constantes.RUTA_SERVICIO_REST + MODULO + servicio;
        urlServicio += "/" + String.valueOf(idViaje);

        URL url = new URL(urlServicio);

        HttpURLConnection conexion = (HttpURLConnection) url.openConnection();

        conexion.setRequestMethod(metodoHttp);
        conexion.setRequestProperty("Content-Type", "application/json");
        conexion.setDoOutput(true);
        conexion.setDoInput(true);

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

        return mapper.readValue(json, new TypeReference<RespuestaApi<Viaje>>(){});
    }

    public RespuestaApi<Boolean> actualizarEstatusViaje(PeticionActualizarEstatusViaje peticion) throws Exception {
        String servicio = "/actualizarEstatus";
        String metodoHttp = "PUT";

        String urlServicio = Constantes.RUTA_SERVICIO_REST + MODULO + servicio;

        JSONObject cuerpoPeticion = new JSONObject();

        cuerpoPeticion.put("idViaje", peticion.idViaje);
        cuerpoPeticion.put("estatus", peticion.estatus);
        cuerpoPeticion.put("detalle", peticion.detalle);

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

        return mapper.readValue(json, new TypeReference<RespuestaApi<Boolean>>(){});
    }

}
