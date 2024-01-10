<%-- 
    Document   : Aviso
    Created on : 23/11/2021, 04:40:43 PM
    Author     : Administrador
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% HttpSession sesionCliente = request.getSession();
    String usuario = (String) session.getAttribute("usuario");
    String privilegio = (String) session.getAttribute("privilegio");
    String aviso = (String) session.getAttribute("aviso");
    String cont = (String) session.getAttribute("contra");
    System.out.println(usuario);
    System.out.println(cont);
    System.out.println(privilegio);
    System.out.println(aviso);

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
<html>
    <head>
        <title>Aviso de Privacidad</title>
        <link rel="shortcut icon" href="img/xxx.png">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
        <link  rel="stylesheet" href="css/info.css">
        <link rel="stylesheet" href="./css/scrollbar.css">
    <link rel="stylesheet" href="./css/paginaPrincipal.css">
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


            function prueb() {
                window.alert("Error");
            }
            document.addEventListener('contextmenu', event => event.preventDefault());

        </script>
    </head>
    <body class="cont">



    <center>
        <h1>Aviso de privacidad</h1>
        <div class="politicas">

            <embed  src="pdf/a.pdf#toolbar=0&navpanes=0&scrollbar=0" type="application/pdf" class="pdf" />

        </div>
        <div>
            <form id="aviso" action="registrarsviso">
                <input type="checkbox"  id="billing-checkbox"  style="font-size: 1.5vw;font-weight: 400;">
                <p style="font-size: 1.2vw;font-weight: 400;display: inline"> He leido y acepto las Condiciones del servicio y la Política de
                    privacidad de PoliAsesor.</p><br><br>
                    <input type="text" id="usu" name="usu" value="<%=usuario%>" style="visibility: hidden" >
                    <input type="text" id="cont" name="cont" value="<%=cont%>" style="visibility: hidden" >
                
    <br>
    <fieldset id="billing">
   
   
                <input class="btns" type="reset" onclick="history.back()" value="Regresar">
                <input class="btns" disabled id="cont" class="aa" type="submit" value="Continuar" >
                    </fieldset>

                <br><br><br>

            </form>
            <script>

                document.addEventListener('DOMContentLoaded', function () {
                    // Adjunte el detector de eventos `change` al checkbox
                    document.getElementById('billing-checkbox').onchange = toggleBilling;
                }, false);

                function toggleBilling() {
                    // Seleccione los campos de texto de facturación
                    var billingItems = document.querySelectorAll('#billing input[type="submit"]');

                    // Alternar los campos de texto de facturación
                    for (var i = 0; i < billingItems.length; i++) {
                        billingItems[i].disabled = !billingItems[i].disabled;
                    }
                }

            </script>

        </div>
    </center>
</body>
</html>
