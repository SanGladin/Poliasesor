/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Control.AccionesUsuario;
import Modelo.Asesorias;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Administrador
 */
public class crearAsesoria extends HttpServlet {

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
            HttpSession sesionCli = request.getSession(true);
            System.out.println("hola1");
           String nombre,dec,tema,material,zoom;
           String hora1inicio,hora2inicio,hora3inicio,hora4inicio,hora5inicio,
                   hora6inicio,hora7inicio,bolasesor;
           String horafin1,horafin2,horafin3,horafin4,horafin5,horafin6,horafin7;
           int cupmax,cupdis;
           bolasesor =  (String) sesionCli.getAttribute("usuario");
           nombre = request.getParameter("nombre");
              
           dec = request.getParameter("descripcion");
           tema = request.getParameter("temas");
           material = request.getParameter("material");
           zoom = request.getParameter("zoom");
             
           cupmax =  Integer.parseInt(request.getParameter("cupMax"));
           
           cupdis = Integer.parseInt(request.getParameter("CupoDis"));
         
           hora1inicio= request.getParameter("luneshorain");
           hora2inicio= request.getParameter("marteshorain");
           hora3inicio= request.getParameter("miercoleshorain");
           hora4inicio= request.getParameter("jueveshorain");
           hora5inicio= request.getParameter("vierneshorain");
           hora6inicio= request.getParameter("sabhorain");
           hora7inicio= request.getParameter("domhorain");
           horafin1= request.getParameter("luneshorafin");
           horafin2= request.getParameter("marteshorafin");
           horafin3= request.getParameter("miercoleshorafin");
           horafin4= request.getParameter("jueveshorafin");
           horafin5= request.getParameter("vierneshorafin");
           horafin6= request.getParameter("sabhorafin");
           horafin7= request.getParameter("domhorafin");
            
           Asesorias e = new Asesorias();
           e.setBoletaasesor(bolasesor);
           e.setNombre(nombre);
           e.setCupodis(cupdis);
           e.setCupomax(cupmax);
           e.setDescripcion(dec);
           e.setTemas(tema);
           e.setMaterial(material);
           e.setAula(zoom);
           
           if (hora1inicio != ""){
               e.setHora1inicio(hora1inicio);
           }
           if (hora2inicio != ""){
               e.setHora2inicio(hora2inicio);
           }
           if (hora3inicio != ""){
               e.setHora3inicio(hora3inicio);
           }
           if (hora4inicio != ""){
               e.setHora4inicio(hora4inicio);
           }
           if (hora5inicio != ""){
               e.setHora5inicio(hora5inicio);
           }
           if (hora6inicio != ""){
               e.setHora6inicio(hora6inicio);
           }
           if (hora7inicio != ""){
               e.setHora7inicio(hora7inicio);
           }
         
           if (horafin1 != ""){
               e.setHorafin1(horafin1);
           }if(horafin2 != ""){
               e.setHorafin2(horafin2);
           }if(horafin3 != ""){
               e.setHorafin3(horafin3);
           }if(horafin4 != ""){
               e.setHorafin4(horafin4);
           }if(horafin5 != ""){
               e.setHorafin5(horafin5);
           }if(horafin6 != ""){
               e.setHorafin6(horafin6);
           }if(horafin7 != ""){
               e.setHorafin7(horafin7);
           }
            
           int creado = AccionesUsuario.CrearAsesoria(e);
           
         
           
           
           if (creado > 0){
                 AccionesUsuario.CrearAsesoriad(e);
               response.sendRedirect("Asesoriacreada.jsp");
           }else{
               response.sendRedirect("Error.jsp");
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
