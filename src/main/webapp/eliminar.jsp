<%-- 
    Document   : eliminar
    Created on : 7/10/2021, 02:55:41 PM
    Author     : kenny
--%>

<%@page import="Controladores.ControlProveedor"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelos.Proveedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
        <script type="text/javascript">
            function confirmar(){
                var respuesta = confirm("¿Desea eliminar el proveedor?"); 
                if(respuesta === true){
                    return true; 
                }
                else{
                    return false; 
                }
            }
        </script>
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
                            <div class="form-floating mb-3">
                                <input type="number" class="form-control" id="floatingInput" name="nit" placeholder="name">
                                <label for="floatingInput">Nit: </label>
                            </div>
                        </div>  
                        </div>
                    </div>
                    <div class="row">
                        <center>
                            <button class="btn btn-outline-success bg-opacity-10 btnSize" name="btnAccion" value="Eliminar">Eliminar Proveedor</button>
                        </center>
                    </div>
                </div>
            </form>
        </section>
        
        <section class=" container margen">
            <table class="table table-striped table-hover">
                <thead>
                  <tr>
                    <th scope="col">Codigo</th>
                    <th scope="col">Nombre</th>
                    <th scope="col">Nit</th>
                  </tr>
                </thead>
                <tbody>
                    <% 
                        ArrayList<Proveedor> listaProveedor =  new ArrayList<>(); 
                        ControlProveedor ctrProveedor = new ControlProveedor(); 
                        listaProveedor = ctrProveedor.listar(); 
                         for(int i=0; i<listaProveedor.size();i++){
                            
                    %>
                    
                  <tr>
                    <th scope="row"><%=listaProveedor.get(i).getIdProveedor()%></th>
                    <td><%=listaProveedor.get(i).getNombres()%></td>
                    <td><%=listaProveedor.get(i).getNit()%></td>
                    <td>
                        <a href="eliminar.jsp?idProveedor=<%=listaProveedor.get(i).getIdProveedor()%>"><button class="btn btn-primary">Actualizar</button></a>
                        <a href="ControlProducto?idProveedor=<%=listaProveedor.get(i).getIdProveedor()%>&btnAccion=Eliminar"><button class="btn btn-danger" onclick="return confirmar();">Eliminar</button></a>
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
