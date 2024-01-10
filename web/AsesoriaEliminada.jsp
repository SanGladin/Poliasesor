<%-- 
    Document   : misasesorias2
    Created on : 22/11/2021, 07:22:50 AM
    Author     : Administrador
--%>

<%@page import="Modelo.Usuario"%>
<%@page import="Modelo.AsesoriaD"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Asesorias"%>
<%@page import="Modelo.Asesorias"%>
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
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/principal.css">
    <link rel="shortcut icon" type="" href="img/xxx.png">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="css/segundaCaja.css">
    <link rel="stylesheet" href="css/paginaPrincipal.css">
    <link rel="stylesheet" href="./css/scrollbar.css">
    <title>Mis Asesorias</title>
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
    <h1>Mis asesorias</h1>
    
        <%
            List<Asesorias> lis = AccionesUsuario.Asesoriastomadas(usuario);

            for (Asesorias c : lis) {

        %>
<div>  
<div class="asesoria-general">
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
                    <form id="form1" method="post" action="dardebaja"><% Usuario e = new Usuario();
            e.setBol(usuario); int id = c.getId(); System.out.println(id); %>
        <input type="text" name="idase" value="<%=id%>" style="visibility: hidden; position:fixed;" >
        <input type="text" name="usu" value="<%=e.getBol() %>" style="visibility: hidden; position:fixed;" >
        <input type="submit" formaction="vermasins.jsp" value="Ver Más" class="asdbtn">
                    <input type="submit" formaction="dardebaja" value="Eliminar" class="asdbtn">
    </form>
                </div>
            </div>
                <div class="filas-asesoria tres">
                <i class="bi bi-person i"></i>
                <p class="a-ins"><%=c.getCupomax()-c.getCupodis()%>/<%=c.getCupomax()%></p>
            </div>
      </section>
  </div>
    </div><% }%>
<center><h2 style="color: #74003E;">No hay mas Asesorias para mostrar</h2></center>






<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
                    Swal.fire(
                            'Exito',
                            'Asesoria dada de baja con exito',
                            'success',
                            );

</script>
<script src="JS/misasesorias.js"></script>




</body>
</html>