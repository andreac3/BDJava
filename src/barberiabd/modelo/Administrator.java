/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package barberiabd.modelo;

import barberiabd.controlador.Conexion;
import java.sql.*;

/**
 *
 * @author Andrea Calderon
 */
public class Administrator {
    static String nombre;

    public Administrator(String user) {
    }
    
    public static String findAdmin (String id_ingresado){
        try {
            Connection cn = Conexion.conectar();
            PreparedStatement pst = cn.prepareStatement(
                    "select nombre from administrador where id ='" + id_ingresado + "'");
            ResultSet rs = pst.executeQuery(); //Nos permite recoger lo que tomamos luego de leer la base de datos
            if (rs.next()) {
                nombre = rs.getString("nombre");
            }
        } catch (SQLException e) {
            System.err.println("Error en conexión desde la interfaz administrador" + e);
        }
        return nombre;
    }
}
