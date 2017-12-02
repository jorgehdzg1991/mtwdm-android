package com.mtwdm.android.transportaappadmin.db;

import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

import com.mtwdm.android.transportaappadmin.model.entidades.Coordenada;
import com.mtwdm.android.transportaappadmin.model.entidades.PosicionViaje;

import java.util.ArrayList;
import java.util.List;

public class HelperBaseDatos extends SQLiteOpenHelper {

    private static final int VERSION_BD = 3;
    private static final String NOMBRE_BD = "TransportaAppAdmin";

    public HelperBaseDatos(Context context) {
        super(context, NOMBRE_BD, null, VERSION_BD);
    }

    @Override
    public void onCreate(SQLiteDatabase sqLiteDatabase) {
        String sql = CodigoSQL.SQL_CREAR_TABLAS;

        String[] comandos = sql.split(";");

        for (String comando: comandos) {
            sqLiteDatabase.execSQL(comando);
        }
    }

    @Override
    public void onUpgrade(SQLiteDatabase sqLiteDatabase, int i, int i1) {
        sqLiteDatabase.execSQL(CodigoSQL.SQL_BORRAR_TABLAS);
        sqLiteDatabase.execSQL(CodigoSQL.SQL_CREAR_TABLAS);
    }

    public String obtenerConfiguracion(String clave) {
        SQLiteDatabase db = this.getReadableDatabase();

        String sql = String.format(CodigoSQL.SQL_OBTENER_CONFIGURACION, clave);

        Cursor consulta = db.rawQuery(sql, null);

        if (consulta.getCount() == 0)
            return null;

        consulta.moveToFirst();

        String valor = consulta.getString(consulta.getColumnIndex("valor"));

        consulta.close();

        return valor;
    }

    public void insertarConfiguracion(String clave, String valor) {
        SQLiteDatabase db = this.getWritableDatabase();

        String sql = String.format(CodigoSQL.SQL_INSERTAR_CONFIGURACION, clave, clave, valor);

        String[] comandos = sql.split(";");

        for (String comando: comandos) {
            db.execSQL(comando);
        }
    }

    public void insertarPosicion(PosicionViaje posicion) {
        SQLiteDatabase db = this.getWritableDatabase();

        String sql = String.format(CodigoSQL.SQL_INSERTAR_POSICION_VIAJE,
                String.valueOf(posicion.viajeId),
                String.valueOf(posicion.coordenada.latitud),
                String.valueOf(posicion.coordenada.longitud),
                posicion.fecha);

        db.execSQL(CodigoSQL.SQL_INSERTAR_POSICION_VIAJE);
    }

    public List<PosicionViaje> obtenerPosicionesViaje(int idViaje) {
        SQLiteDatabase db = this.getReadableDatabase();

        String sql = String.format(CodigoSQL.SQL_OBTENER_POSICIONES_VIAJE, String.valueOf(idViaje));

        Cursor consulta = db.rawQuery(sql, null);

        List<PosicionViaje> posicionesViaje = new ArrayList<>();

        int numeroRenglones = consulta.getCount();

        for (int i = 0; i < numeroRenglones; i++) {
            consulta.move(i);

            PosicionViaje posicion = new PosicionViaje();
            posicion.coordenada = new Coordenada();

            posicion.viajeId = consulta.getInt(consulta.getColumnIndex("viajeId"));
            posicion.coordenada.latitud = consulta.getDouble(consulta.getColumnIndex("latitud"));
            posicion.coordenada.longitud = consulta.getDouble(consulta.getColumnIndex("longitud"));
            posicion.fecha = consulta.getString(consulta.getColumnIndex("fecha"));

            posicionesViaje.add(posicion);
        }

        consulta.close();

        return posicionesViaje;
    }

}
