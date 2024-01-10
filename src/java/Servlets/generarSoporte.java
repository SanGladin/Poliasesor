/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Control.AccionesAdmin;
import Modelo.CSoporte;
import Modelo.MUsuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author HP
 */
@WebServlet(name = "generarSoporte", urlPatterns = {"/generarSoporte"})
public class generarSoporte extends HttpServlet {

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
            
            
            
            String fec_sop = request.getParameter("fecha");
            String hor_sop = request.getParameter("hora");
            
            
            String Desc_sop = request.getParameter("descripcion");
            String tip_sop = request.getParameter("errorlista");

            
            System.out.println(fec_sop);
            System.out.println(hor_sop);
            System.out.println(Desc_sop);
            System.out.println(tip_sop);
            
            
            CSoporte c = new CSoporte();
            
            HttpSession sesionCliente = request.getSession();
            
            String usuario = (String) sesionCliente.getAttribute("usuario");
            
          
            c.setFec_sop(fec_sop);
            c.setHor_sop(hor_sop);
            c.setDesc_sop(Desc_sop);
            c.setTip_sop(tip_sop);
            c.setBol_usu(usuario);
            
            System.out.println(usuario);
            
            
            int estatus = AccionesAdmin.generarSoporte(c);
            
            if(estatus > 0){
                
                response.sendRedirect("PrincipalTg.jsp");
                
            }else{
                response.sendRedirect("error.jsp");
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
