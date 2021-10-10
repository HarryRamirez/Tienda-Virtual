<%-- 
    Document   : actualizar
    Created on : 6/10/2021, 04:23:15 PM
    Author     : kenny
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Modelos.Proveedor"%>
<%@page import="Controladores.ControlProveedor"%>
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
        <%  
            String CodigoStr = request.getParameter("idProveedor"); 
            int codigo = Integer.parseInt(CodigoStr.toString());  
            ControlProveedor ctrProveedor = new ControlProveedor(); 
            ArrayList<Proveedor> consultaProveedor = new ArrayList<>(); 
            consultaProveedor = ctrProveedor.consultar(codigo); 
            
        %>
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
                                <input type="number" class="form-control" id="floatingInput" name="codigo" placeholder="name">
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
                        <button  id="size" class="btn  btn-primary m-1 bg-primary m-auto"name="btnAccion" value="Actualizar">Actualizar Proveedor</button>
                    </div>  
                </div>  
            </form>
        </section>
      <footer>
            <h4  id="cent"class="footer text-decoration-underline">Creado por Kenny Ramirez(Tienda Virtual. Mi Barrio)  </h4>
        </footer>