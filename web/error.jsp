<%-- 
    Document   : error
    Created on : 24/11/2021, 09:30:20 PM
    Author     : Administrador
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<% HttpSession sesionCliente = request.getSession();
    String usuario = (String) session.getAttribute("usuario");
    String privilegio = (String) session.getAttribute("privilegio");
    String rol = (String) session.getAttribute("rol");
    System.out.println(usuario);
    System.out.println(privilegio);
    System.out.println(rol);

 

%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="shortcut icon" href="img/error.png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/error.css">
    <link rel="stylesheet" href="./css/scrollbar.css">


    <title>Error</title>

</head>

<body>

    <div class="alinear">
        <div class="imgerror">
            <h1>Ha ocurrido un error, lamentamos las molestias</h1>
            <br>
            <h2>Si deseas contactarte con soporte al cliente da clic aquí</h2>
            <br>
            <div>
                <a href="soporte.jsp" class="btn">Soporte técnico</a>
            </div>
            <br>
            <h2>Si deseas volver a PoliAsesor da clic aquí</h2>
            <br>
            <div>
                <a href="Inicio.jsp" class="btn">PoliAsesor</a>
            </div>
            <div class="contImg">
                <img src="./img/404.png" class="img">
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="JS/error.js"></script>
</body>

</html>