/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author kenny
 */
public class Conexion {
    public Connection conn;
    public String host = "localhost:3306";
    public String dataBase = "tienda_virtual";
    public String user = "root";
    public String password = "";
    
    public void conectar(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection("jdbc:mysql://"+this.host+"/"+this.dataBase+"?zeroDateTimeBehavior=CONVERT_TO_NULL",this.user,this.password);
            System.out.println("Conexion exitosa");
        } catch (Exception e) {
            System.out.println("Error de conexion: "+e);
        }
        
    }
    public void desconectar(){
        conn = null;
    }
}
