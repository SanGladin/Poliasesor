<%-- 
    Document   : horario
    Created on : 24/11/2021, 03:27:30 AM
    Author     : Administrador
--%>

<%@page import="Modelo.ListaUsuarios"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.AsesoriaD"%>
<%@page import="Control.AccionesUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<% HttpSession sesionCliente = request.getSession();
    String usuario = (String) session.getAttribute("usuario");
    String privilegio = (String) session.getAttribute("privilegio");
    String rol = (String) session.getAttribute("rol");
    System.out.println(usuario);
    System.out.println(privilegio);
    System.out.println(rol);

    if (usuario != null) {
        if (privilegio == "2") {

        } else {
            response.sendRedirect("Inicio.jsp");
        }
    } else {
        response.sendRedirect("Inicio.jsp");
    }


%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="shortcut icon" href="img/xxx.png">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="css/horario.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

    <link rel="shortcut icon" href="img/xxx.png">
    <link rel="stylesheet" href="css/paginaPrincipal.css">
    <link rel="stylesheet" href="./css/correccionbots.css">
    <link rel="stylesheet" href="./css/scrollbar.css">
        <script src="JS/horario.js"></script>
        <title>Lista Alumnos</title>
        
    </head>
    <body class="cont">
<header>
        <div class="primera seccion">
            <figure class="logo-ipn">
                <a href="https://www.ipn.mx"><img src="img/logo.png"></a>
            </figure>
            <!--formulario con filtros empieza-->

            
                <a href="#" class="btn-filtros"></a>
           
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
                <a href="#"><i class="bi bi-bell"></i></a>
                <a href="perfil.jsp"><i class="bi bi-person-circle"></i></a>
                <button class="btnBoleta"><%=usuario %></button>

            </div>
        </div>
    </header>
    <br>
    
    <div class="lista-sesion" id="lista-sesion">
        <a href="perfil.jsp">Mi Perfil</a>
        <a href="cerradoconexito.jsp">Cerrar Sesión</a>
    </div>
    <script src="./JS/paginaPrincipal.js"></script>
<center><h1 class="titulo"> Alumno </h1></center>
<div class="table-responsive">
<table class="table" >


    <tr>
        <th style="font-size: 20px;"> N. </th>

        <th > <b> Nombre </b> </th>
        
        <th> <b> Boleta </b> </th>
        <th> <b> Contacto </b> </th>
        <th> <b> </b> </th>
       
    </tr>
    <%  int id = Integer.parseInt(request.getParameter("idase"));
    System.out.println(id+"aa");
     List<ListaUsuarios> lisa = AccionesUsuario.alumnoslista(id); 
        int i=1;
        for (ListaUsuarios a: lisa){
       %>
       <td><%=i%></td>
       <td><%=a.getNombre()%></td>
       <td><%=a.getBol_usu()%></td>
       <td><%=a.getCon()%></td>               
       <td>
          
           <form method="post" action="borraralumno?idusu=<%=a.getBol_usu() %>&idase=<%=id%>">
               <input type="image" src="img/borrar1.png" style="width: 13%;" 
                      alt="Eliminar" ></i>
           </form>
       </td>
          
       
       <%i++;}%>
       <style>
           .borraes:hover{
            cursor: pointer;  
           }
       </style>
   
</table>
       </div>
<center><p style="color: #74003E;font-size: 1.6vw">No hay mas Alumnos Inscritos</p></center>

</body>
</html>