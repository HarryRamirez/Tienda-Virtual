/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import Modelos.Proveedor;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author kenny
 */
@WebServlet(name = "ControlProveedor", urlPatterns = {"/ControlProveedor"})
public class ControlProveedor extends HttpServlet {
    Proveedor objProveedor= new Proveedor();
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String acction = request.getParameter("btnAccion");
            if (acction.equals("insertar")){
                int codigoProveedor = Integer.parseInt(request.getParameter("idProveedor"));
                String nombreProveedor = request.getParameter("nombres");
                String nitProveedor = request.getParameter("nit");
                objProveedor.setIdProveedor(codigoProveedor);
                objProveedor.setNombres(nombreProveedor);
                objProveedor.setNit(nitProveedor);
                objProveedor.crearProveedor();
                String mensaje = " <html> <body>"
                        + "<script type='text/javaScript'> "
                        + " alert('Producto insertado correctamente puto'); "
                        + " window.location.href='index.jsp'; "
                        + " </script> </body> </html>";
                out.println(mensaje);
            }
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControlProveedor</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControlProveedor at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }
    public ArrayList listar(){
        System.out.println("Listar proveedores Controladores");
        try {
            ResultSet consulta= objProveedor.consultarProveedor();
            ArrayList <Proveedor> listaProveedor= new ArrayList<>();
            
            while(consulta.next()){
                objProveedor= new Proveedor();
                objProveedor.setIdProveedor(consulta.getInt(1));
                objProveedor.setNombres(consulta.getString(2));
                objProveedor.setNit(consulta.getString(3));
                listaProveedor.add(objProveedor);
            }
            System.out.println("Proveedores: " + listaProveedor);
            return listaProveedor;
        } catch (Exception e) {
            System.out.println("Error de controlador: "+e);
        }
        return null;
        
    }
    
     public ArrayList consultar(int idProveedor){
        try {
            objProveedor.setIdProveedor(idProveedor);
            ResultSet consulta= objProveedor.consultarProveedor();
            ArrayList <Proveedor> listaProveedor= new ArrayList<>();
            
            while(consulta.next()){
                objProveedor= new Proveedor();
                objProveedor.setIdProveedor(consulta.getInt(1));
                objProveedor.setNombres(consulta.getString(2));
                objProveedor.setNit(consulta.getString(3));
                listaProveedor.add(objProveedor);
            }
            return listaProveedor;
        } catch (Exception e) {
            System.out.println("Error de controlador: "+e);
        }
        return null;
        
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
