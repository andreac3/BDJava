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
public class Barber {

    static String nombre;
    static int identificacion,maquinaAsig,porcentajeComi,telefono,contraseña;

    public Barber() {
    }
    
    public static String findBarber (String id_ingresado){
        try {
            Connection cn = Conexion.conectar();
            PreparedStatement pst = cn.prepareStatement(
                    "select nombre from barbero where id ='" + id_ingresado + "'");
            ResultSet rs = pst.executeQuery(); //Nos permite recoger lo que tomamos luego de leer la base de datos
            if (rs.next()) {
                nombre = rs.getString("nombre");
            }
        } catch (SQLException e) {
            System.err.println("Error en conexión desde la interfaz administrador" + e);
        }
        return nombre;
    }
    public static int findID (String id_ingresado){
        try {
            Connection cn = Conexion.conectar();
            PreparedStatement pst = cn.prepareStatement(
                    "select id from barbero where id ='" + id_ingresado + "'");
            ResultSet rs = pst.executeQuery(); //Nos permite recoger lo que tomamos luego de leer la base de datos
            if (rs.next()) {
                identificacion = rs.getInt("id");
            }
        } catch (SQLException e) {
            System.err.println("Error en conexión desde la interfaz administrador" + e);
        }
        return identificacion;
    }
    public static int findMaquina (String id_ingresado){
        try {
            Connection cn = Conexion.conectar();
            PreparedStatement pst = cn.prepareStatement(
                    "select maquinaAsignada from barbero where id ='" + id_ingresado + "'");
            ResultSet rs = pst.executeQuery(); //Nos permite recoger lo que tomamos luego de leer la base de datos
            if (rs.next()) {
                maquinaAsig = rs.getInt("maquinaAsignada");
            }
        } catch (SQLException e) {
            System.err.println("Error en conexión desde la interfaz administrador" + e);
        }
        return maquinaAsig;
    }
    public static int findPorcentaje (String id_ingresado){
        try {
            Connection cn = Conexion.conectar();
            PreparedStatement pst = cn.prepareStatement(
                    "select porcentajeComision from barbero where id ='" + id_ingresado + "'");
            ResultSet rs = pst.executeQuery(); //Nos permite recoger lo que tomamos luego de leer la base de datos
            if (rs.next()) {
                porcentajeComi = rs.getInt("porcentajeComision");
            }
        } catch (SQLException e) {
            System.err.println("Error en conexión desde la interfaz administrador" + e);
        }
        return porcentajeComi;
    }
    public static int findTel (String id_ingresado){
        try {
            Connection cn = Conexion.conectar();
            PreparedStatement pst = cn.prepareStatement(
                    "select telefono from barbero where id ='" + id_ingresado + "'");
            ResultSet rs = pst.executeQuery(); //Nos permite recoger lo que tomamos luego de leer la base de datos
            if (rs.next()) {
                telefono = rs.getInt("telefono");
            }
        } catch (SQLException e) {
            System.err.println("Error en conexión desde la interfaz administrador" + e);
        }
        return telefono;
    }
    public static int findContraseña (String id_ingresado){
        try {
            Connection cn = Conexion.conectar();
            PreparedStatement pst = cn.prepareStatement(
                    "select contraseña from barbero where id ='" + id_ingresado + "'");
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
