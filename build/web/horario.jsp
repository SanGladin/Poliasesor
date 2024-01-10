<%-- 
    Document   : horario
    Created on : 24/11/2021, 03:27:30 AM
    Author     : Administrador
--%>

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
       
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="css/horario.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">

    <link rel="shortcut icon" href="img/xxx.png">
    <link rel="stylesheet" href="css/paginaPrincipal.css">
    <link rel="stylesheet" href="./css/correccionbots.css">
    <link rel="stylesheet" href="./css/scrollbar.css">
        <script src="JS/horario.js"></script>
        <title>Horario</title>
        
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
<center><h1 class="titulo"> Horario </h1></center>
<div class="table-responsive">
<table class="table" >


    <tr>
        <th style="font-size: 20px;"> Asesoria </th>

        <th > <b> Lunes </b> </th>
        <th > <b> Martes </b> </th>
        <th> <b> Miércoles </b> </th>
        <th> <b> Jueves </b> </th>
        <th> <b> Viernes </b> </th>
        <th > <b> Sábado </b> </th>
        <th > <b> Domingo </b> </th>
    </tr>
    

          

        <tr><%              List<AsesoriaD> lisa = AccionesUsuario.mishorarios(usuario);
             
                 for (AsesoriaD as : lisa) {
                      %>
            
                      <td><a href="vermasins.jsp?idase=<%=as.getId_ase() %>" class="vermas" style="text-decoration: none;color: #74003E;"><%=as.getNombre()%></a></td>
         
         <td><%              List<AsesoriaD> lisaa = AccionesUsuario.horariosl(as.getId_ase());
             
                 for (AsesoriaD a : lisaa) {
                     
                     if (a.getId_fec() == 1 ){
                        %><%=a.getHorainicio()%> - <%=a.getHorafin()%>  <%
                     }
                 }
                      %></td>
         <td><%              List<AsesoriaD> lisaat = AccionesUsuario.horarios2(as.getId_ase());
             
                 for (AsesoriaD ad : lisaat) {
                     
                     if (ad.getId_fec() == 2 ){
                        %><%=ad.getHorainicio()%> - <%=ad.getHorafin()%>  <%
                     }
                 }
                      %></td>
         <td><% 
             List<AsesoriaD> lisaas = AccionesUsuario.horarios3(as.getId_ase());
             
                 for (AsesoriaD af : lisaas) {
                     
                     if (af.getId_fec() == 3 ){
                        %><%=af.getHorainicio()%> - <%=af.getHorafin()%>  <%
                     }
                 }
                      %></td>
         <td><% 
             List<AsesoriaD> lisaaf = AccionesUsuario.horarios4(as.getId_ase());
             
                 for (AsesoriaD af : lisaaf) {
                     
                     if (af.getId_fec() == 4 ){
                        %><%=af.getHorainicio()%> - <%=af.getHorafin()%>  <%
                     }
                 }
                      %></td>
         <td><% 
             List<AsesoriaD> lisaafs = AccionesUsuario.horarios5(as.getId_ase());
             
                 for (AsesoriaD af : lisaafs) {
                     
                     if (af.getId_fec() == 5 ){
                        %><%=af.getHorainicio()%> - <%=af.getHorafin()%>  <%
                     }
                 }
                      %></td>
         <td><% 
             List<AsesoriaD> lisaaw = AccionesUsuario.horarios6(as.getId_ase());
             
                 for (AsesoriaD af : lisaaw) {
                     
                     if (af.getId_fec() == 6 ){
                        %><%=af.getHorainicio()%> - <%=af.getHorafin()%>  <%
                     }
                 }
                      %></td>
         <td><% 
             List<AsesoriaD> lisaap = AccionesUsuario.horarios7(as.getId_ase());
             
                 for (AsesoriaD af : lisaap) {
                     
                     if (af.getId_fec() == 7 ){
                        %><%=af.getHorainicio()%> - <%=af.getHorafin()%>  <%
                     }
                 }
                      %></td>
         
    </tr>
<%} %>

   
</table>
</div>
<center><p style="color: #74003E;font-size: 1.6vw">No hay mas Asesorias Inscritas</p></center>

</body>
</html>