<%-- 
    Document   : PrincipalAsesor
    Created on : 12/10/2021, 12:47:37 AM
    Author     : Administrador
--%>


<%@page import="Modelo.UnidadesA"%>
<%@page import="Modelo.AsesoriaD"%>
<%@page import="Modelo.Usuario"%>
<%@page import="Control.AccionesUsuario"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Asesorias"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true" %>
<% HttpSession sesionCliente = request.getSession();
    String usuario = (String)session.getAttribute("usuario");
    String privilegio= (String)session.getAttribute("privilegio");
    String rol = (String)session.getAttribute("rol");
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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <link rel="stylesheet" href="css/segundaCaja.css">
        <link rel="stylesheet" href="css/principal.css">
        <link rel="shortcut icon" type="" href="img/xxx.png">
        <title>Principal</title>
        <link rel="shortcut icon" href="img/xxx.png">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="css/paginaPrincipal.css">
    <link rel="stylesheet" href="css/modificarAsesoria.css">
    <link rel="stylesheet" href="./css/scrollbar.css">
   
        <script src="JS/principal.js"></script>
    </head>
  <script>
                            Swal.fire(
                                    'Exito',
                                    'Ticket Generado',
                                    'success',
                                    );
        </script>
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
            <a href="#" class="btn-filtros"  style="visibility:hidden;; position: fixed;"><i class="bi bi-funnel"></i></a>
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
    <div class="fltro" id="filtros">
        <p>Aplicar filtro</p>
        <hr/>
        <form id="buscar" action="Buscar" method="post">
            <section class="section">
                <div class="primera-columna">
                    <label><input type="radio" name="filtros" value="asesoria" class="cbox"> Buscar asesoría</label>
                    <label><input type="radio" name="filtros" value="asesor" class="cbox"> Buscar asesor</label>
                </div>
                <div class="segunda-columna">
                    <label>Unidad academica</label>
                    <select name="ua" id="ua">
                    <option>Todos</option>
                    <%  List<UnidadesA> list = AccionesUsuario.UnidadesA(); 
                    for (UnidadesA c : list) {%>
                    <option><%=c.getNombre()%> </option>
                    <% } %>
                </select>
                    <label>Dia</label>
                    <select name="dia" id="dia">
                    <option>Todos</option>

                        <option>Lunes</option>
                        <option>Martes</option>
                        <option>Miercoles</option>
                        <option>Jueves</option>
                        <option>Viernes</option>
                        <option>Sabado</option>
                        <option>Domingo</option>
                </select>
                    <div>
                        <input type="submit" value="Ok" class="btnf">
                        <input type="reset" value="Borrar selección" class="btnf">
                    </div>
                </div>
                <div>
                    <label>Buscar horario: <input type="time" name="filtros" value="horario" class="cbox"></label>
                </div>
            </section>
        </form>
    </div>
    <div class="lista-sesion" id="lista-sesion">
        <a href="perfil.jsp">Mi Perfil</a>
        <a href="cerradoconexito.jsp">Cerrar Sesión</a>
        
    </div>
    <script src="./JS/paginaPrincipal.js"></script>

        <h1 class="titulo">Asesorías</h1>
        <%
            List<Asesorias> lis = AccionesUsuario.Asesorias(usuario);

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
        <input input type="submit"   formaction="vermas.jsp"  id="mas" value="Ver Más" class="asdbtn">
                    <input type="submit" id="ins"  formaction="inscribirasesoria"  value="Inscribir" class="asdbtn">
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
        <%
            }
        %>
    <center><a href="AsesorPrincipal.jsp"  style="  text-decoration: none"><h2 style="color: #74003E;">Cargar más</h2></a></center>



        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    </body>

</html>