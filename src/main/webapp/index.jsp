<%-- 
    Document   : index
    Created on : 5/10/2021, 08:20:47 PM
    Author     : kenny
--%>

<%@page import="Controladores.ControlProveedor"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelos.Proveedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Mi Barrio</title>
        <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
        <link href="assets/StyleCss/estilos1.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Gluten:wght@700&family=Shrikhand&display=swap" rel="stylesheet">
    </head>
   
    <body>
        <header>
            <div class="container-xxl bg-primary m-1  ">
                <h1>Mi Barrio.</h1>
            </div>
        </header>
        <section>
            <form method="POST" action="ControlProveedor">
                <div class="container">
                    <div class="row">
                        <div class="col">
                            <div class="form-floating mb-3">
                                <input type="number" class="form-control" id="floatingInput" name="idProveedor" placeholder="name">
                                <label for="floatingInput">Codigo: </label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="floatingInput" name="nombres" placeholder="name">
                                <label for="floatingInput">Nombre: </label>
                            </div>
                        </div>
                        <div class="col">
                             <div class="form-floating mb-3">
                                <input type="number" class="form-control" id="floatingInput" name="nit" placeholder="name">
                                <label for="floatingInput">Nit: </label>
                            </div>
                        </div>  
                    </div> 
                    <div class="row">
                        <button  id="size" class="btn  btn-primary m-1 bg-primary m-auto"name="btnAccion" value="insertar">Insertar Proveedor</button>
                    </div>  
                </div>  
            </form>
        </section>
        <section class="container margen">
            <table class="table table-striped table-hover">
                <thead>
                  <tr>
                    <th scope="col">Codigo</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Nit</th>
                     <th scope="col">Accion</th>
                  </tr>
                </thead>
                <tbody>
                    <%
                        ArrayList<Proveedor> listaProveedor= new ArrayList();
                        ControlProveedor ctrProveedor= new ControlProveedor();
                        listaProveedor= ctrProveedor.listar();
                        
                        for(int i=0; i<listaProveedor.size(); i++){
                      
                    %>
                  <tr>
                    <th scope="row"><%=listaProveedor.get(i).getIdProveedor()%></th>
                    <td><%=listaProveedor.get(i).getNombres()%></td>
                    <td><%=listaProveedor.get(i).getNit()%></td>
                    <td>
                        <a href="actualizar.jsp?idProveedor=<%=listaProveedor.get(i).getIdProveedor()%>"><button class="btn btn-primary m-1">Actualizar</button></a>
                        <a href="ControlProveedor?idProveedor=<%=listaProveedor.get(i).getIdProveedor()%>"><button class="btn btn-danger">Eliminar</button></a>
                    </td> 
                  </tr>
                  <%}%>
                </tbody>
              </table>
        </section>
        <footer>
            <h4  id="cent"class="footer text-decoration-underline">Creado por Kenny Ramirez(Tienda Virtual. Mi Barrio)  </h4>
        </footer>
    </body>
</html>
