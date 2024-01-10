<%-- 
    Document   : RegistarUsuario
    Created on : 23/11/2021, 08:37:05 PM
    Author     : Administrador
--%>

<%@page import="Modelo.UnidadesA"%>
<%@page import="java.util.List"%>
<%@page import="Control.AccionesUsuario"%>
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
        if (privilegio == "1") {

        } else {
            response.sendRedirect("RegistrarAdmin.jsp");
        }
    } else {
        response.sendRedirect("Inicio.jsp");
    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="shortcut icon" href="img/xxx.png">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/principal1.css">
    <link rel="stylesheet" href="./css/paginaPrincipal.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    
        <title>Registrar Administrador</title>
        <link rel="stylesheet" href="./css/scrollbar.css">
    <script src="https://kit.fontawesome.com/579fe2a44d.js" crossorigin="anonymous"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Usuario</title>
        <style>
            *{
                font-family: 'Roboto';
            }
        </style>
        <script>
            function uncheck() {
                var checkbox1 = document.getElementById("asesor");
                var checkbox2 = document.getElementById("asesorado");
                checkbox1.onclick = function () {
                    if (checkbox1.checked != false) {
                        checkbox2.checked = null;
                    }
                }

                checkbox2.onclick = function () {
                    if (checkbox2.checked != false) {
                        checkbox1.checked = null;
                    }
                }
            }

            function myFunction() {
                document.getElementById("myDropdown").classList.toggle("show");
            }
            function myFunction1() {
                document.getElementById("myDropdown1").classList.toggle("show");
            }

            // Close the dropdown menu if the user clicks outside of it
            window.onclick = function (event) {

                if (!event.target.matches('.dropbtn')) {
                    var dropdowns = document.getElementsByClassName("dropdown-content");
                    var i;
                    for (i = 0; i < dropdowns.length; i++) {
                        var openDropdown = dropdowns[i];
                        if (openDropdown.classList.contains('show')) {
                            openDropdown.classList.remove('show');
                        }
                    }
                }

            }




            //Validacion campos vacios






        </script>
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
        

    <div class="center">
            <br><br>
            <h1>
                Registrar Usuario
            </h1>

           <form action="guardarUsuario" autocomplete="off" method="POST">

            <input type="file" name="imgUsu" style="border: 2px solid #74003E;
                   background: #74003E;
                   border-radius: 20px; visibility: hidden"/>
            <br>
            <br>
            <label> Boleta: </label>
                   <input type="text" maxlength="11ch" id="boletaUsu" onkeypress="return (event.charCode >= 48 && event.charCode <= 57)" required name="bol_usu" 
                   class="in">
            <br>
            <br>

            <label> Nombre(s):</label>
                   <input type="text" required id="nomUsuario" name="nomUsuario"
                   class="in">
            <br>
            <br>
            <label> Apellidos:</label>
                   <input type="text" required id="apeUsuario" name="apeUsuario"
                   class="in">
            <br>
            <br>
            <label> Contacto: </label>
                   <input type="email" required id="contUsuario" name="contUsuario" 
                   class="in">
            <br>
            <br>
            <br>
            <label> Unidad academica:</label>
            <select disabled id="cecyts" name="cecyts" style="background-color: #74003E">
                <option value="escom"> ESCOM </option>
                
            </select>  
            <br>
            <br>
            <label> Rol: </label>
            <input type="radio" name="radioRol" value="1" style="background: #74003E;">Asesor
            <input type="radio" name="radioRol" value="0" style="background: #74003E;" > Asesorado   
            <br>
            <input type="submit" value="Registrar" class="button">
        </form>

    </center>
    <script>
        function z() {

            if (event.charCode == 60 || event.charCode == 62) {
                Swal.fire(
                        'Error',
                        'Simbolo no permitido',
                        'warning',
                        )
                return (event.charCode !== 60 && event.charCode !== 62);
            }

        }
        window.onkeydown = function () {
            var myInput = document.getElementById('contUsuario');
            myInput.onpaste = function (e) {
                e.preventDefault();

            };

            myInput.oncopy = function (e) {
                e.preventDefault();

            };
            var myInput = document.getElementById('apeUsuario');
            myInput.onpaste = function (e) {
                e.preventDefault();

            };

            myInput.oncopy = function (e) {
                e.preventDefault();

            };
            var myInput = document.getElementById('nomUsuario');
            myInput.onpaste = function (e) {
                e.preventDefault();

            };

            myInput.oncopy = function (e) {
                e.preventDefault();

            };
            var myInput = document.getElementById('boletaUsu');
            myInput.onpaste = function (e) {
                e.preventDefault();

            };
        };

    </script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> 
</body>
</html>

