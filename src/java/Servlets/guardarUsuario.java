/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;


import Control.AccionesAdmin;
import Control.AccionesUsuario;
import Modelo.MUsuario;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;



/**
 *
 * @author ACER01
 */
@WebServlet(name = "guardarUsuario", urlPatterns = {"/guardarUsuario"})
public class guardarUsuario extends HttpServlet {

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
            
            
            
            
            String bol_usu = request.getParameter("bol_usu");
            String pass_usu = request.getParameter("passUsuario");
            String nom_usu = request.getParameter("nomUsuario");
            String ape_usu = request.getParameter("apeUsuario");
            String img_usu = null;
            String con_usu = request.getParameter("contUsuario");
            int Rol = Integer.parseInt(request.getParameter("radioRol"));
            int can_ase_usu = 0;
            int id_uni_aca = 1;
            int id_pri = 2;
            int est_usu = 1;
            
            
            
            int cons_usu = 0;
             System.out.println(bol_usu);
            System.out.println(pass_usu);
            System.out.println(nom_usu);
            System.out.println(ape_usu);
            System.out.println(est_usu);
            System.out.println(can_ase_usu);
            System.out.println(img_usu);
            System.out.println(con_usu);
            System.out.println(id_uni_aca);
            System.out.println(id_pri);
   
            System.out.println(Rol);
            System.out.println(cons_usu);
            
            
            
            
         
            
            
            
            
            
            
            
           
            
            
            GenerarPasswords genPass = new GenerarPasswords();
            
            String passgenrada = GenerarPasswords.getRandomString(12);
            
            System.out.println(passgenrada);
            
            
            MUsuario e = new MUsuario();
            
            
            e.setBol_usu(bol_usu);
            e.setPass_usu(passgenrada);
            e.setNom_usu(nom_usu);
            e.setApe_usu(ape_usu);
            e.setEst_usu(est_usu);
            e.setCan_ase_usu(can_ase_usu);
            
            e.setCon_usu(con_usu);
            e.setId_uni_aca(id_uni_aca);
            e.setId_pri(id_pri);
            e.setId_rol(Rol);
            e.setCons_usu(cons_usu);
            
//            
            
            int estatus = AccionesUsuario.registrarUsuario(e);
            
            if(estatus > 0){
                 request.getSession().setAttribute("usuarioregistrado", e.getNom_usu()+" "+e.getApe_usu());
                              request.getSession().setAttribute("usuarioboleta", e.getBol_usu());
                 request.getSession().setAttribute("contraseña", e.getPass_usu());
                response.sendRedirect("UsuarioCreado.jsp");
            }else{
                response.sendRedirect("usuarioexistente.jsp");
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
