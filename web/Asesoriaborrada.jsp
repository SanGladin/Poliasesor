<%-- 
    Document   : misasesorias
    Created on : 21/11/2021, 11:37:14 PM
    Author     : Administrador
--%>


<%@page import="Modelo.AsesoriaD"%>
<%@page import="Control.AccionesUsuario"%>
<%@page import="Control.AccionesUsuario"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Asesorias"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<% HttpSession sesionCliente = request.getSession();
    String usuario = (String)session.getAttribute("usuario");
    String privilegio= (String)session.getAttribute("privilegio");
    String rol = (String)session.getAttribute("rol");
    System.out.println(usuario);
    System.out.println(privilegio);
    System.out.println(rol);
    
    if(usuario != null){
       if(privilegio == "2"){
           if(rol == "1"){
               
           }else{
           response.sendRedirect("Inicio.jsp");
           }
       }else if (privilegio == "0" || privilegio =="1"){
            response.sendRedirect("asesoriasadmin.jsp");
       }
       else{
           response.sendRedirect("Inicio.jsp");
       }
    }else{
         response.sendRedirect("Inicio.jsp");
    }
    
           %>
<!DOCTYPE html>
<html lang="en">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="shortcut icon" href="img/xxx.png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="css/segundaCaja.css">
    <link rel="stylesheet" href="css/paginaPrincipal.css">
    <link rel="stylesheet" href="css/principal.css">
    <link rel="stylesheet" href="./css/scrollbar.css">

    <title>Asesorias</title>
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
    
  <<% if(rol == "1") {%>
      
      <h1 ><a href="misasesorias.jsp" class="color-poli">Asesorias</a>
    /
        <a href="misasesorias2.jsp" class="color-poli">Mis Asesorias</a></h1>
      <%} if(rol == "0") {%>
      <h1><a href="misasesorias2.jsp" class="color-poli">Mis Asesorias</a></h1>
      <% } %>
    <%
            List<Asesorias> lis = AccionesUsuario.Asesoriasmias(usuario);

            for (Asesorias c : lis) {

        %>

  <div>
  <div class="asesoria-general" id="ase">
<section class="contenedor-asesoria uno">
            <div class="filas-asesoria">
                <div class="flex">
                    <img src="img/fotoperfil1.png" class="img">
                    <div>
                        <p class="titulo"><%=c.getNombre() %></p>
                        <p class="asesor"><%=c.getNombreasesor() %></p>
                    </div>
                </div>
                    <div class="columnas-asesoria horario-asesoria">
     
          <%
                        List<AsesoriaD> lisa = AccionesUsuario.Asesoriafecha(c.getId());

                        for (AsesoriaD a : lisa) {
                            System.out.println(a.getId_fec());
                          

                    %>
        <%      if (a.getId_fec() == 1) {
                    %><p>L&nbsp;<%=a.getHorainicio()%> - <%=a.getHorafin()%></p><%
                    } else if (a.getId_fec() == 2) {
                    %><p>M&nbsp;<%=a.getHorainicio()%> - <%=a.getHorafin()%></p><%
                    } else if (a.getId_fec() == 3) {
                    %><p>MI&nbsp;<%=a.getHorainicio()%> - <%=a.getHorafin()%></p><%
                    } else if (a.getId_fec() == 4) {
                    %><p>J&nbsp;<%=a.getHorainicio()%> - <%=a.getHorafin()%></p><%
                    } else if (a.getId_fec() == 5) {
                    %><p>V&nbsp;<%=a.getHorainicio()%> - <%=a.getHorafin()%></p><%
                    } else if (a.getId_fec() == 6) {
                    %><p>S&nbsp;<%=a.getHorainicio()%> - <%=a.getHorafin()%></p><%
                    } else if (a.getId_fec() == 7) {
                    %><p>D&nbsp;<%=a.getHorainicio()%> - <%=a.getHorafin()%></p><%
                        }

                    %> 
              <% } %>
      
    </div>
            </div>
              <div class="filas-asesoria dos">
                <div class="columnas-asesoria texto">
                    <p id="texto "><%=c.getDescripcion() %></p>
                </div>
                <div class="columnas-asesoria btn">
                    <form id="form1" >
        <input type="number" name="idase" value="<%=c.getId() %>" style="visibility: hidden; position:fixed;">
      <input type="submit" formaction="vermasmis.jsp"  value="Ver Más" class="asdbtn">
       <input type="submit" formaction="editarasesoria.jsp" value="Editar" class="asdbtn">
       
      
    
    </form>
                </div>
            </div>
                <div class="filas-asesoria tres">
                <i class="bi bi-person i"></i>
                <p class="a-ins"><%=c.getCupomax()-c.getCupodis()%>/<%=c.getCupomax()%></p>
            </div>
      </section>
  </div>
    </div>
       <% } %>
 
 







  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> 
      <script src="JS/misasesorias.js"></script>
      <script> Swal.fire(
                    'Exito',
                    'Asesoria Eliminada con Exito',
                    'success',
        
                );
        </script>
</body>
</html>