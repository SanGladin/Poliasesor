/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Control.AccionesUsuario;
import Modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Administrador
 */
public class registrarsviso extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String usuario,contraseña,aviso;
            
            usuario = request.getParameter("usu");
            contraseña = request.getParameter("cont");
             
            
             Usuario e =new Usuario();
           
            e.setBol(usuario);
            e.setContraseña(contraseña);
            e.setAviso(1);
            e.setUsuario(usuario);
            System.out.println("vontraparaaviso"+contraseña);
            System.out.println(usuario);
            
            int existes = AccionesUsuario.daraviso(e);
            if (existes == 1){
             boolean existe =   AccionesUsuario.iniciarsesion(e);
              if (existe == true){
                
               int act = AccionesUsuario.obteneractivo(e);
               
               if(act ==1){
                    int con = AccionesUsuario.obteneraviso(e);
                    if( con == 1){
                    int pri = AccionesUsuario.obtenerprivilegio(e);
                    
                    
                    if(pri ==0){
                    request.getSession().setAttribute("usuario", e.getUsuario());
                    request.getSession().setAttribute("privilegio", "0");
                    request.getSession().setAttribute("aviso", "1");
                     request.getSession().setAttribute("rol", "2");
                    response.sendRedirect("Admin.jsp");
              
                    }else if (pri ==1){
                        
                    request.getSession().setAttribute("usuario", e.getUsuario());
                    request.getSession().setAttribute("aviso", 1);
                     request.getSession().setAttribute("rol", "2");
                    request.getSession().setAttribute("contra", e.getContraseña());
                    request.getSession().setAttribute("privilegio", "1");
                    
                    response.sendRedirect("Admin.jsp"); 
                    }else if (pri ==2){
                        int rol = AccionesUsuario.obtenerrol(e);
                       
                    if(rol == 0){
                              request.getSession().setAttribute("usuario", e.getUsuario());
                    request.getSession().setAttribute("contra", e.getContraseña());
                    request.getSession().setAttribute("privilegio", "2");
                     request.getSession().setAttribute("rol", "0");
                    request.getSession().setAttribute("aviso", "1");
                    response.sendRedirect("AsesorPrincipal.jsp"); 
                    
                    
                        }else if (rol == 1){
                            request.getSession().setAttribute("usuario", e.getUsuario());
                    request.getSession().setAttribute("contra", e.getContraseña());
                    request.getSession().setAttribute("privilegio", "2");
                     request.getSession().setAttribute("rol", "1");
                    request.getSession().setAttribute("aviso", "1");
                    response.sendRedirect("AsesorPrincipal.jsp");  
                        }
                        
                        
                  
                    }  
                      
               }else if ( con == 0){
                   request.getSession().setAttribute("usuario", e.getUsuario());
                   request.getSession().setAttribute("contra", e.getContraseña());
                    request.getSession().setAttribute("privilegio", "2");
                    
                       request.getSession().setAttribute("aviso", "0");
                      response.sendRedirect("Aviso.jsp");
               }
               }else if (act ==0){
                 response.sendRedirect("Usuarioinactivo.jsp");
               }
             
            }else if( existe == false){
               
               response.sendRedirect("Usuarioinvalido.jsp");
            }
            }else{
                   response.sendRedirect("Inicio.jsp");
            }
        
    }
    }

   // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
