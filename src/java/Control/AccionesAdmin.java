/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import Modelo.CSoporte;
import Modelo.MUsuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ACER01
 */
public class AccionesAdmin {
    
    
    
    public static int registrarAdmin(MUsuario e){
        
        
       int status=0;
       try{
            Connection con = Conexion.getConnection();
            String q ="INSERT INTO MUsuario(bol_usu, pass_usu, nom_usu, ape_usu, est_usu, can_ase_usu, img_usu, con_usu, id_uni_aca, id_pri, id_rol, cons_usu)\n" +
"			       VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
            
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setString(1,e.getBol_usu());
            ps.setString(2,e.getPass_usu());
            ps.setString(3, e.getNom_usu());
            ps.setString(4, e.getApe_usu());
            ps.setInt(5, e.getEst_usu());
            ps.setInt(6, e.getCan_ase_usu());
            ps.setBlob(7, e.getFoto());
            ps.setString(8, e.getCon_usu());
            ps.setInt(9, e.getId_uni_aca());
            ps.setInt(10,e.getId_pri());
            ps.setInt(11, e.getId_rol());
            ps.setInt(12, e.getCons_usu());
            
            
            status = ps.executeUpdate();
            System.out.println("Registro de usuario Exitoso");
            con.close();
            
                  
       }catch(Exception ed){
           System.out.println("Error al registrar usuario");
           System.out.println(ed.getMessage());
       }
       return status;
    }
    
    public static List<MUsuario> ConsultarAdmin(){
    
        List<MUsuario> lista = new ArrayList<MUsuario>();
        
        try{
            Connection con = Conexion.getConnection();
            String q = "SELECT bol_usu, pass_usu, nom_usu, ape_usu, con_usu, id_uni_aca, id_rol, id_pri FROM MUsuario WHERE est_usu = 1";
            
            Statement s = con.createStatement();
            
            ResultSet rs = s.executeQuery(q);
            
            
            
            while(rs.next()){
            
                MUsuario e = new MUsuario();
               
                
                e.setBol_usu(rs.getString(1));
                e.setPass_usu(rs.getString(2));
                e.setNom_usu(rs.getString(3));
                e.setApe_usu(rs.getString(4));
                e.setCon_usu(rs.getString(5));
                e.setId_uni_aca(rs.getInt(6));
                e.setId_rol(rs.getInt(7));
                e.setId_pri(rs.getInt(8));
                
                if(e.getId_rol() == 0){
                    
                    e.setRol("asesorado");
                    
                }
                
                if(e.getId_rol() == 1){
                    e.setRol("asesor");
                }
                
                
                
                if(e.getId_pri() == 0){
                
                    e.setPrivilegio("adminDios");
                    
                }
                
                if (e.getId_pri() == 1) {
                    
                    e.setPrivilegio("admin");
                    
                }
                
                if (e.getId_pri() == 2) {
                    
                    e.setPrivilegio("usuario");
                    
                }
                
                
                
                System.out.println("id rol = " + e.getId_rol());
                System.out.println("rol = " + e.getRol()); 
                
                System.out.println("id pri = " + e.getId_pri());
                System.out.println("privilegio = " + e.getPrivilegio()); 
                
                
                lista.add(e);
                
                
               
                
            }
        }
        catch(Exception ed){
        
            System.out.println("Erro al consultar a los usuarios");
            System.out.println(ed.getMessage());
            
        }
        return lista;
    }
    
    public static int descativarUsuario(String bol_usu ){
    
        int estatus = 0;
        
        try {
            
            Connection con = Conexion.getConnection();
            String q = "UPDATE MUsuario SET est_usu = 0 WHERE bol_usu = ?";
            
            PreparedStatement ps = con.prepareStatement(q);
            
            ps.setString(1, bol_usu);
            
            estatus = ps.executeUpdate();
            
            System.out.println("Borrado Exitoso del Empleado");
            con.close();
            
            
            
            
            
        } catch (Exception e) {
            
            System.out.println("Error al borrar al empleado");
            System.out.println(e.getMessage());
            
            
        }
        
        return estatus;
        
        
        
    }
    
    
    public static int generarSoporte(CSoporte c){
        
        
       int status=0;
       
       try{
            Connection con = Conexion.getConnection();
            
            String q ="INSERT INTO [dbo].[CSoporte]([fec_sop],[hor_sop],[desc_sop],[tip_sop],[bol_usu])\n" +
        "     VALUES\n" +
        "           ( ?, ?, ?, ?, ?)";
            
            
            PreparedStatement ps = con.prepareStatement(q);
            
            
            ps.setString(1, c.getFec_sop());
            ps.setString(2, c.getHor_sop());
            ps.setString(3, c.getDesc_sop());
            ps.setString(4, c.getTip_sop());
            ps.setString(5, c.getBol_usu());
            
            
            
            status = ps.executeUpdate();
            
            System.out.println("Registro de soporte Exitoso");
            
            con.close();
            
                  
       }catch(Exception ed){
           
           System.out.println("Error al registrar el soporte");
           
           System.out.println(ed.getMessage());
           
       }
       
       return status;
    }
    
    
    public static List<CSoporte> verTickets(){
    
        List<CSoporte> lista = new ArrayList<CSoporte>();
        
        try{
            Connection con = Conexion.getConnection();
            String q = "SELECT TOP (1000) [fol_sop], [fec_sop] ,[hor_sop] ,[desc_sop] ,[tip_sop],[bol_usu] FROM [PoliAsesor].[dbo].[CSoporte]";
            
            Statement s = con.createStatement();
            
            ResultSet rs = s.executeQuery(q);
            
            
            while(rs.next()){
            
                CSoporte c = new CSoporte();
               
                
                c.setFol_usu(rs.getString(1));
                c.setFec_sop(rs.getString(2));
                c.setHor_sop(rs.getString(3));
                c.setDesc_sop(rs.getString(4));
                c.setTip_sop(rs.getString(5));
                c.setBol_usu(rs.getString(6));
                
                
                lista.add(c);
                
                System.out.println(lista);
                
               
                
            }
        }
        catch(Exception ed){
        
            System.out.println("Erro al consultar a los usuarios");
            System.out.println(ed.getMessage());
            
        }
        return lista;
        
        
    }
    
}
