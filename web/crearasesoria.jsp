<%-- 
    Document   : crearasesoria
    Created on : 20/11/2021, 01:20:32 PM
    Author     : Administrador
--%>

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
           response.sendRedirect("AsesorPrincipal.jsp");
           }
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
    <link rel="shortcut icon" href="img/xxx.png">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="css/paginaPrincipal.css">
    <link rel="stylesheet" href="css/modificarAsesoria.css">
    <link rel="stylesheet" href="./css/scrollbar.css">
    
    
    
    <title>Crear Asesoria</title>
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




};</script>

</head>

    <script src="JS/AgregarAsesoria.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> 
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
    
    <form method="Post" id="form1" action="crearAsesoria">
        
        <div class="todo">
            <section class="columnas primera">
            <div class="caracteristicas unicas con-borde">
                <strong style="color: #74003E;">Nombre:</strong>
                <textarea type="text" name="nombre" required id="nombre" class="nombrein" placeholder="Calculo Integral (Recueda no utilizar acentos en ningun campo)" cols="60" rows="2" style="height: 65%; "
                     autocomplete="off"onkeypress="return z()" maxlength="30ch"></textarea>
            </div>

            <div class="caracteristicas unicas con-borde">
                <strong style="color: #74003E;">Descripción:</strong>
                <textarea name="descripcion"onkeypress="return z()" maxlength="90ch" required class="descripcion" id="descripcion" placeholder="En esta Asesoria solo se resolveran dudas (mas no se dara la teoria) con respecto a los temas inidcados." cols="60" rows="2" style="height: 65%; "
                    ></textarea>
            </div>

                <div class="flex-prl">
                <div id="columna-izquierda">
                        <div class="caracteristicas agrupadas">
                            <div class="sb-columna con-borde">
                                <strong style="color: #74003E;">Temas:</strong>
                                <textarea name="temas"onkeypress="return z()" maxlength="50ch" required id="temas" cols="25" rows="4" placeholder="Integrales Indefinidas, Cambio de variable, Sustitucion Trigonometrica" ></textarea>
                            </div>
                            <div class="sb-columna con-borde" id="cuadro-inicial">
                                <strong style="color: #74003E;">ID y Contraseña Aula:</strong>
                <textarea name="zoom" onkeypress="return z()" maxlength="40ch" required id="zoom" cols="25" rows="2" placeholder="Zoom/Teams: 8884 965 643 &nbsp; &nbsp;&nbsp; ID:2965df84"  ></textarea>
                            </div>
                        </div>
                </div>
                    <div id="columna-derecha">
                        <div class="caracteristicas agrupadas">
                            <div class="sb-columna con-borde">
                                <strong style="color: #74003E;"> Material: </strong>
                <textarea name="material" onkeypress="return z()" maxlength="50ch" required id="material" cols="31" rows="2" placeholder="Calculadora Cientifica, Cuaderno" ></textarea>
                            </div>
                            <div class="sb-columna con-borde">
                                <strong style="color: #74003E;"> Cupo máximo de alumnos: </strong>
                <input type="number"  required id="cupMax" name="cupMax" size="1" max="99" value="1" min="1" onkeypress="return (event.charCode == 00);">
                            </div>
                            <div class="cupo-alumnos con-borde">
                                <strong style="color: #74003E;"> Cupo disponible de alumnos: </strong>
                <input type="number" required id="CupoDis" name="CupoDis"   size="1" max="99" min="1" value="1" readonly >
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
                
                <section class="dias">Lunes
                            <br>
                            <div class="alinearFlex">
                                <input type="time" id="luneshorain" name="luneshorain">-<input type="time" id="luneshorafin" name="luneshorafin">
                            </div>
                        </section>
                        <section class="dias">Martes
                            <br>
                            <div class="alinearFlex">
                                <input type="time" id="marteshorain" name="marteshorain">-<input type="time" id="marteshorafin" name="marteshorafin">
                            </div>
                        </section>
                        <section class="dias">Miércoles
                            <br>
                            <div class="alinearFlex">
                                <input type="time" id="miercoleshorain" name="miercoleshorain">-<input type="time" id="miercoleshorafin" name="miercoleshorafin">
                            </div>
                        </section>
                        <section class="dias">Jueves
                            <br>
                            <div class="alinearFlex">
                                <input type="time" id="jueveshorain" name="jueveshorain">-<input type="time" id="jueveshorafin" name="jueveshorafin">
                            </div>
                        </section>
                        <section class="dias">Viernes
                            <br>
                            <div class="alinearFlex">
                                <input type="time" id="vierneshorain" name="vierneshorain">-<input type="time" id="vierneshorafin" name="vierneshorafin">
                            </div>
                        </section>
                        <section class="dias">Sabado
                            <br>
                            <div class="alinearFlex">
                                <input type="time" id="sabhorain" name="sabhorain">-<input type="time" id="sabhorafin" name="sabhorafin">
                            </div>
                        </section>
                        <section class="dias">Domingo
                            <br>
                            <div class="alinearFlex">
                                <input type="time" id="domhorain" name="domhorain">-<input type="time" id="domhorafin" name="domhorafin">
                            </div>
                        </section>
                </div>
                        

                
            </div>

           
                <div class="tblHorarios agrupadas flex">
                    <input type="submit"  style="cursor: pointer" id="botonEdicion" value="Crear" class="sub">
                    <input type="reset"  style="cursor: pointer" id="botonborrar" value="Cancelar" class="sub">
                </div>
            
           
           

           
            
    </section>
    </div>
</form>

<!--
    <div id="myDropdown" class="dropdown-content">
        <center><a href="perfil.jsp">Mi Perfil</a>
            <a href="cerradoconexito.jsp">Cerrar Sesión</a>
        </center>

    </div>
-->
    
</body>

</html>