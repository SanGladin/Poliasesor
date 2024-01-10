<%-- 
    Document   : editarasesoria
    Created on : 22/11/2021, 12:48:54 AM
    Author     : Administrador
--%>

<%@page import="Modelo.AsesoriaD"%>
<%@page import="Modelo.AsesoriaD"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="Control.AccionesUsuario"%>
<%@page import="Control.AccionesUsuario"%>
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
        if (privilegio == "2") {
            if (rol == "1") {

            } else {
                response.sendRedirect("Inicio.jsp");
            }
        } else {
            response.sendRedirect("Inicio.jsp");
        }
    } else {
        response.sendRedirect("Inicio.jsp");
    }
    int id = Integer.parseInt(request.getParameter("idase"));

%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="shortcut icon" href="img/xxx.png">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="css/paginaPrincipal.css">
    <link rel="stylesheet" href="css/modificarAsesoria.css">
    <link rel="stylesheet" href="./css/scrollbar.css">
 
        <title>Editar Asesoria</title>

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
    <form method="Post" id="form1" action="EditarAsesoria">
        <%  List<Asesorias> datos = AccionesUsuario.Obtenerdatosase(id, usuario);

            for (Asesorias a : datos) {%>
        <div class="todo">
            <script src="JS/editarasesoria.js"></script>
            <section  class="columnas primera">
                <div class="caracteristicas unicas con-borde">
                <strong style="color: #74003E;">Nombre:</strong>
                <textarea type="text" name="nombre" required id="nombre" class="campos"
                       autocomplete="off"onkeypress="return z()" maxlength="30"><%=a.getNombre()%></textarea>
            </div>
                       <div class="caracteristicas unicas con-borde">
                <strong style="color: #74003E;">Descripción:</strong>
                <textarea name="descripcion"onkeypress="return z()" maxlength="90" required class="campos"
                          id="descripcion" 
                          cols="60" rows="2" style="height: 65%; "
                          > <%=a.getDescripcion()%></textarea>
            </div>

            <div class="flex-prl">
                <div id="columna-izquierda">
                    <div class="sb-columna con-borde">
                <strong style="color: #74003E;">Temas:</strong>
                <textarea name="temas"onkeypress="return z()" maxlength="50ch" required id="temas" placeholder="Integrales Indefinidas, Cambio de variable,
                          Sustitucion Trigonometrica" class="campos" ><%=a.getTemas()%></textarea>
            </div>

            <div class="sb-columna con-borde">
                <strong style="color: #74003E;">ID y Contraseña Aula:</strong>
                <textarea name="zoom" onkeypress="return z()" maxlength="40"
                          required id="zoom"
                          placeholder="Zoom/Teams: 8884 965 643 &nbsp; &nbsp;&nbsp; ID:2965df84"  class="campos"><%=a.getAula()%></textarea>
            </div>
                </div>
                <div id="columna-derecha">
                <div class="caracteristicas agrupadas">
                    <div class="sb-columna con-borde">
                        <strong style="color: #74003E;"> Material: </strong>
                        <textarea name="material" onkeypress="return z()" maxlength="50ch" required id="material"
                          cols="31" rows="2" placeholder="Calculadora Cientifica, Cuaderno" ><%=a.getMaterial()%></textarea>
                    </div>
                    <div class="sb-columna">
                        <div class="cupo-alumnos con-borde">
                <strong style="color: #74003E;"> Cupo máximo de alumnos: </strong>
                <input type="number"  required  id="cupMax" name="cupMax" readonly="true" size="1" onchange="cupodisa()" max="99" value="<%=a.getCupomax()%>" min="1" onkeypress="return (event.charCode == 00);">
            </div>

            <div class="cupo-alumnos con-borde">
                <strong style="color: #74003E;"> Cupo disponible de alumnos: </strong>
                <input type="number" required readonly id="CupoDis" name="CupoDis"   size="1" max="99" min="1" value="<%=a.getCupodis()%>" readonly >
            </div>
                    </div>
                </div>
            </div>
            </div>
            
            </section>
            <section class="columnas segunda">
                <div class="tblHorarios">
                    <div class="fechas unicas con-borde">
                <strong style="color: #74003E;" > Horarios Completos: </strong>
                <br>

                <br>
                <section class="dias">Lunes:
                            <br>
                            <div class="alinearFlex">
                                <input type="time" id="luneshorain" 
                              <%  List<AsesoriaD> datosdl = AccionesUsuario.Obtenerdatosased(id, 1);
                                  for (AsesoriaD c : datosdl) {

                              %>value="<%=c.getHorainicio()%>"<%}%> name="luneshorain"> - 
                <input type="time" readonly="true" id="luneshorafin" 
                       <%  List<AsesoriaD> datosdlf = AccionesUsuario.Obtenerdatosased(id, 1);
                           for (AsesoriaD c : datosdlf) {

                       %>value="<%=c.getHorafin()%>"<% }%> name="luneshorafin">
                            </div>
                        </section>
                            <section class="dias">Martes:
                            <br>
                            <div class="alinearFlex">
                                <input type="time" id="marteshorain" 
                               <%  List<AsesoriaD> datosdm = AccionesUsuario.Obtenerdatosased(id, 2);
                                   for (AsesoriaD c : datosdm) {

                               %>value="<%=c.getHorainicio()%>"<%}%> name="marteshorain"> - 
                <input type="time" readonly="true"  id="marteshorafin" 
                       <%  List<AsesoriaD> datosdmf = AccionesUsuario.Obtenerdatosased(id, 2);
                           for (AsesoriaD c : datosdmf) {

                       %>value="<%=c.getHorafin()%>"<% }%> name="marteshorafin">
                            </div>
                        </section>
                            <section class="dias">Miércoles:
                            <br>
                            <div class="alinearFlex">
                                <input type="time" id="miercoleshorain" 
                                  <%  List<AsesoriaD> datosdmi = AccionesUsuario.Obtenerdatosased(id, 3);
                                      for (AsesoriaD c : datosdmi) {

                                  %>value="<%=c.getHorainicio()%>"<%}%>
                                  name="miercoleshorain"> - <input type="time"
                                  <%  List<AsesoriaD> datosdmif = AccionesUsuario.Obtenerdatosased(id, 3);
                                      for (AsesoriaD c : datosdmif) {

                                  %>value="<%=c.getHorafin()%>"<% }%>
                                  readonly="true" id="miercoleshorafin" name="miercoleshorafin">
                            </div>
                        </section>
                <section class="dias">Jueves:
                            <br>
                            <div class="alinearFlex">
                                <input <%  List<AsesoriaD> datosdj = AccionesUsuario.Obtenerdatosased(id, 4);
                    for (AsesoriaD c : datosdj) {

                    %>value="<%=c.getHorainicio()%>"<%}%> type="time" 
                    id="jueveshorain" name="jueveshorain"> - <input type="time" readonly="true" 
                    <%  List<AsesoriaD> datosdjf = AccionesUsuario.Obtenerdatosased(id, 4);
                        for (AsesoriaD c : datosdjf) {

                    %>value="<%=c.getHorafin()%>"<%}%>
                     id="jueveshorafin" name="jueveshorafin">
                            </div>
                        </section>

               <section class="dias">Viernes:
                            <br>
                            <div class="alinearFlex">
                                <input  <%  List<AsesoriaD> datosdv = AccionesUsuario.Obtenerdatosased(id, 5);
                    for (AsesoriaD c : datosdv) {

                    %>value="<%=c.getHorainicio()%>"<%}%> type="time" id="vierneshorain" name="vierneshorain">
                - <input    <%  List<AsesoriaD> datosdvf = AccionesUsuario.Obtenerdatosased(id, 5);
                        for (AsesoriaD c : datosdvf) {

                    %>value="<%=c.getHorafin()%>"<%}%> type="time" readonly="true" id="vierneshorafin" name="vierneshorafin">
                            </div>
                        </section>
                            <section class="dias">Sábado
                            <br>
                            <div class="alinearFlex">
                                <input  <%  List<AsesoriaD> datosds = AccionesUsuario.Obtenerdatosased(id, 6);
                    for (AsesoriaD c : datosds) {

                    %>value="<%=c.getHorainicio()%>"<%}%> type="time" id="sabhorain" name="sabhorain"> - 
                <input    <%  List<AsesoriaD> datosdsf = AccionesUsuario.Obtenerdatosased(id, 6);
                        for (AsesoriaD c : datosdsf) {

                    %>value="<%=c.getHorafin()%>"<%}%> type="time" readonly="true"  id="sabhorafin" name="sabhorafin">
                
                
                            </div>
                        </section>
                            <section class="dias">Domingo:
                            <br>
                            <div class="alinearFlex">
                                <input  <%  List<AsesoriaD> datosdd= AccionesUsuario.Obtenerdatosased(id, 7);
                    for (AsesoriaD c : datosdd) {

                    %>value="<%=c.getHorainicio()%>"<%}%> type="time" id="domhorain" name="domhorain"> - 
                <input    <%  List<AsesoriaD> datosddf = AccionesUsuario.Obtenerdatosased(id, 7);
                        for (AsesoriaD c : datosddf) {

                    %>value="<%=c.getHorafin()%>"<%}%> type="time" readonly="true"  id="domhorafin" name="domhorafin">
                            </div>
                        </section>
</div>
            </div>

                    <input type="text" class="idase" name="idase" style="visibility: hidden;" value= "<%=a.getId() %>">
     

                    <div class="tblHorarios agrupadas flex">
                    <input type="submit"   class="sub" id="botonEdicion" value="Editar"></td>
                    <input type="reset" onclick ="history.back();" class="sub" id="botonborrar" value="Cancelar">
                
                        <input type="button" onclick="return borrartodo(this)" class="sub" id="botonEliminar" value="Borrar">
</div>
            </section>

            

            






        </div>
        <%}%>  
    </form>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> 
    
    <script>
      
    
    window.onkeydown = function(){
     var myInput = document.getElementById('descripcion');
    myInput.onpaste = function (e) {
        e.preventDefault();

    };

    myInput.oncopy = function (e) {
        e.preventDefault();

    };
    var myInput = document.getElementById('temas');
    myInput.onpaste = function (e) {
        e.preventDefault();

    };

    myInput.oncopy = function (e) {
        e.preventDefault();

    };
    var myInput = document.getElementById('zoom');
    myInput.onpaste = function (e) {
        e.preventDefault();

    };

    myInput.oncopy = function (e) {
        e.preventDefault();

    };
    var myInput = document.getElementById('material');
    myInput.onpaste = function (e) {
        e.preventDefault();

    };

    myInput.oncopy = function (e) {
        e.preventDefault();

    };
    var myInput = document.getElementById('nombre');
    myInput.onpaste = function (e) {
        e.preventDefault();

    };

    myInput.oncopy = function (e) {
        e.preventDefault();

    };
    var myInput = document.getElementById('cupMax');
    myInput.onpaste = function (e) {
        e.preventDefault();

    };

    myInput.oncopy = function (e) {
        e.preventDefault();

    };
    };
    window.onload() = function (){
        
    if (window.screen.width < 1200) {
        var img = document.getElementById("poliimg");
        img.style.visibility = "hidden";
        img.style.marginRight = "0vw";

    };
}:
 



</script>
</body>

</html>
