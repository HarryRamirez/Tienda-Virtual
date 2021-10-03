/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelos;

import java.sql.PreparedStatement;

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
                   
       } catch (Exception e) {
       }
   }
   public void consultarProveedor(){
   
   }
   public void listarProveedor(){
   
   }
   public void actualizarProveedor(){
   
   }
   public void eliminarProveedor(){
   
   }
}
