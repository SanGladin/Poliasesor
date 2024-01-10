<%-- 
    Document   : error
    Created on : 24/11/2021, 09:30:20 PM
    Author     : Administrador
--%>

<%@page import="Modelo.CNotificaciones"%>
<%@page import="Control.AccionesUsuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<% HttpSession sesionCliente = request.getSession();
    String usuario = (String) session.getAttribute("usuario");
    String privilegio = (String) session.getAttribute("privilegio");
    String rol = (String) session.getAttribute("rol");
    System.out.println(usuario);
    System.out.println(privilegio);
    System.out.println(rol);
     if(usuario != null){
       if(privilegio == "2"){
         
       }else{
           response.sendRedirect("Inicio.jsp");
       }
    }else{
         response.sendRedirect("Inicio.jsp");
    }

 

 

%>
<!DOCTYPE html>
<html lang="en">
    
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Notificaciones</title>
    <link rel="shortcut icon" href="img/xxx.png">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="css/notificaciones.css">
    <link rel="stylesheet" href="css/paginaPrincipal.css">
    <link rel="stylesheet" href="./css/scrollbar.css">
</head>
<body class="cont">
    
    <header>
        <div class="primera seccion">
            <figure class="logo-ipn">
                <a href="https://www.ipn.mx"><img src="img/logo.png"></a>
            </figure>
            <!--formulario con filtros empieza-->
            

            <div class="buscador-personas seccion">
                
            <!---
            
                <input form="buscar" onkeypress="return z()" type="search" placeholder="Buscar" id="nav">
                <button id="btn-filtros" class="btn-fltros" form="buscar" type="submit" onclick="sumbit1()" ><i class="bi bi-search"></i></button>-->
            <a href="#" class="btn-filtros" ></a>
            </div>
            


            <!--formulario con filtros termina-->
        </div>
        <div class="segunda seccion">
            <figure class="logo-poliasesor">
                <img src="img/3 (2).png">
            </figure>
        </div>
        <div class="tercera seccion">
            <div class="botones">
                <a href="AsesorPrincipal.jsp"><i class="bi bi-house"></i></a>
                <%   if(rol == "1"){ %>
                <a href="misasesorias.jsp" ><i class="bi bi-journal-text"></i></a>
                <a href="crearasesoria.jsp"><i class="bi bi-plus-circle"></i></a>
                <% }else if (rol =="0"){ %>
                <a href="misasesorias2.jsp"><i class="bi bi-journal-text"></i></a>
                <%}%>         
                <a href="horario.jsp"><i class="bi bi-calendar3"></i></a>
                <a href="notificaciones.jsp"><i class="bi bi-bell"></i></a>
                <a href="perfil.jsp"><i class="bi bi-person-circle"></i></a>
                <button class="btnBoleta"><%=usuario %></button>

            </div>
        </div>
    </header>
  

  <br>

    <div class="lista-sesion" id="lista-sesion">
        <a href="#">Mi Perfil</a>
        <a href="#">Cerrar Sesión</a>
    </div>
   <script src="./JS/paginaPrincipal.js"></script>
    <br>

        
        
    <h1>Notificaciones</h1>
        <%
        List<CNotificaciones> lis = AccionesUsuario.Notificacion(usuario);

        for (CNotificaciones c : lis) {

        %>

        <div class="main-container">
        <div class="alinear">
            <div class="usu">
                <img src="./img/fotopefil3.png" alt="" class="img">
                <div>

                    <p class="title">Algebra</p>
                    <p class="asesor">Elizalde Hernández Alan</p>
                </div>

            </div>
            <div class="columna-2">
                <p class="titulo">Sistema</p>
                <div class="for">Para: asesorados</div>
            </div>
        </div>


        <div class="text">
                        <p> <%=c.getNoti()%></p>
        </div>
    </div>    
         
              
    
    <%
        }
    %>
       
    
    <!--
      
    
    <h1>Notificaciones</h1>
    <div class="main-container">
        <div class="alinear">
            <div class="usu">
                <img src="./img/fotoperfil1.png" alt="" class="img">
                
                <div>
                    <p class="title"></p>
                    <p class="asesor"></p>
                </div>
                
            </div>
                <div class="for">Para: Asesores, asesorados</div>
            </div>

        <div class="text">
     
        </div>
      
             
    </div>    
    -->

   
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> 
</body>

</html>