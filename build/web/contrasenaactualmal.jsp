<%-- 
    Document   : cambiarcontra
    Created on : 25/11/2021, 11:02:56 PM
    Author     : Administrador
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<% HttpSession sesionCliente = request.getSession();
    String usuario = (String) session.getAttribute("usuario");
    String privilegio = (String) session.getAttribute("privilegio");
    String rol = (String) session.getAttribute("rol");
    int rola = Integer.parseInt(rol);
    System.out.println(usuario);
    System.out.println(privilegio);
    System.out.println(rol);

 

%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/principal1.css">
    <link rel="stylesheet" href="./css/paginaPrincipal.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <link rel="stylesheet" href="./css/scrollbar.css">
    <script src="https://kit.fontawesome.com/579fe2a44d.js" crossorigin="anonymous"></script>
    <title>Editar Perfil</title>
    <link rel="shortcut icon" href="img/incio.png">


</head>
<script src="JS/perfil2.js"></script>
<body>
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
            <a href="perfil.jsp">Cancelar</a>
        </div>
    </header>
    <br>

     <div class="center">
        <div class="perfildiv">



            <div class="datos">
                <form action="cambiarcontra">
                    <input type="text" name="usu" value="<%=usuario%>" readonly style="visibility: hidden">
                    <h1>Cambiar Contraseña</h1><br>
                    <p class="passtxt">Contraseña Actual:&nbsp;</p> <input type="text" autocomplete="off" class="in"
                        id="contraseact" name="contraseact" onkeypress="z()" minlength="7" maxlength="15" required >
<br>
                    <br>
                    <p class="passtxt">Confirmar Contraseña:&nbsp; </p> <input type="password" autocomplete="off"
                   class="in" onkeypress="z()" name="contrasecon" id="contrasecon" minlength="7" maxlength="15"  required>
                    <br>
                    <br>
                    <p class="passtxt">Contraseña Nueva: &nbsp;</p> 
                    <input type="password" autocomplete="off" class="in" onkeypress="z()" id="contrasenue" name="contrasenue" minlength="7" maxlength="15" required  >
                    <img id="icon" src="img/ver.png" onclick="verpas()" style="margin-left: -2.5vw; width:30px; ">
                    <br> <br>
                    <center>
                        <a href="perfil.jsp"><input type="button"
                                            value="Cancelar" class="button"></a>
                               <input type="submit" value="Confirmar" class="button">

                    </center>


                </form>

            </div>



        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        
         Swal.fire(
                                    'Error',
                                    'Contraseña Incorrecta',
                                    'error',
                                    );
    </script>
</body>

</html>