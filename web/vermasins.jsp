<%-- 
    Document   : vermasmis
    Created on : 22/11/2021, 12:10:45 AM
    Author     : Administrador
--%>

<%@page import="Modelo.AsesoriaD"%>
<%@page import="java.util.List"%>
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
    int id = Integer.parseInt(request.getParameter("idase"));

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
        <title>Ver Asesoria</title>  
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="css/paginaPrincipal.css">
    <link rel="stylesheet" href="css/vermasins.css">
    <link rel="stylesheet" href="./css/scrollbar.css">



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

    <%  List<Asesorias> datos = AccionesUsuario.Obtenerdatosase3(id, usuario);

          for (Asesorias a : datos) {%>
    <div class="center">
         <div class="todo">
            <section class="columnas primera">
                <div class="caracteristicas unicas con-borde">
                     <strong style="color: #74003E;">Nombre:</strong>
                    <textarea class="campos" readonly name="nombre" required id="nombre" class="nombrein" placeholder="<%=a.getNombre()%>" maxlength="30"></textarea>
                </div>
                <div class="caracteristicas unicas con-borde">
                    <strong style="color: #74003E;">Descripción:</strong>
                    <textarea readonly name="descripcion" required class="campos" id="descripcion" placeholder="<%=a.getDescripcion() %>" maxlength="100"></textarea>
                </div>
                <div class="flex-prl">
                    <div id="columna-izquierda">
                        <div class="caracteristicas agrupadas">
                            <div class="sb-columna con-borde">
                                <strong style="color: #74003E;">Temas:</strong>
                                <textarea readonly class="campos" readonly name="temas" 
                                          maxlength="50ch" required id="temas" placeholder="<%=a.getTemas() %>"></textarea>
                            </div>
                            <div class="sb-columna con-borde" id="cuadro-inicial">
                                <strong  style="color: #74003E;">ID y Contraseña Aula:</strong>
                                <textarea class="campos" placeholder="<%=a.getAula() %>"readonly name="zoom" 
                          maxlength="40ch" required id="zoom"></textarea>
                            </div>
                        </div>
                    </div>
                    <div id="columna-derecha">
                        <div class="caracteristicas agrupadas">
                            <div class="sb-columna con-borde">
                                <strong style="color: #74003E;"> Material: </strong>
                                <textarea class="campos" placeholder="<%=a.getMaterial()%>" readonly name="material"
                          maxlength="50ch" required
                          id="material"></textarea>
                            </div>
                            <div class="sb-columna">
                                <div class="cupo-alumnos con-borde">
                                    <section>
                                        <strong style="color: #74003E;"> Cupo máximo de alumnos: </strong>
                                        <input readonly type="number" required id="cupMax" 
                       size="1" max="99" value="<%=a.getCupomax() %>" min="1"
                       onkeypress="return (event.charCode == 00);">
                                    </section>
                                </div>
                                <div class="cupo-alumnos con-borde">
                                    <section>
                                        <strong style="color: #74003E;"> Cupo disponible de alumnos: </strong>
                <input type="number" required 
                       id="CupoDis" size="1" max="99" min="1" value="<%=a.getCupodis() %>" readonly >
                                    </section>
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
                <section class="dias">
                    Lunes:
                            <br>
                            <div class="alinearFlex">
                                <input  readonly    type="time"  id="luneshorain" 
                              <%  List<AsesoriaD> datosdl = AccionesUsuario.Obtenerdatosased(id, 1);
                                  for (AsesoriaD c : datosdl) {

                              %>value="<%=c.getHorainicio()%>"<%}%> name="luneshorain"> - 
                <input  readonly   type="time" readonly="true"  id="luneshorafin" 
                       <%  List<AsesoriaD> datosdlf = AccionesUsuario.Obtenerdatosased(id, 1);
                           for (AsesoriaD c : datosdlf) {

                       %>value="<%=c.getHorafin()%>"<% }%> name="luneshorafin">
                            </div>
                        </section>
                
                <section class="dias">Martes
                            <br>
                            <div class="alinearFlex">
                                <input   readonly   type="time"  id="marteshorain" 
                               <%  List<AsesoriaD> datosdm = AccionesUsuario.Obtenerdatosased(id, 2);
                                   for (AsesoriaD c : datosdm) {

                               %>value="<%=c.getHorainicio()%>"<%}%> name="marteshorain"> - 
                <input  readonly    type="time" readonly="true"  sid="marteshorafin" 
                       <%  List<AsesoriaD> datosdmf = AccionesUsuario.Obtenerdatosased(id, 2);
                           for (AsesoriaD c : datosdmf) {

                       %>value="<%=c.getHorafin()%>"<% }%> name="marteshorafin">
                            </div>
                        </section>
                       <section class="dias">Miércoles:
                            <br>
                            <div class="alinearFlex">
                                <input  readonly    type="time"  id="miercoleshorain" 
                                  <%  List<AsesoriaD> datosdmi = AccionesUsuario.Obtenerdatosased(id, 3);
                                      for (AsesoriaD c : datosdmi) {

                                  %>value="<%=c.getHorainicio()%>"<%}%>
                                  name="miercoleshorain"> - <input  readonly    type="time"
                                  <%  List<AsesoriaD> datosdmif = AccionesUsuario.Obtenerdatosased(id, 3);
                                      for (AsesoriaD c : datosdmif) {

                                  %>value="<%=c.getHorafin()%>"<% }%>
                                  readonly="true"  id="miercoleshorafin" name="miercoleshorafin">
                            </div>
                        </section>
                        <section class="dias">Jueves
                            <br>
                            <div class="alinearFlex">
                                <input  readonly    <%  List<AsesoriaD> datosdj = AccionesUsuario.Obtenerdatosased(id, 4);
                    for (AsesoriaD c : datosdj) {

                    %>value="<%=c.getHorainicio()%>"<%}%> type="time" 
                    id="jueveshorain" name="jueveshorain"> - <input  readonly    type="time" readonly="true" 
                    <%  List<AsesoriaD> datosdjf = AccionesUsuario.Obtenerdatosased(id, 4);
                        for (AsesoriaD c : datosdjf) {

                    %>value="<%=c.getHorafin()%>"<%}%>
                     id="jueveshorafin" name="jueveshorafin">
                            </div>
                        </section>
                        <section class="dias">Viernes
                            <br>
                            <div class="alinearFlex">
                                <input  readonly     <%  List<AsesoriaD> datosdv = AccionesUsuario.Obtenerdatosased(id, 5);
                    for (AsesoriaD c : datosdv) {

                    %>value="<%=c.getHorainicio()%>"<%}%> type="time" id="vierneshorain" name="vierneshorain">
                - <input  readonly      <%  List<AsesoriaD> datosdvf = AccionesUsuario.Obtenerdatosased(id, 5);
                        for (AsesoriaD c : datosdvf) {

                    %>value="<%=c.getHorafin()%>"<%}%> type="time" readonly="true" id="vierneshorafin" name="vierneshorafin">
                            </div>
                        </section>
                        <section class="dias">Sabado
                            <br>
                            <div class="alinearFlex">
                                <input  readonly     <%  List<AsesoriaD> datosds = AccionesUsuario.Obtenerdatosased(id, 6);
                    for (AsesoriaD c : datosds) {

                    %>value="<%=c.getHorainicio()%>"<%}%> type="time"  id="sabhorain" name="sabhorain"> - 
                <input  readonly       <%  List<AsesoriaD> datosdsf = AccionesUsuario.Obtenerdatosased(id, 6);
                        for (AsesoriaD c : datosdsf) {

                    %>value="<%=c.getHorafin()%>"<%}%> type="time" readonly="true"  id="sabhorafin" name="sabhorafin">
                            </div>
                        </section>
                        <section class="dias">Domingo
                            <br>
                            <div class="alinearFlex">
                                <input  readonly    <%  List<AsesoriaD> datosdd= AccionesUsuario.Obtenerdatosased(id, 7);
                    for (AsesoriaD c : datosdd) {

                    %>value="<%=c.getHorainicio()%>"<%}%> type="time"  id="domhorain" name="domhorain"> - 
                <input readonly   <%  List<AsesoriaD> datosddf = AccionesUsuario.Obtenerdatosased(id, 7);
                        for (AsesoriaD c : datosddf) {

                    %>value="<%=c.getHorafin()%>"<%}%> type="time" readonly="true"  id="domhorafin" name="domhorafin">
                            </div>
                        </section>
</div>
                           </div>
                            <form  method="Post" id="form1"><% System.out.println("la asesoria es la numero:" + a.getId());
            %>
            <input type="text" class="idase" name="idase" style="visibility: hidden; position: fixed;" value= "<%=id%>">
            <input type="text" class="idase" name="usu" style="visibility: hidden; position: fixed;" value= "<%=usuario%>">
             <input type="submit" style="top:77%;" formaction="misasesorias.jsp"  class="sub" id="cancelar" value="Mis Asesorias">
 <input type="submit" style="top:77%;" formaction="dardebaja" class="sub" id="botonEdicion" value="Dar de Baja">
        </form>
            </section>
         </div>
        
    </div>
    <%}%>  


    <script src="JS/verAsesoria2.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</body>

</html>