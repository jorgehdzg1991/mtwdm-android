package com.mtwdm.android.transportaappadmin.db;

class CodigoSQL {

    static final String SQL_CREAR_TABLAS =
            "CREATE TABLE IF NOT EXISTS tbl_posiciones (viajeId INTEGER, latitud REAL, longitud REAL, fecha TEXT); " +
            "CREATE TABLE IF NOT EXISTS tbl_configuraciones (clave TEXT, valor TEXT);";

    static final String SQL_BORRAR_TABLAS =
            "DROP TABLE IF EXISTS tbl_posiciones;";

    static final String SQL_INSERTAR_POSICION_VIAJE =
            "INSERT INTO tbl_posiciones (viajeId, latitud, longitud, fecha) VALUES (%s, %s, %s, '%s');";

    static final String SQL_OBTENER_POSICIONES_VIAJE =
            "SELECT * FROM tbl_posiciones WHERE viajeId = %s;";

    static final String SQL_INSERTAR_CONFIGURACION =
            "DELETE FROM tbl_configuraciones WHERE clave = '%s';" +
            "INSERT INTO tbl_configuraciones (clave, valor) VALUES ('%s', '%s');";

    static final String SQL_OBTENER_CONFIGURACION =
            "SELECT valor FROM tbl_configuraciones WHERE clave = '%s';";
}
