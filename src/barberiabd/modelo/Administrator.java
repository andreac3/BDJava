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
    static int telefono, contraseña;
            

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
    public static int findTelefono (String id_ingresado){
        try {
            Connection cn = Conexion.conectar();
            PreparedStatement pst = cn.prepareStatement(
                    "select telefono from administrador where id ='" + id_ingresado + "'");
            ResultSet rs = pst.executeQuery(); //Nos permite recoger lo que tomamos luego de leer la base de datos
            if (rs.next()) {
                telefono = rs.getInt("telefono");
            }
        } catch (SQLException e) {
            System.err.println("Error en conexión desde la interfaz administrador" + e);
        }
        return telefono;
    }
    public static int findContraseña(String id_ingresado){
        try {
            Connection cn = Conexion.conectar();
            PreparedStatement pst = cn.prepareStatement(
                    "select contraseña from administrador where id ='" + id_ingresado + "'");
            ResultSet rs = pst.executeQuery(); //Nos permite recoger lo que tomamos luego de leer la base de datos
            if (rs.next()) {
                contraseña = rs.getInt("contraseña");
            }
        } catch (SQLException e) {
            System.err.println("Error en conexión desde la interfaz administrador" + e);
        }
        return contraseña;
    }
}
