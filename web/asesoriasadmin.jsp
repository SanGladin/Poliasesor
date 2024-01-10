<%-- 
    Document   : asesoriasadmin
    Created on : 24/11/2021, 12:17:29 AM
    Author     : Administrador
--%>
<%@page import="Modelo.UnidadesA"%>
<%@page import="Modelo.AsesoriaD"%>
<%@page import="Control.AccionesUsuario"%>
<%@page import="Control.AccionesUsuario"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Asesorias"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<% HttpSession sesionCliente = request.getSession();
    String usuario = (String) session.getAttribute("usuario");
    String privilegio = (String) session.getAttribute("privilegio");
    String rol = (String) session.getAttribute("rol");
    System.out.println(usuario);
    System.out.println(privilegio);
    System.out.println(rol);

    if (usuario != null) {
        if (privilegio == "0" || privilegio == "1") {

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
    <script src="https://kit.fontawesome.com/579fe2a44d.js" crossorigin="anonymous"></script>

    <title>Asesorias</title>
</head>
<body class="cont">
    <header>
        <div class="primera seccion">
            <figure class="logo-ipn">
                <a href="https://www.ipn.mx"><img src="img/logo.png" class="ipnLog"></a>
            </figure>
            <!--formulario con filtros empieza-->

            <a id="btn-filtros" class="btn-filtros"></a>
            <!--formulario con filtros termina-->
        </div>
        <div class="segunda seccion">
            <figure class="logo-poliasesor">
                <img src="img/3 (2).png">
            </figure>
        </div>
        <div class="tercera seccion">
            <div class="botones">
                <a href="Admin.jsp"><i class="fa-solid fa-users"></i></i></a>
                
                <a href="usuariosinactivos.jsp"><i class="fa-solid fa-users-slash"></i></a>
                <a href="asesoriasadmin.jsp"><i class="bi bi-journal"></i></a>
                <% if (privilegio == "1") { %>
                <a href="RegistrarUsuario.jsp"><i class="fa-solid fa-user-plus"></i></a>
                <%}
                 if (privilegio == "0") { %>
                <a href="RegistrarAdmin.jsp"><i class="fa-solid fa-user-plus"></i></a>
                <a href="Adminsver.jsp"><i class="fa-solid fa-users-line"></i></a>
                <%} %>
                
                <a href="#"><i class="bi bi-person-circle"></i></a>

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
    
<h1 >Asesorias</h1>
<%
    List<Asesorias> lis = AccionesUsuario.Asesoriasa(usuario);

    for (Asesorias c : lis) {

%>

<div>
    <div class="asesoria-general" id="ase">
    <section class="contenedor-asesoria uno">
            <div class="filas-asesoria">
                <div class="flex">
                     <img src="img/fotoperfil1.png" class="img">
                     <div>
                        <p class="titulo"><%=c.getNombre()%></p>
                        <p class="asesor"><%=c.getNombreasesor()%></p>
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
                    

            

                    
                    <% }%>
                    <!--No se cómo esta organizado esto, lo dejo así por si acaso-->
                    </div>
                </div>
                    <div class="filas-asesoria dos">
                        <div class="columnas-asesoria texto">
                            <p id="texto "><%=c.getDescripcion()%></p>
                        </div>
                        <div class="columnas-asesoria btn">
                           
                            <form id="form1" action="borrarasesoria">
                            <input type="number" name="idase" value="<%=c.getId()%>" style="visibility: hidden;" >
                            <input type="submit"  value="Eliminar" class="asdbtn">
                        </form>

                        </div>
                    </div>
            <div class="filas-asesoria tres">
                <i class="bi bi-person i"></i>
                <p class="a-ins"><%=c.getCupomax() - c.getCupodis()%>/<%=c.getCupomax()%></p>
            </div>
    </section>
            
    

</div>
<% }%>
</div>
            
<center><a href="asesoriasadmin.jsp"  style="  text-decoration: none"><h2 style="color: #74003E;">Cargar más</h2></a></center>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> 
<script src="JS/principal.js"></script>

</body>
</html>