<%-- 
    Document   : Admin
    Created on : 23/11/2021, 07:36:01 PM
    Author     : Administrador
--%>


<%@page import="Modelo.UnidadesA"%>
<%@page import="Modelo.Usuario"%>
<%@page import ="java.util.List"%>
<%@page import ="Modelo.MUsuario"%>
<%@page import="Control.AccionesUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<% HttpSession sesionCliente = request.getSession();
    String usuario = (String)session.getAttribute("usuario");
    String privilegio= (String)session.getAttribute("privilegio");
    String rol = (String)session.getAttribute("rol");
    System.out.println(usuario);
    System.out.println(privilegio);
    System.out.println(rol);
    
    if(usuario != null){
       if(privilegio == "1" || privilegio =="0"){
         
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
        <title>Consultar Usuarios</title>
        <link rel="shortcut icon" href="img/xxx.png">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/579fe2a44d.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="./css/principal1.css">
    <link rel="stylesheet" href="./css/paginaPrincipal.css">
    <link rel="stylesheet" href="./css/correccionbots.css">
    <link rel="stylesheet" href="./css/scrollbar.css">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    
        <script>
            
                function uncheck(){
                    var checkbox1 = document.getElementById("asesor");
                    var checkbox2 = document.getElementById("asesorado");
                    checkbox1.onclick = function(){
                    if(checkbox1.checked != false){
                       checkbox2.checked =null;
                    }
                }

                checkbox2.onclick = function(){
                    if(checkbox2.checked != false){
                        checkbox1.checked=null;
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
                window.onclick = function(event) {

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
                
               
        </script>
         <script src="JS/principal.js"></script>
        
    </head>
    
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
        <h1 > 
            Lista de Usuarios
        </h1>
       
        <div class="table-responsive">
            <table  class="table">
                <thead>
                    <tr>
                        <th>Boleta</th>
                        
                        <th>Password</th>
                        
                        
                        <th>Nombre</th>
                        
                        <th>Apellido</th>
                        
                        <th>Contacto</th>
                        
                        <th>Unidad Academica</th>
                        
                        <th>Rol</th>
                        
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
        
        
        <% 
            List<MUsuario> lista = AccionesUsuario.ConsultarUsuarios(privilegio);
                
            for(MUsuario e : lista){
                    
        %>
        
        <tr>
            <td> <%=e.getBol_usu()%> </td>
            <td> <%=e.getPass_usu()%> </td>
            <td> <%=e.getNom_usu()%> </td>
            <td> <%=e.getApe_usu()%> </td>
            <td> <%=e.getCon_usu()%> </td>
            <td> ESCOM </td>
            <td> <%=e.getRol()%> </td>
            
            <% System.out.println(e.getRol());%>
            
            <td> 
                <a href="editarUsuario?bol_usu=<%=e.getBol_usu()%>&rol=<%=e.getId_rol()%>" 
                       style="color: white;
                       text-decoration: none">
                    <button class="as" >
                        C T.U
                    </button>
                </a>    
            </td>
            
            <td>
                <a href="desactivarUsuario?bol_usu=<%=e.getBol_usu()%>" 
                              style="color: white;
                              text-decoration: none;" >
                    <button class="as">
                        Desactivar
                    </button>
                </a>     
            </td>
        </tr>   
        
        <%
        }
        %>
        
                </tbody>
            </table>
        </div>
               <center><h2 style="color: #74003E">No hay mas Usuarios </h2></center>
       
        
    </body>
</html>
