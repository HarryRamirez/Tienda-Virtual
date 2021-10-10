/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author kenny
 */
public class Proveedor {
   int idProveedor;
   String nombres;
   String  nit;

    public Proveedor() {
    }

    public int getIdProveedor() {
        return idProveedor;
    }

    public void setIdProveedor(int idProveedor) {
        this.idProveedor = idProveedor;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getNit() {
        return nit;
    }

    public void setNit(String nit) {
        this.nit = nit;
    }
   public void crearProveedor(){
       System.out.println("Crear proveedor");
       Conexion objConector = new Conexion();
       objConector.conectar();
       
       try {
           String sql= "INSERT INTO Proveedor"
                   +"(idProveedor, nombres, nit)"
                   +"VALUES(?,?,?);";
           PreparedStatement stmt;
           stmt = objConector.conn.prepareStatement(sql);
           stmt.setString(1,String.valueOf(this.idProveedor));
           stmt.setString(2,this.nombres);
           stmt.setString(3,this.nit);
           stmt.execute();
           objConector.desconectar();
                   
       } catch (Exception e) {
           System.out.println("error al insertar: "+ e);
       }
   }
   public ResultSet consultarProveedor(){
        Conexion objConector = new Conexion();
       objConector.conectar();
       
       try {
          String sql="SELECT * FROM Proveedor";
          PreparedStatement stmt;
          stmt= objConector.conn.prepareStatement(sql);
          ResultSet consulta= stmt.executeQuery();
          objConector.desconectar();
           System.out.println(consulta);
          return consulta;
       } catch (Exception e) {
           System.out.println("Error modelo: "+e);
       }
       return null;
   }
   public ResultSet listarProveedor(){
       Conexion objConector = new Conexion();
       objConector.conectar();
       try {
          String sql="SELECT * FROM Proveedor WHERE idProveedor= ?";
          PreparedStatement stmt;
          stmt= objConector.conn.prepareStatement(sql);
          stmt.setInt(1, this.idProveedor);
          ResultSet consulta= stmt.executeQuery();
          objConector.desconectar();
          return consulta;
       } catch (Exception e) {
           System.out.println("Error modelo: "+e);
       }
       return null;
   }
   public void actualizarProveedor(){
   
   }
   public void eliminarProveedor(){
   
   }
}
