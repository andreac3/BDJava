/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package barberiabd.controlador;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Andrea Calderon y Daniela Monsalve
 */
public class Conexion {
    public static Connection conectar(){
        try{
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost/database_links", "root", "");
            return cn;
        } catch (SQLException e){
            System.out.println("Error en la conexión local" + e);
        }
        return (null);
    }
}
