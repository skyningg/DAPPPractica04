package org.uv.modelo;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConexionPG {
    private static final String URL = "jdbc:postgresql://localhost:5432/empresa";
    private static final String USER = "postgres";
    private static final String PASS = "1234";

    public static Connection getConexion() throws Exception {
        Class.forName("org.postgresql.Driver");
        return DriverManager.getConnection(URL, USER, PASS);
    }
}
