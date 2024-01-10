/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Control;

import static Control.AccionesUsuario.nombreboleta;
import Modelo.UnidadesA;
import Modelo.AsesoriaD;
import Modelo.ListaUsuarios;
import Modelo.Asesorias;
import Modelo.CNotificaciones;
import Modelo.MUsuario;
import Modelo.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Administrador
 */
public class AccionesUsuario {
    public static int cambiarcontrasena(String usu,String ac,String nue) throws SQLException{
        int cambiada = 0;
          Connection con = Conexion.getConnection();
         System.out.println("actual es :"+ac);
         System.out.println(nue);
          String f = "update MUsuario set pass_usu = '"+nue+"' where bol_usu='"+usu+
                   "' and pass_usu= '"+ac+"' ;";
          Statement ps = con.createStatement();
             cambiada = ps.executeUpdate(f);
       
           
    return cambiada;}
    public static int eliminaralumno(ListaUsuarios e) throws SQLException{
        int eliminado = 0;
          Connection con = Conexion.getConnection();
          System.out.println("el arremangala :"+e.getBol_usu()+" "+e.getIdase());
          String f = "delete from EListaAlumno where bol_usu="+e.getBol_usu()+" and id_ase = "+e.getIdase()+" ;";
          Statement ps = con.createStatement();
            eliminado = ps.executeUpdate(f);
    
    return eliminado;}
    public static List<ListaUsuarios> alumnoslista(int idase) throws SQLException {
        
        List<ListaUsuarios> lista = new ArrayList<ListaUsuarios>();
        
        try {
            Connection con = Conexion.getConnection();

            Statement s = con.createStatement();
                String q = "SELECT bol_usu FROM EListaAlumno WHERE id_ase = "+idase+";";
                ResultSet rs = s.executeQuery(q);

                while (rs.next()) {

                    ListaUsuarios e = new ListaUsuarios();
                     e.setBol_usu(rs.getString(1));
                     Asesorias ed = new Asesorias();
                     ed.setBoletaasesor(e.getBol_usu());
                    String nombre = nombreboleta(ed);
                    e.setNombre(nombre);
                    String cont = contacto(e.getBol_usu());
                    e.setCon(cont);

                    lista.add(e);

                    


                }
            

        } catch (Exception ed) {

            System.out.println("Erro al consultar a los usuarios");
            System.out.println(ed.getMessage());

        }
        return lista;
    }
    public static List<Usuario> datosalumno(String usuario) throws SQLException {
        
        List<Usuario> lista = new ArrayList<Usuario>();
        
        try {
            Connection con = Conexion.getConnection();
            
            Statement s = con.createStatement();
                String q = "select bol_usu,pass_usu,nom_usu,ape_usu"
                        + ",con_usu,id_uni_aca FROM MUsuario WHERE bol_usu="+usuario+";";
                ResultSet rs = s.executeQuery(q);

                while (rs.next()) {

                    Usuario e = new Usuario();
                    e.setUsuario(rs.getString(1));
                    e.setContraseña(rs.getString(2));
                    e.setNombre(rs.getString(3));
                    e.setApellido(rs.getString(4));
                    e.setContacto(rs.getString(5));
                    e.setUnidad(rs.getInt(6));

                    lista.add(e);

                    


                }
            

        } catch (Exception ed) {

            System.out.println("Erro al consultar al usuario");
            System.out.println(ed.getMessage());

        }
        return lista;
    }
    public static int descativarUsuario(String bol_usu) {

        int estatus = 0;

        try {

            Connection con = Conexion.getConnection();
            String q = "UPDATE MUsuario SET est_usu = 0,cons_usu = 0 WHERE bol_usu = ?";
            String f = "UPDATE MAsesoria SET est_ase = 0 WHERE bol_usu = ?";

            PreparedStatement ps = con.prepareStatement(q);
            PreparedStatement pf = con.prepareStatement(f);
            ps.setString(1, bol_usu);
            pf.setString(1, bol_usu);
            estatus = ps.executeUpdate();
            pf.executeUpdate();
            System.out.println("Borrado Exitoso del Empleado");
            con.close();

        } catch (Exception e) {

            System.out.println("Error al borrar al empleado");
            System.out.println(e.getMessage());

        }

        return estatus;

    }
    public static int acativarUsuario(String bol_usu) {

        int estatus = 0;

        try {

            Connection con = Conexion.getConnection();
            String q = "UPDATE MUsuario SET est_usu = 1,cons_usu = 0 WHERE bol_usu = ?";
            String f = "UPDATE MAsesoria SET est_ase = 1 WHERE bol_usu = ?";

            PreparedStatement ps = con.prepareStatement(q);
            PreparedStatement pf = con.prepareStatement(f);
            ps.setString(1, bol_usu);
            pf.setString(1, bol_usu);
            estatus = ps.executeUpdate();
            pf.executeUpdate();
            System.out.println("Borrado Exitoso del Empleado");
            con.close();

        } catch (Exception e) {

            System.out.println("Error al borrar al empleado");
            System.out.println(e.getMessage());

        }

        return estatus;

    }

    public static int editarUsuario(String bol_usu, int a) throws SQLException {

        int estatus = 0;

        try {

            Connection con = Conexion.getConnection();
            if (a == 1) {
                String q = "UPDATE MUsuario SET id_rol = 0 WHERE bol_usu = ? and id_rol=?";
                String f = "UPDATE MAsesoria SET est_ase = 0 WHERE bol_usu = ? and est_ase = 1";
                PreparedStatement ps = con.prepareStatement(q);
                PreparedStatement pf = con.prepareStatement(f);
                pf.setString(1, bol_usu);

                ps.setString(1, bol_usu);
                pf.executeUpdate();
                ps.setInt(2, a);

                estatus = ps.executeUpdate();
            } else {
                String q = "UPDATE MUsuario SET id_rol = 1 WHERE bol_usu = ? and id_rol=?";
                PreparedStatement ps = con.prepareStatement(q);
                String f = "UPDATE MAsesoria SET est_ase = 1  WHERE bol_usu = ? and est_ase = 0";

                PreparedStatement pf = con.prepareStatement(f);
                pf.setString(1, bol_usu);
                ps.setString(1, bol_usu);
                ps.setInt(2, a);

                estatus = ps.executeUpdate();
                pf.executeUpdate();
            }

            System.out.println("Editado Exitoso del Empleado");
            con.close();

        } catch (Exception e) {

            System.out.println("Error al borrar al empleado");
            System.out.println(e.getMessage());

        }

        return estatus;

    }

    public static int registrarUsuario(MUsuario e) {

        int status = 0;
        try {
            Connection con = Conexion.getConnection();
            String q = "INSERT INTO MUsuario(bol_usu, pass_usu, nom_usu, ape_usu, est_usu, can_ase_usu, con_usu, id_uni_aca, id_pri, id_rol, cons_usu)\n"
                    + "			       VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

            PreparedStatement ps = con.prepareStatement(q);

            ps.setString(1, e.getBol_usu());
            ps.setString(2, e.getPass_usu());
            ps.setString(3, e.getNom_usu());
            ps.setString(4, e.getApe_usu());
            ps.setInt(5, e.getEst_usu());
            ps.setInt(6, e.getCan_ase_usu());

            ps.setString(7, e.getCon_usu());
            ps.setInt(8, e.getId_uni_aca());
            ps.setInt(9, e.getId_pri());
            ps.setInt(10, e.getId_rol());
            ps.setInt(11, e.getCons_usu());

            status = ps.executeUpdate();
            System.out.println("Registro de usuario Exitoso");
            con.close();

        } catch (Exception ed) {
            System.out.println("Error al registrar usuario");
            System.out.println(ed.getMessage());
        }
        return status;
    }

    public static List<MUsuario> ConsultarUsuarios(String a) {
        int sa = Integer.parseInt(a);
        List<MUsuario> lista = new ArrayList<MUsuario>();
        System.out.println("sasa" + sa);
        try {
            Connection con = Conexion.getConnection();

            Statement s = con.createStatement();
            if (sa == 1) {
                String q = "SELECT bol_usu, pass_usu, nom_usu, ape_usu, con_usu, id_uni_aca, id_rol FROM MUsuario WHERE id_pri = 2 AND est_usu = 1 AND id_uni_aca=1 ;";
                ResultSet rs = s.executeQuery(q);

                while (rs.next()) {

                    MUsuario e = new MUsuario();

                    e.setBol_usu(rs.getString(1));
                    e.setPass_usu(rs.getString(2));
                    e.setNom_usu(rs.getString(3));
                    e.setApe_usu(rs.getString(4));
                    e.setCon_usu(rs.getString(5));
                    e.setId_uni_aca(rs.getInt(6));
                    e.setId_rol(rs.getInt(7));

                    lista.add(e);

                    if (e.getId_rol() == 0) {

                        e.setRol("asesorado");
                    }

                    if (e.getId_rol() == 1) {
                        e.setRol("asesor");
                    }

                    if (e.getId_rol() == 2) {
                        e.setRol("admin");
                    }

                    System.out.println("id del rol = " + e.getId_rol());
                    System.out.println("rol = " + e.getRol());

                }
            } else {
                String q = "SELECT bol_usu, pass_usu, nom_usu, ape_usu, con_usu, id_uni_aca, id_rol FROM MUsuario WHERE id_pri = 2 AND est_usu = 1 ;";
                ResultSet rs = s.executeQuery(q);

                while (rs.next()) {

                    MUsuario e = new MUsuario();

                    e.setBol_usu(rs.getString(1));
                    e.setPass_usu(rs.getString(2));
                    e.setNom_usu(rs.getString(3));
                    e.setApe_usu(rs.getString(4));
                    e.setCon_usu(rs.getString(5));
                    e.setId_uni_aca(rs.getInt(6));
                    e.setId_rol(rs.getInt(7));

                    lista.add(e);

                    if (e.getId_rol() == 0) {

                        e.setRol("asesorado");
                    }

                    if (e.getId_rol() == 1) {
                        e.setRol("asesor");
                    }

                    if (e.getId_rol() == 2) {
                        e.setRol("admin");
                    }

                    System.out.println("id del rol = " + e.getId_rol());
                    System.out.println("rol = " + e.getRol());

                }
            }

        } catch (Exception ed) {

            System.out.println("Erro al consultar a los usuarios");
            System.out.println(ed.getMessage());

        }
        return lista;
    }
      public static List<MUsuario> ConsultarUsuariosin(String a) {
        int sa = Integer.parseInt(a);
        List<MUsuario> lista = new ArrayList<MUsuario>();
        System.out.println("sasa" + sa);
        try {
            Connection con = Conexion.getConnection();

            Statement s = con.createStatement();
            if (sa == 1) {
                String q = "SELECT bol_usu, pass_usu, nom_usu, ape_usu, con_usu, id_uni_aca, id_rol FROM MUsuario WHERE est_usu = 0 AND id_uni_aca=1 and id_rol != 2;";
                ResultSet rs = s.executeQuery(q);

                while (rs.next()) {

                    MUsuario e = new MUsuario();

                    e.setBol_usu(rs.getString(1));
                    e.setPass_usu(rs.getString(2));
                    e.setNom_usu(rs.getString(3));
                    e.setApe_usu(rs.getString(4));
                    e.setCon_usu(rs.getString(5));
                    e.setId_uni_aca(rs.getInt(6));
                    e.setId_rol(rs.getInt(7));

                    lista.add(e);

                    if (e.getId_rol() == 0) {

                        e.setRol("asesorado");
                    }

                    if (e.getId_rol() == 1) {
                        e.setRol("asesor");
                    }

                    if (e.getId_rol() == 2) {
                        e.setRol("admin");
                    }

                    System.out.println("id del rol = " + e.getId_rol());
                    System.out.println("rol = " + e.getRol());

                }
            } else {
                String q = "SELECT bol_usu, pass_usu, nom_usu, ape_usu, con_usu, id_uni_aca, id_rol FROM MUsuario  WHERE est_usu = 0 AND id_uni_aca=1 and id_pri=1;";
                ResultSet rs = s.executeQuery(q);

                while (rs.next()) {

                    MUsuario e = new MUsuario();

                    e.setBol_usu(rs.getString(1));
                    e.setPass_usu(rs.getString(2));
                    e.setNom_usu(rs.getString(3));
                    e.setApe_usu(rs.getString(4));
                    e.setCon_usu(rs.getString(5));
                    e.setId_uni_aca(rs.getInt(6));
                    e.setId_rol(rs.getInt(7));

                    lista.add(e);

                    if (e.getId_rol() == 0) {

                        e.setRol("asesorado");
                    }

                    if (e.getId_rol() == 1) {
                        e.setRol("asesor");
                    }

                    if (e.getId_rol() == 2) {
                        e.setRol("admin");
                    }

                    System.out.println("id del rol = " + e.getId_rol());
                    System.out.println("rol = " + e.getRol());

                }
            }

        } catch (Exception ed) {

            System.out.println("Erro al consultar a los usuarios");
            System.out.println(ed.getMessage());

        }
        return lista;
    }


    public static List<MUsuario> ConsultarUsuariosadm(String a) {
        int sa = Integer.parseInt(a);
        List<MUsuario> lista = new ArrayList<MUsuario>();
        System.out.println("sasa" + sa);
        try {
            Connection con = Conexion.getConnection();

            Statement s = con.createStatement();
            if (sa == 0) {
                String q = "SELECT bol_usu, pass_usu, nom_usu, ape_usu, con_usu, id_uni_aca, id_rol FROM MUsuario WHERE id_pri = 1 AND est_usu = 1 AND id_uni_aca=1 order by newid() ;";
                ResultSet rs = s.executeQuery(q);

                while (rs.next()) {

                    MUsuario e = new MUsuario();

                    e.setBol_usu(rs.getString(1));
                    e.setPass_usu(rs.getString(2));
                    e.setNom_usu(rs.getString(3));
                    e.setApe_usu(rs.getString(4));
                    e.setCon_usu(rs.getString(5));
                    e.setId_uni_aca(rs.getInt(6));
                    e.setId_rol(rs.getInt(7));

                    lista.add(e);

                    if (e.getId_rol() == 0) {

                        e.setRol("asesorado");
                    }

                    if (e.getId_rol() == 1) {
                        e.setRol("asesor");
                    }

                    if (e.getId_rol() == 2) {
                        e.setRol("admin");
                    }

                    System.out.println("id del rol = " + e.getId_rol());
                    System.out.println("rol = " + e.getRol());

                }
            } else {
                String q = "SELECT bol_usu, pass_usu, nom_usu, ape_usu, con_usu, id_uni_aca, id_rol FROM MUsuario WHERE id_pri = 2 AND est_usu = 1 ;";
                ResultSet rs = s.executeQuery(q);

                while (rs.next()) {

                    MUsuario e = new MUsuario();

                    e.setBol_usu(rs.getString(1));
                    e.setPass_usu(rs.getString(2));
                    e.setNom_usu(rs.getString(3));
                    e.setApe_usu(rs.getString(4));
                    e.setCon_usu(rs.getString(5));
                    e.setId_uni_aca(rs.getInt(6));
                    e.setId_rol(rs.getInt(7));

                    lista.add(e);

                    if (e.getId_rol() == 0) {

                        e.setRol("asesorado");
                    }

                    if (e.getId_rol() == 1) {
                        e.setRol("asesor");
                    }

                    if (e.getId_rol() == 2) {
                        e.setRol("admin");
                    }

                    System.out.println("id del rol = " + e.getId_rol());
                    System.out.println("rol = " + e.getRol());

                }
            }

        } catch (Exception ed) {

            System.out.println("Erro al consultar a los usuarios");
            System.out.println(ed.getMessage());

        }
        return lista;
    }

    public static boolean iniciarsesion(Usuario e) {

        boolean existe = false;
        try {
            System.out.println(e.getUsuario() + " " + e.getContraseña());
            Connection con = Conexion.getConnection();
            String q = "select bol_usu,con_usu from MUsuario where bol_usu=" + e.getUsuario() + " and pass_usu='" + e.getContraseña() + "'";

            Statement ps = con.createStatement();

            ResultSet rs = ps.executeQuery(q);

            if (rs.next()) {

                if (rs.getRow() > 0) {
                    existe = true;
                    System.out.println("si existe");
                } else {
                    System.out.println("No existe");
                }
                System.out.println("Inicio de Sesion Exitoso");
            }

            con.close();

        } catch (SQLException ed) {
            System.out.println("Error al Iniciar sesion usuario");
            System.out.println(ed.getMessage());
        }
        return existe;
    }

    public static int obtenerprivilegio(Usuario e) {
        int pri = 0;
        try {
            Connection con = Conexion.getConnection();
            String q = "select id_pri from musuario where bol_usu=" + e.getUsuario() + "  and pass_usu='" + e.getContraseña() + "'";

            Statement ps = con.createStatement();

            ResultSet rs = ps.executeQuery(q);

            if (rs.next()) {
                pri = rs.getInt(1);
            }

            System.out.println("Privilegio Exitoso");
            con.close();

        } catch (Exception ed) {
            System.out.println("Error al buscar privilegio de usuario");
            System.out.println(ed.getMessage());
        }
        return pri;
    }

    public static int obteneraviso(Usuario e) {
        int cons = 0;
        try {
            Connection con = Conexion.getConnection();
            String q = "select cons_usu from musuario where bol_usu=" + e.getUsuario() + "  and pass_usu='" + e.getContraseña() + "'";

            Statement ps = con.createStatement();

            ResultSet rs = ps.executeQuery(q);

            if (rs.next()) {
                cons = rs.getInt(1);
            }

            System.out.println("Privilegio Exitoso");
            con.close();

        } catch (Exception ed) {
            System.out.println("Error al buscar avisook de usuario");
            System.out.println(ed.getMessage());
        }
        return cons;
    }

    public static int obteneractivo(Usuario e) {
        int act = 0;
        try {
            Connection con = Conexion.getConnection();
            String q = "select est_usu from musuario where bol_usu=" + e.getUsuario() + "  and pass_usu='" + e.getContraseña() + "'";

            Statement ps = con.createStatement();

            ResultSet rs = ps.executeQuery(q);

            if (rs.next()) {
                act = rs.getInt(1);
            }

            System.out.println(act);
            System.out.println("Act Exitoso");
            con.close();

        } catch (Exception ed) {
            System.out.println("Error al buscar activo de usuario");
            System.out.println(ed.getMessage());
        }
        return act;
    }

    public static List<Asesorias> Asesorias(String u) {
        List<Asesorias> lista = new ArrayList<Asesorias>();

        try {

            Connection con = Conexion.getConnection();
            String q = "Select  top 50  [dbo].[MAsesoria].id_ase, [dbo].[MAsesoria].nom_ase, [dbo].[MAsesoria].desc_ase, \n"
                    + "[dbo].[MAsesoria].tem_ase,[dbo].[MAsesoria].cup_max,[dbo].[MAsesoria].cup_dis,[dbo].[MAsesoria].bol_usu from [dbo].[MAsesoria]\n"
                    + "left join [dbo].[EListaAlumno] on [dbo].[MAsesoria].id_ase = [dbo].[EListaAlumno].id_ase\n"
                    + "where [dbo].[EListaAlumno].id_ase is  null and [dbo].[MAsesoria].est_ase=1 and  [dbo].[MAsesoria].bol_usu!= " + u + " and cup_dis != 0  order by NEWID(); ";
            /*Select  top 50  [dbo].[MAsesoria].id_ase, [dbo].[MAsesoria].nom_ase, [dbo].[MAsesoria].desc_ase, 
[dbo].[MAsesoria].tem_ase,[dbo].[MAsesoria].cup_max,[dbo].[MAsesoria].cup_dis,[dbo].[MAsesoria].bol_usu from [dbo].[MAsesoria]
left join [dbo].[EListaAlumno] on [dbo].[MAsesoria].id_ase = [dbo].[EListaAlumno].id_ase
where [dbo].[EListaAlumno].id_ase is null and [dbo].[MAsesoria].est_ase=1 and  [dbo].[MAsesoria].bol_usu!= '2019090388'
             */

            Statement ps = con.createStatement();

            ResultSet rs = ps.executeQuery(q);

            int x = 1;
            while (rs.next()) {
                Asesorias e = new Asesorias();

                e.setId(rs.getInt(1));
                e.setNombre(rs.getString(2));
                e.setDescripcion(rs.getString(3));
                e.setTemas(rs.getString(4));

                e.setCupomax(rs.getInt(5));
                e.setCupodis(rs.getInt(6));
                e.setBoletaasesor(rs.getString(7));

                String nombre = nombreboleta(e);
                e.setNombreasesor(nombre);

                /* e.setNumero(x++);
              e.setUsuario(rs.getString(1));
              e.setNombre(rs.getString(2));
              e.setApellidos(rs.getString(3));
              e.setEmail(rs.getString(4));
              e.setEncuestasre(rs.getInt(5));
              e.setActivo(rs.getInt(6));*/
                lista.add(e);

            }
            System.out.println("Obtencion de Datos Exitoso");
            con.close();
            rs.close();

        } catch (Exception ed) {
            System.out.println("Obtencion de Datos Fail");
            System.out.println(ed.getMessage());
        }
        return lista;
    }
     public static List<Asesorias> Asesoriasa(String u) {
        List<Asesorias> lista = new ArrayList<Asesorias>();

        try {

            Connection con = Conexion.getConnection();
            String q = "Select  top 50  [dbo].[MAsesoria].id_ase, [dbo].[MAsesoria].nom_ase, [dbo].[MAsesoria].desc_ase, \n"
                    + "[dbo].[MAsesoria].tem_ase,[dbo].[MAsesoria].cup_max,[dbo].[MAsesoria].cup_dis,[dbo].[MAsesoria].bol_usu from [dbo].[MAsesoria]\n"
                   + "where [dbo].[MAsesoria].est_ase=1  order by NEWID(); ";
            /*Select  top 50  [dbo].[MAsesoria].id_ase, [dbo].[MAsesoria].nom_ase, [dbo].[MAsesoria].desc_ase, 
[dbo].[MAsesoria].tem_ase,[dbo].[MAsesoria].cup_max,[dbo].[MAsesoria].cup_dis,[dbo].[MAsesoria].bol_usu from [dbo].[MAsesoria]
left join [dbo].[EListaAlumno] on [dbo].[MAsesoria].id_ase = [dbo].[EListaAlumno].id_ase
where [dbo].[EListaAlumno].id_ase is null and [dbo].[MAsesoria].est_ase=1 and  [dbo].[MAsesoria].bol_usu!= '2019090388'
             */

            Statement ps = con.createStatement();

            ResultSet rs = ps.executeQuery(q);

            int x = 1;
            while (rs.next()) {
                Asesorias e = new Asesorias();

                e.setId(rs.getInt(1));
                e.setNombre(rs.getString(2));
                e.setDescripcion(rs.getString(3));
                e.setTemas(rs.getString(4));

                e.setCupomax(rs.getInt(5));
                e.setCupodis(rs.getInt(6));
                e.setBoletaasesor(rs.getString(7));

                String nombre = nombreboleta(e);
                e.setNombreasesor(nombre);

                /* e.setNumero(x++);
              e.setUsuario(rs.getString(1));
              e.setNombre(rs.getString(2));
              e.setApellidos(rs.getString(3));
              e.setEmail(rs.getString(4));
              e.setEncuestasre(rs.getInt(5));
              e.setActivo(rs.getInt(6));*/
                lista.add(e);

            }
            System.out.println("Obtencion de Datos Exitoso");
            con.close();
            rs.close();

        } catch (Exception ed) {
            System.out.println("Obtencion de Datos Fail");
            System.out.println(ed.getMessage());
        }
        return lista;
    }

    public static List<Asesorias> Asesoriasmias(String u) {
        List<Asesorias> lista = new ArrayList<Asesorias>();

        try {

            Connection con = Conexion.getConnection();
            String q = "select id_ase, nom_ase, desc_ase, tem_ase,cup_max,cup_dis, bol_usu"
                    + " from MAsesoria where est_ase = 1 and bol_usu = " + u + " order by id_ase desc; ";

            Statement ps = con.createStatement();

            ResultSet rs = ps.executeQuery(q);

            int x = 1;
            while (rs.next()) {
                Asesorias e = new Asesorias();

                e.setId(rs.getInt(1));
                e.setNombre(rs.getString(2));
                e.setDescripcion(rs.getString(3));
                e.setTemas(rs.getString(4));

                e.setCupomax(rs.getInt(5));
                e.setCupodis(rs.getInt(6));
                e.setBoletaasesor(rs.getString(7));

                String nombre = nombreboleta(e);
                e.setNombreasesor(nombre);

                /* e.setNumero(x++);
              e.setUsuario(rs.getString(1));
              e.setNombre(rs.getString(2));
              e.setApellidos(rs.getString(3));
              e.setEmail(rs.getString(4));
              e.setEncuestasre(rs.getInt(5));
              e.setActivo(rs.getInt(6));*/
                lista.add(e);

            }
            System.out.println("Obtencion de Datos Exitoso");
            con.close();
            rs.close();

        } catch (Exception ed) {
            System.out.println("Obtencion de Datos Fail");
            System.out.println(ed.getMessage());
        }
        return lista;
    }

    public static List<Asesorias> Asesoriastomadas(String u) {
        List<Asesorias> lista = new ArrayList<Asesorias>();

        try {

            Connection con = Conexion.getConnection();
            String q = "Select  top 50  [dbo].[MAsesoria].id_ase, [dbo].[MAsesoria].nom_ase, [dbo].[MAsesoria].desc_ase, \n"
                    + "[dbo].[MAsesoria].tem_ase,[dbo].[MAsesoria].cup_max,[dbo].[MAsesoria].cup_dis,[dbo].[MAsesoria].bol_usu from [dbo].[MAsesoria]\n"
                    + "left join [dbo].[EListaAlumno] on [dbo].[MAsesoria].id_ase = [dbo].[EListaAlumno].id_ase\n"
                    + "where [dbo].[EListaAlumno].id_ase is not null and [dbo].[MAsesoria].est_ase=1 and  [dbo].[MAsesoria].bol_usu!= '" + u + "' ";
            Statement ps = con.createStatement();

            ResultSet rs = ps.executeQuery(q);

            int x = 1;
            while (rs.next()) {
                Asesorias e = new Asesorias();

                e.setId(rs.getInt(1));
                e.setNombre(rs.getString(2));
                e.setDescripcion(rs.getString(3));
                e.setTemas(rs.getString(4));

                e.setCupomax(rs.getInt(5));
                e.setCupodis(rs.getInt(6));
                e.setBoletaasesor(rs.getString(7));

                String nombre = nombreboleta(e);
                e.setNombreasesor(nombre);

                /* e.setNumero(x++);
              e.setUsuario(rs.getString(1));
              e.setNombre(rs.getString(2));
              e.setApellidos(rs.getString(3));
              e.setEmail(rs.getString(4));
              e.setEncuestasre(rs.getInt(5));
              e.setActivo(rs.getInt(6));*/
                lista.add(e);

            }
            System.out.println("Obtencion de Datos Exitoso");
            con.close();
            rs.close();

        } catch (Exception ed) {
            System.out.println("Obtencion de Datos Fail");
            System.out.println(ed.getMessage());
        }
        return lista;
    }

    public static int obtenerrol(Usuario e) {
        int rol = 4;
        try {
            Connection con = Conexion.getConnection();
            String q = "select id_rol from musuario where bol_usu=" + e.getUsuario() + " and pass_usu='" + e.getContraseña() + "'";

            Statement ps = con.createStatement();

            ResultSet rs = ps.executeQuery(q);

            if (rs.next()) {
                rol = rs.getInt(1);
            }

            System.out.println(rol);
            System.out.println("Rol Exitoso");
            con.close();

        } catch (Exception ed) {
            System.out.println("Error al buscar el rol de usuario");
            System.out.println(ed.getMessage());
        }

        return rol;
    }
     public static String obtenercontra(String usu,String cor) 
     {
        String contra = null;
        try {
            Connection con = Conexion.getConnection();
            String q = "select pass_usu from musuario where bol_usu=" + usu + " and con_usu='" +cor + "'";

            Statement ps = con.createStatement();

            ResultSet rs = ps.executeQuery(q);

            if (rs.next()) {
                contra = rs.getString(1);
            }

            System.out.println(contra);
            System.out.println("Rol Exitoso");
            con.close();

        } catch (Exception ed) {
            System.out.println("Error al buscar el rol de usuario");
            System.out.println(ed.getMessage());
        }

        return contra;
    }

    public static String nombreboleta(Asesorias e) {
        String nomboleta = "";
        try {

            Connection con = Conexion.getConnection();
            String q = "select nom_usu, ape_usu"
                    + " from MUsuario where bol_usu = " + e.getBoletaasesor() + "; ";

            Statement ps = con.createStatement();

            ResultSet rs = ps.executeQuery(q);

            int x = 1;
            if (rs.next()) {

                nomboleta = rs.getString(2) + " " + rs.getString(1);
            }
            System.out.println("Obtencion de Datos Exitoso");
            con.close();

        } catch (Exception ed) {
            System.out.println("Obtencion de Datos Fail");
            System.out.println(ed.getMessage());
        }
        return nomboleta;
    }

    public static List<AsesoriaD> Asesoriafecha(int id) {
        List<AsesoriaD> lista = new ArrayList<AsesoriaD>();

        try {

            Connection con = Conexion.getConnection();
            String q = "select top 4 hor_ini_ase,hor_fin_ase,id_fec from dasesoria where id_ase= " + id + " order by id_fec ";

            Statement ps = con.createStatement();

            ResultSet rs = ps.executeQuery(q);

            while (rs.next()) {
                AsesoriaD e = new AsesoriaD();
                e.setHorainicio(rs.getString(1));
                e.setHorafin(rs.getString(2));
                e.setId_fec(rs.getInt(3));
                /* e.setNumero(x++);
              e.setUsuario(rs.getString(1));
              e.setNombre(rs.getString(2));
              e.setApellidos(rs.getString(3));
              e.setEmail(rs.getString(4));
              e.setEncuestasre(rs.getInt(5));
              e.setActivo(rs.getInt(6));*/

                lista.add(e);

            }

            System.out.println("Obtencion de Datos de Fecha Exitoso");
            rs.close();
            con.close();

        } catch (Exception ed) {
            System.out.println("Obtencion de Datos Fail");
            System.out.println(ed.getMessage());
        }
        return lista;
    }

    public static List<AsesoriaD> horariosl(int idase) {
        List<AsesoriaD> lista = new ArrayList<AsesoriaD>();

        try {
            Connection con = Conexion.getConnection();

            String q = "select hor_ini_ase,hor_fin_ase,id_fec,id_ase from [dbo].[DAsesoria]where id_ase = any (select id_ase from\n"
                    + "[dbo].[MAsesoria] where est_ase = 1 and id_ase =  " + idase + ") and id_fec=1 ";

            Statement ps = con.createStatement();
            ResultSet rs = ps.executeQuery(q);

            while (rs.next()) {
                AsesoriaD e = new AsesoriaD();
                e.setHorainicio(rs.getString(1));
                e.setHorafin(rs.getString(2));
                e.setId_fec(rs.getInt(3));
                e.setId_ase(rs.getInt(4));
                /* e.setNumero(x++);
              e.setUsuario(rs.getString(1));
              e.setNombre(rs.getString(2));
              e.setApellidos(rs.getString(3));
              e.setEmail(rs.getString(4));
              e.setEncuestasre(rs.getInt(5));
              e.setActivo(rs.getInt(6));*/

                lista.add(e);

            }
            rs.close();

            System.out.println("Obtencion de Datos de Fecha Exitoso");

            con.close();

        } catch (Exception ed) {
            System.out.println("Obtencion de Datos Fail");
            System.out.println(ed.getMessage());
        }
        return lista;
    }

    public static List<AsesoriaD> horarios2(int idase) {
        List<AsesoriaD> lista = new ArrayList<AsesoriaD>();

        try {
            Connection con = Conexion.getConnection();

            String q = "select hor_ini_ase,hor_fin_ase,id_fec,id_ase from [dbo].[DAsesoria]where id_ase = any (select id_ase from\n"
                    + "[dbo].[MAsesoria] where est_ase = 1 and id_ase =  " + idase + ") and id_fec=2 ";

            Statement ps = con.createStatement();
            ResultSet rs = ps.executeQuery(q);

            while (rs.next()) {
                AsesoriaD e = new AsesoriaD();
                e.setHorainicio(rs.getString(1));
                e.setHorafin(rs.getString(2));
                e.setId_fec(rs.getInt(3));
                e.setId_ase(rs.getInt(4));
                /* e.setNumero(x++);
              e.setUsuario(rs.getString(1));
              e.setNombre(rs.getString(2));
              e.setApellidos(rs.getString(3));
              e.setEmail(rs.getString(4));
              e.setEncuestasre(rs.getInt(5));
              e.setActivo(rs.getInt(6));*/

                lista.add(e);

            }
            rs.close();

            System.out.println("Obtencion de Datos de Fecha Exitoso");

            con.close();

        } catch (Exception ed) {
            System.out.println("Obtencion de Datos Fail");
            System.out.println(ed.getMessage());
        }
        return lista;
    }

    public static List<AsesoriaD> horarios3(int idase) {
        List<AsesoriaD> lista = new ArrayList<AsesoriaD>();

        try {
            Connection con = Conexion.getConnection();

            String q = "select hor_ini_ase,hor_fin_ase,id_fec,id_ase from [dbo].[DAsesoria]where id_ase = any (select id_ase from\n"
                    + "[dbo].[MAsesoria] where est_ase = 1 and id_ase =  " + idase + ") and id_fec=3";

            Statement ps = con.createStatement();
            ResultSet rs = ps.executeQuery(q);

            while (rs.next()) {
                AsesoriaD e = new AsesoriaD();
                e.setHorainicio(rs.getString(1));
                e.setHorafin(rs.getString(2));
                e.setId_fec(rs.getInt(3));
                e.setId_ase(rs.getInt(4));
                /* e.setNumero(x++);
              e.setUsuario(rs.getString(1));
              e.setNombre(rs.getString(2));
              e.setApellidos(rs.getString(3));
              e.setEmail(rs.getString(4));
              e.setEncuestasre(rs.getInt(5));
              e.setActivo(rs.getInt(6));*/

                lista.add(e);

            }
            rs.close();

            System.out.println("Obtencion de Datos de Fecha Exitoso");

            con.close();

        } catch (Exception ed) {
            System.out.println("Obtencion de Datos Fail");
            System.out.println(ed.getMessage());
        }
        return lista;
    }

    public static List<AsesoriaD> horarios4(int idase) {
        List<AsesoriaD> lista = new ArrayList<AsesoriaD>();

        try {
            Connection con = Conexion.getConnection();

            String q = "select hor_ini_ase,hor_fin_ase,id_fec,id_ase from [dbo].[DAsesoria]where id_ase = any (select id_ase from\n"
                    + "[dbo].[MAsesoria] where est_ase = 1 and id_ase =  " + idase + ") and id_fec=4";

            Statement ps = con.createStatement();
            ResultSet rs = ps.executeQuery(q);

            while (rs.next()) {
                AsesoriaD e = new AsesoriaD();
                e.setHorainicio(rs.getString(1));
                e.setHorafin(rs.getString(2));
                e.setId_fec(rs.getInt(3));
                e.setId_ase(rs.getInt(4));
                /* e.setNumero(x++);
              e.setUsuario(rs.getString(1));
              e.setNombre(rs.getString(2));
              e.setApellidos(rs.getString(3));
              e.setEmail(rs.getString(4));
              e.setEncuestasre(rs.getInt(5));
              e.setActivo(rs.getInt(6));*/

                lista.add(e);

            }
            rs.close();

            System.out.println("Obtencion de Datos de Fecha Exitoso");

            con.close();

        } catch (Exception ed) {
            System.out.println("Obtencion de Datos Fail");
            System.out.println(ed.getMessage());
        }
        return lista;
    }

    public static List<AsesoriaD> horarios5(int idase) {
        List<AsesoriaD> lista = new ArrayList<AsesoriaD>();

        try {
            Connection con = Conexion.getConnection();

            String q = "select hor_ini_ase,hor_fin_ase,id_fec,id_ase from [dbo].[DAsesoria]where id_ase = any (select id_ase from\n"
                    + "[dbo].[MAsesoria] where est_ase = 1 and id_ase =  " + idase + ") and id_fec=5";

            Statement ps = con.createStatement();
            ResultSet rs = ps.executeQuery(q);

            while (rs.next()) {
                AsesoriaD e = new AsesoriaD();
                e.setHorainicio(rs.getString(1));
                e.setHorafin(rs.getString(2));
                e.setId_fec(rs.getInt(3));
                e.setId_ase(rs.getInt(4));
                /* e.setNumero(x++);
              e.setUsuario(rs.getString(1));
              e.setNombre(rs.getString(2));
              e.setApellidos(rs.getString(3));
              e.setEmail(rs.getString(4));
              e.setEncuestasre(rs.getInt(5));
              e.setActivo(rs.getInt(6));*/

                lista.add(e);

            }
            rs.close();

            System.out.println("Obtencion de Datos de Fecha Exitoso");

            con.close();

        } catch (Exception ed) {
            System.out.println("Obtencion de Datos Fail");
            System.out.println(ed.getMessage());
        }
        return lista;
    }

    public static List<AsesoriaD> horarios6(int idase) {
        List<AsesoriaD> lista = new ArrayList<AsesoriaD>();

        try {
            Connection con = Conexion.getConnection();

            String q = "select hor_ini_ase,hor_fin_ase,id_fec,id_ase from [dbo].[DAsesoria]where id_ase = any (select id_ase from\n"
                    + "[dbo].[MAsesoria] where est_ase = 1 and id_ase =  " + idase + ") and id_fec=6";

            Statement ps = con.createStatement();
            ResultSet rs = ps.executeQuery(q);

            while (rs.next()) {
                AsesoriaD e = new AsesoriaD();
                e.setHorainicio(rs.getString(1));
                e.setHorafin(rs.getString(2));
                e.setId_fec(rs.getInt(3));
                e.setId_ase(rs.getInt(4));
                /* e.setNumero(x++);
              e.setUsuario(rs.getString(1));
              e.setNombre(rs.getString(2));
              e.setApellidos(rs.getString(3));
              e.setEmail(rs.getString(4));
              e.setEncuestasre(rs.getInt(5));
              e.setActivo(rs.getInt(6));*/

                lista.add(e);

            }
            rs.close();

            System.out.println("Obtencion de Datos de Fecha Exitoso");

            con.close();

        } catch (Exception ed) {
            System.out.println("Obtencion de Datos Fail");
            System.out.println(ed.getMessage());
        }
        return lista;
    }

    public static List<AsesoriaD> horarios7(int idase) {
        List<AsesoriaD> lista = new ArrayList<AsesoriaD>();

        try {
            Connection con = Conexion.getConnection();

            String q = "select hor_ini_ase,hor_fin_ase,id_fec,id_ase from [dbo].[DAsesoria]where id_ase = any (select id_ase from\n"
                    + "[dbo].[MAsesoria] where est_ase = 1 and id_ase =  " + idase + ") and id_fec=7";

            Statement ps = con.createStatement();
            ResultSet rs = ps.executeQuery(q);

            while (rs.next()) {
                AsesoriaD e = new AsesoriaD();
                e.setHorainicio(rs.getString(1));
                e.setHorafin(rs.getString(2));
                e.setId_fec(rs.getInt(3));
                e.setId_ase(rs.getInt(4));
                /* e.setNumero(x++);
              e.setUsuario(rs.getString(1));
              e.setNombre(rs.getString(2));
              e.setApellidos(rs.getString(3));
              e.setEmail(rs.getString(4));
              e.setEncuestasre(rs.getInt(5));
              e.setActivo(rs.getInt(6));*/

                lista.add(e);

            }
            rs.close();

            System.out.println("Obtencion de Datos de Fecha Exitoso");

            con.close();

        } catch (Exception ed) {
            System.out.println("Obtencion de Datos Fail");
            System.out.println(ed.getMessage());
        }
        return lista;
    }

    public static List<AsesoriaD> mishorarios(String usu) {
        List<AsesoriaD> lista = new ArrayList<AsesoriaD>();

        try {
            Connection con = Conexion.getConnection();
            String f = "Select id_ase from [dbo].[EListaAlumno] where bol_usu = " + usu + " and id_ase = any(\n"
                    + "select id_ase from [dbo].[DAsesoria] where bol_usu = " + usu + " and id_ase = any(select id_ase from [dbo].[MAsesoria] where \n"
                    + "est_ase = 1))  order by fec_ins_ase";
            Statement pf = con.createStatement();
            ResultSet rss = pf.executeQuery(f);
            while (rss.next()) {
                AsesoriaD ssd = new AsesoriaD();
                ssd.setId_ase(rss.getInt(1));
                String nom_ase = nombreasesoria(ssd.getId_ase());
                ssd.setNombre(nom_ase);

                lista.add(ssd);
            }
            rss.close();

            System.out.println("Obtencion de id para fecha de Fecha Exitoso");

            con.close();

        } catch (Exception ed) {
            System.out.println("Obtencion de Datos Fail");
            System.out.println(ed.getMessage());
        }
        return lista;
    }

    public static String nombreasesoria(int idase) throws SQLException {
        String asesoria = "";
        try {
            Connection con = Conexion.getConnection();
            String a = "Select nom_ase from Masesoria where id_ase = " + idase + ";";
            Statement pf = con.createStatement();
            ResultSet ra = pf.executeQuery(a);
            if (ra.next()) {
                asesoria = ra.getString(1);

            }
            con.close();
        } catch (Exception ed) {

        }
        return asesoria;
    }

    public static String contacto(String bol) throws SQLException {
        String contacto = "";
        System.out.println("conta cto " + bol);
        try {
            Connection con = Conexion.getConnection();
            String a = "Select con_usu from MUsuario where bol_usu = " + bol + ";";
            Statement pf = con.createStatement();
            ResultSet ra = pf.executeQuery(a);
            if (ra.next()) {
                contacto = ra.getString(1);

            }
            con.close();
        } catch (Exception ed) {

        }
        return contacto;
    }

    public static List<UnidadesA> UnidadesA() {
        List<UnidadesA> lista = new ArrayList<UnidadesA>();

        try {

            Connection con = Conexion.getConnection();
            String q = "select * from CUnidadAcademica ; ";

            Statement ps = con.createStatement();

            ResultSet rs = ps.executeQuery(q);

            while (rs.next()) {
                UnidadesA e = new UnidadesA();
                e.setId(rs.getInt(1));
                e.setNombre(rs.getString(2));
                /* e.setNumero(x++);
              e.setUsuario(rs.getString(1));
              e.setNombre(rs.getString(2));
              e.setApellidos(rs.getString(3));
              e.setEmail(rs.getString(4));
              e.setEncuestasre(rs.getInt(5));
              e.setActivo(rs.getInt(6));*/
                lista.add(e);

            }
            System.out.println("Obtencion de Datos de Fecha Exitoso");
            rs.close();
            con.close();

        } catch (Exception ed) {
            System.out.println("Obtencion de Datos Fail");
            System.out.println(ed.getMessage());
        }
        return lista;
    }

    public static int CrearAsesoria(Asesorias e) {
        int creada = 0;

        System.out.println("Entro");
        try {
            Connection con = Conexion.getConnection();

            String q = "insert into MAsesoria(nom_ase,desc_ase,"
                    + "tem_ase,aul_ase,mat_ase,cup_max,cup_dis,est_ase,bol_usu)"
                    + "values(?,?,?,?,?,?,?,?,?);";

            PreparedStatement ps = con.prepareStatement(q);

            ps.setString(1, e.getNombre());
            ps.setString(2, e.getDescripcion());
            ps.setString(3, e.getTemas());
            ps.setString(4, e.getAula());
            ps.setString(5, e.getMaterial());
            ps.setInt(6, e.getCupomax());
            ps.setInt(7, e.getCupodis());
            ps.setInt(8, 1);
            ps.setString(9, e.getBoletaasesor());

            creada = ps.executeUpdate();

            System.out.println("Registro de administrador Exitoso");
            con.close();

        } catch (Exception ed) {
            System.out.println("Error al registrar administrador");
            System.out.println(ed.getMessage());
        }

        return creada;
    }

    public static List<Asesorias> Obteneridase(String c) {
        List<Asesorias> listaa = new ArrayList<Asesorias>();
        try {
            Connection con = Conexion.getConnection();
            System.out.println("boleta para entrar es " + c);
            String f = "select id_ase from MAsesoria where bol_usu =" + c + ";";
            Statement ps = con.createStatement();

            ResultSet rs = ps.executeQuery(f);

            Asesorias e = new Asesorias();
            while (rs.next()) {
                e.setId(rs.getInt(1));
                listaa.add(e);
            }

            rs.close();
            con.close();
        } catch (Exception ed) {
            System.out.println("Obtencion de Datos Fail");
            System.out.println(ed.getMessage());
        }
        return listaa;
    }

    public static int CrearAsesoriad(Asesorias e) {
        int a = 0;
        try {
            Connection con = Conexion.getConnection();
            String d = "insert into DAsesoria(hor_ini_ase,hor_fin_ase,id_fec,id_ase)"
                    + "values(?,?,?,?);";
            List<Asesorias> idase = Obteneridase(e.getBoletaasesor());
            int id = 0;
            for (Asesorias c : idase) {
                id = c.getId();
            }
            PreparedStatement pd = con.prepareStatement(d);
            pd.setInt(4, id);
            System.out.println(e.getHora1inicio());
            if (e.getHora1inicio() != null && e.getHorafin1() != null) {
                pd.setString(1, e.getHora1inicio());
                pd.setString(2, e.getHorafin1());
                pd.setInt(3, 1);
                a = pd.executeUpdate();
                if (e.getHora2inicio() != null && e.getHorafin2() != null) {
                    pd.setString(1, e.getHora2inicio());
                    pd.setString(2, e.getHorafin2());
                    pd.setInt(3, 2);
                    a = pd.executeUpdate();
                    if (e.getHora3inicio() != null && e.getHorafin3() != null) {
                        pd.setString(1, e.getHora3inicio());
                        pd.setString(2, e.getHorafin3());
                        pd.setInt(3, 3);
                        a = pd.executeUpdate();
                    }
                    if (e.getHora4inicio() != null && e.getHorafin4() != null) {
                        pd.setString(1, e.getHora4inicio());
                        pd.setString(2, e.getHorafin4());
                        pd.setInt(3, 4);
                        a = pd.executeUpdate();
                    }
                    if (e.getHora5inicio() != null && e.getHorafin5() != null) {
                        pd.setString(1, e.getHora5inicio());
                        pd.setString(2, e.getHorafin5());
                        pd.setInt(3, 5);
                        a = pd.executeUpdate();
                    }
                    if (e.getHora6inicio() != null && e.getHorafin6() != null) {
                        pd.setString(1, e.getHora6inicio());
                        pd.setString(2, e.getHorafin6());
                        pd.setInt(3, 6);
                        a = pd.executeUpdate();
                    }
                    if (e.getHora7inicio() != null && e.getHorafin7() != null) {
                        pd.setString(1, e.getHora7inicio());
                        pd.setString(2, e.getHorafin7());
                        pd.setInt(3, 7);
                        a = pd.executeUpdate();
                    }
                }
            }

        } catch (Exception ed) {

        }
        return a;
    }

    public static List<Asesorias> Obtenerdatosase(int id, String bol) {
        List<Asesorias> lista = new ArrayList<Asesorias>();

        try {
            System.out.println(id +" aaaaa");
            System.out.println(bol + " bbbbb");

            Connection con = Conexion.getConnection();
            String q = "select id_ase,nom_ase,desc_ase,tem_ase,aul_ase"
                    + ",mat_ase,cup_max,cup_dis from MAsesoria where est_ase = 1 and id_ase = " + id + "and bol_usu = "
                    + " " + bol + " ; ";

            Statement ps = con.createStatement();

            ResultSet rs = ps.executeQuery(q);

            int x = 1;
            while (rs.next()) {
                Asesorias e = new Asesorias();

                e.setId(rs.getInt(1));
                e.setNombre(rs.getString(2));
                e.setDescripcion(rs.getString(3));
                e.setTemas(rs.getString(4));
                e.setAula(rs.getString(5));
                e.setMaterial(rs.getString(6));
                e.setCupomax(rs.getInt(7));
                e.setCupodis(rs.getInt(8));

                /* e.setNumero(x++);
              e.setUsuario(rs.getString(1));
              e.setNombre(rs.getString(2));
              e.setApellidos(rs.getString(3));
              e.setEmail(rs.getString(4));
              e.setEncuestasre(rs.getInt(5));
              e.setActivo(rs.getInt(6));*/
                lista.add(e);

            }
            System.out.println("Obtencion de Datos para asesoriacreada Exitoso");
            con.close();
            rs.close();

        } catch (Exception ed) {
            System.out.println("Obtencion de Datos para asesoriacreada Fail");
            System.out.println(ed.getMessage());
        }
        return lista;
    }

    public static List<Asesorias> Obtenerdatosase2(int id, String bol) {
        List<Asesorias> lista = new ArrayList<Asesorias>();

        try {

            Connection con = Conexion.getConnection();
            String q = "select id_ase,nom_ase,desc_ase,tem_ase,aul_ase"
                    + ",mat_ase,cup_max,cup_dis from MAsesoria where est_ase = 1"
                    + " and id_ase = " + id + " ;";

            Statement ps = con.createStatement();

            ResultSet rs = ps.executeQuery(q);

            int x = 1;
            while (rs.next()) {
                Asesorias e = new Asesorias();

                e.setId(rs.getInt(1));
                e.setNombre(rs.getString(2));
                e.setDescripcion(rs.getString(3));
                e.setTemas(rs.getString(4));
                e.setAula(rs.getString(5));
                e.setMaterial(rs.getString(6));
                e.setCupomax(rs.getInt(7));
                e.setCupodis(rs.getInt(8));

                /* e.setNumero(x++);
              e.setUsuario(rs.getString(1));
              e.setNombre(rs.getString(2));
              e.setApellidos(rs.getString(3));
              e.setEmail(rs.getString(4));
              e.setEncuestasre(rs.getInt(5));
              e.setActivo(rs.getInt(6));*/
                lista.add(e);

            }
            System.out.println("Obtencion de Datos para asesoriadatos Exitoso");
            con.close();
            rs.close();

        } catch (Exception ed) {
            System.out.println("Obtencion de Datos para asesoriadatos Fail");
            System.out.println(ed.getMessage());
        }
        return lista;
    }

    public static List<Asesorias> Obtenerdatosase3(int id, String bol) {
        List<Asesorias> lista = new ArrayList<Asesorias>();

        try {

            Connection con = Conexion.getConnection();
            String q = "select id_ase,nom_ase,desc_ase,tem_ase,aul_ase\n"
                    + "                ,mat_ase,cup_max,cup_dis,bol_usu from MAsesoria where est_ase = 1\n"
                    + "                     and id_ase = " + id + " and id_ase = any (select id_ase from [dbo].[EListaAlumno] where bol_usu = " + bol + ")  ;";

            Statement ps = con.createStatement();

            ResultSet rs = ps.executeQuery(q);

            int x = 1;
            while (rs.next()) {
                Asesorias e = new Asesorias();

                e.setId(rs.getInt(1));
                e.setNombre(rs.getString(2));
                e.setDescripcion(rs.getString(3));
                e.setTemas(rs.getString(4));
                e.setAula(rs.getString(5));
                e.setMaterial(rs.getString(6));
                e.setCupomax(rs.getInt(7));
                e.setCupodis(rs.getInt(8));
                e.setBoletaasesor(rs.getString(9));

                /* e.setNumero(x++);
              e.setUsuario(rs.getString(1));
              e.setNombre(rs.getString(2));
              e.setApellidos(rs.getString(3));
              e.setEmail(rs.getString(4));
              e.setEncuestasre(rs.getInt(5));
              e.setActivo(rs.getInt(6));*/
                lista.add(e);

            }
            System.out.println("Obtencion de Datos para asesoriadatos Exitoso");
            con.close();
            rs.close();

        } catch (Exception ed) {
            System.out.println("Obtencion de Datos para asesoriadatos Fail");
            System.out.println(ed.getMessage());
        }
        return lista;
    }

    public static List<AsesoriaD> Obtenerdatosased(int id, int fecha) {
        List<AsesoriaD> lista = new ArrayList<AsesoriaD>();

        try {

            Connection con = Conexion.getConnection();
            String q = "select hor_ini_ase,hor_fin_ase from DAsesoria where  id_ase = " + id + " and id_fec =" + fecha + " ; ";

            Statement ps = con.createStatement();

            ResultSet rs = ps.executeQuery(q);

            int x = 1;
            while (rs.next()) {
                AsesoriaD e = new AsesoriaD();

                e.setHorainicio(rs.getString(1));
                e.setHorafin(rs.getString(2));

                /* e.setNumero(x++);
              e.setUsuario(rs.getString(1));
              e.setNombre(rs.getString(2));
              e.setApellidos(rs.getString(3));
              e.setEmail(rs.getString(4));
              e.setEncuestasre(rs.getInt(5));
              e.setActivo(rs.getInt(6));*/
                lista.add(e);

            }
            System.out.println("Obtencion de Datosfecha Exitoso");
            con.close();
            rs.close();

        } catch (Exception ed) {
            System.out.println("Obtencion de Datosfecha Fail");
            System.out.println(ed.getMessage());
        }
        return lista;
    }

    public static int EditarAsesoria(Asesorias e) {
        int update = 0;

        System.out.println("Entro");
        try {
            Connection con = Conexion.getConnection();

            String q = "update MAsesoria set nom_ase=? , desc_ase=? , tem_ase =? , aul_ase=? , mat_ase=?  where id_ase = " + e.getId() + " and bol_usu = " + e.getBoletaasesor()
                    + ";";

            PreparedStatement ps = con.prepareStatement(q);

            ps.setString(1, e.getNombre());
            ps.setString(2, e.getDescripcion());
            ps.setString(3, e.getTemas());
            ps.setString(4, e.getAula());
            ps.setString(5, e.getMaterial());

            update = ps.executeUpdate();

            System.out.println("Update hecha Exitoso");
            con.close();

        } catch (Exception ed) {
            System.out.println("Error al registrar Update");
            System.out.println(ed.getMessage());
        }

        return update;
    }

    public static int EditarAsesoriad(Asesorias e) throws SQLException {
        int a = 0;
        try {
            Connection con = Conexion.getConnection();
                        int id = e.getId();
            String f = "if exists (select id_fec from [dbo].[DAsesoria] where id_fec = ? and id_ase = "+id+" )\n"
                    + " update [dbo].[DAsesoria] set hor_ini_ase = ?, hor_fin_ase = ? where id_fec = ? and id_ase = "+id+""
                    + "					else\n"
                    + "					insert into DAsesoria (hor_ini_ase,hor_fin_ase,id_fec,id_ase)\n"
                    + "					values(?,?,?,"+id+")";


            PreparedStatement pf = con.prepareStatement(f);
             
            System.out.println(e.getHora1inicio());
            if (e.getHora1inicio() != null && e.getHorafin1() != null) {
                pf.setInt(1,1);
                pf.setString(2, e.getHora1inicio());
                pf.setString(3, e.getHorafin1());
                pf.setInt(4, 1);
                pf.setString(5, e.getHora1inicio());
                pf.setString(6, e.getHorafin1());
                pf.setInt(7, 1);
                pf.executeUpdate();

            }

            if (e.getHora2inicio() != null && e.getHorafin2() != null) {
                 pf.setInt(1,2);
                pf.setString(2, e.getHora2inicio());
                pf.setString(3, e.getHorafin2());
                pf.setInt(4, 2);
                pf.setString(5, e.getHora2inicio());
                pf.setString(6, e.getHorafin2());
                pf.setInt(7, 2);
                 pf.executeUpdate();
            }

            if (e.getHora3inicio() != null && e.getHorafin3() != null) {
                 pf.setInt(1,3);
                pf.setString(2, e.getHora3inicio());
                pf.setString(3, e.getHorafin3());
                pf.setInt(4, 3);
                pf.setString(5, e.getHora3inicio());
                pf.setString(6, e.getHorafin3());
                pf.setInt(7, 3);
                 pf.executeUpdate();
            }
            if (e.getHora4inicio() != null && e.getHorafin4() != null) {
                 pf.setInt(1,4);
                pf.setString(2, e.getHora4inicio());
                pf.setString(3, e.getHorafin4());
                pf.setInt(4, 4);
                pf.setString(5, e.getHora4inicio());
                pf.setString(6, e.getHorafin4());
                pf.setInt(7, 4);
                 pf.executeUpdate();
            }   
            System.out.println("el hora viernes es:"+e.getHora5inicio()+" y "+e.getHorafin5()+"" );
            if (e.getHora5inicio() != null && e.getHorafin5() != null) {
                 pf.setInt(1,5);
                pf.setString(2, e.getHora5inicio());
                pf.setString(3, e.getHorafin5());
                pf.setInt(4, 5);
                pf.setString(5, e.getHora5inicio());
                pf.setString(6, e.getHorafin5());
                pf.setInt(7, 5);
                 pf.executeUpdate();
            }
            System.out.println("nmms no sale" + e.getHora6inicio() + " " + e.getHorafin6());
            if (e.getHora6inicio() != null && e.getHorafin6() != null) {
                 pf.setInt(1,6);
                pf.setString(2, e.getHora6inicio());
                pf.setString(3, e.getHorafin6());
                pf.setInt(4, 6);
                pf.setString(5, e.getHora6inicio());
                pf.setString(6, e.getHorafin6());
                pf.setInt(7, 6);
                 pf.executeUpdate();
            }
            if (e.getHora7inicio() != null && e.getHorafin7() != null) {
                 pf.setInt(1,7);
                pf.setString(2, e.getHora7inicio());
                pf.setString(3, e.getHorafin7());
                pf.setInt(4, 7);
                pf.setString(5, e.getHora7inicio());
                pf.setString(6, e.getHorafin7());
                pf.setInt(7, 7);
                 pf.executeUpdate();
            }

        } catch (Exception ed) {
            System.out.println("Error al registrar Update");
            System.out.println(ed.getMessage());
        }
        return a;
    }
    
    
        public static int recibirNotificacion(Asesorias e){
        int a = 0;
        
        try {
             
            Connection con = Conexion.getConnection();
                  
            int id = e.getId();
                        
            String n = "INSERT INTO [dbo].[cnotificaciones] ([id_not], [notificacion])"
                    + "VALUES(?, ?);";
            
            PreparedStatement pn = con.prepareStatement(n);

             
            /**
             * Cambio de Nombre de Asesoria
            */
            
            if(e.getNombre() == null ? e.getNombre() != null : !e.getNombre().equals(e.getNombre())){
            
                String txt_nuevoNombre = "Tu asesor cambio de nombre de Asesoria";
                pn.setInt(1, 1);
                pn.setString(2, txt_nuevoNombre);
                
            }
             
            if(e.getDescripcion()== null ? e.getDescripcion()!= null : !e.getDescripcion().equals(e.getDescripcion())){
            
                String txt_nuevaDesc = "Tu asesor cambio la descripción de la asesoría";
                pn.setInt(1, 2);
                pn.setString(2, txt_nuevaDesc);
                
            }
            
            if(e.getTemas() == null ? e.getTemas() != null : !e.getTemas().equals(e.getTemas())){
            
                String txt_nuevoTema = "Tu asesor cambio el tema de la asesoría";
                pn.setInt(1, 3);
                pn.setString(2, txt_nuevoTema);
                
            }
            
            if(e.getClass() == null ? e.getClass() != null : !e.getClass().equals(e.getClass())){
            
                String txt_nuevoClass = "Tu asesor cambio la clase de la asesoría";
                pn.setInt(1, 3);
                pn.setString(2, txt_nuevoClass);
                
            }
            
            if(e.getMaterial() == null ? e.getMaterial() != null : !e.getMaterial().equals(e.getMaterial())){
            
                String txt_nuevoMaterial = "Tu asesor cambio el material de la asesoría";
                pn.setInt(1, 4);
                pn.setString(2, txt_nuevoMaterial);
                
            }
             
        } catch (Exception ed) {
            
            System.out.println("Error al registrar Update");
            System.out.println(ed.getMessage());
            
        }
        return a;
    }
    
    
    
    public static List<CNotificaciones> Notificacion(String u) {
        
        List<CNotificaciones> lista = new ArrayList<CNotificaciones>();

        try {

            Connection con = Conexion.getConnection();
            
            String q = "SELECT id_not, notificacion\n" +
                        "FROM PoliAsesor.dbo.cnotificaciones; ";
           

            Statement ps = con.createStatement();

            ResultSet rs = ps.executeQuery(q);

            int x = 1;
            
            while (rs.next()) {
                
                CNotificaciones e = new CNotificaciones();

                e.setId_not(rs.getInt(1));
                e.setNoti(rs.getString(2));

                
                lista.add(e);

            }
            System.out.println("Obtencion de Datos Exitoso");
            con.close();
            rs.close();

        } catch (Exception ed) {
            System.out.println("Obtencion de Datos Fail");
            System.out.println(ed.getMessage());
        }
        return lista;
    }
    
    
    

    public static int BorrarAsesoria(Asesorias e) throws SQLException {
        int a = 0;
        try {
            Connection con = Conexion.getConnection();
            String d = "update MAsesoria set est_ase = 2 where id_ase =  "
                    + "" + e.getId() + ";";

            int id = e.getId();
            Statement pd = con.createStatement();
            a = pd.executeUpdate(d);
            System.out.println("Exito al borrar Update");

        } catch (Exception ed) {
            System.out.println("Error al borrar Update");
            System.out.println(ed.getMessage());
        }
        return a;
    }

    public static int InscribirAsesoria(Asesorias e, String u) throws SQLException {
        int a = 0;
        int updates = 0;
        try {
            Connection con = Conexion.getConnection();
            System.out.println("ewl id es: " + e.getId() + "y el usu :" + u);
            int sa = e.getId();
            String h = "select cup_dis from MAsesoria where id_ase='" + e.getId() + "';";
            Statement pd = con.createStatement();
            ResultSet rs = pd.executeQuery(h);
            while (rs.next()) {
                e.setCupodis(rs.getInt(1));
            }
            if (e.getCupodis() != 0) {
                String d = "insert into EListaAlumno values(getdate(),'" + u + "'," + sa + ");";
                System.out.println("aaasientra");
                a = pd.executeUpdate(d);
                System.out.println("Exito al inscribir Update");

                int cuporesta = e.getCupodis() - 1;
                String z = "update MAsesoria set cup_dis=? where id_ase=" + e.getId() + ";";
                PreparedStatement ps = con.prepareStatement(z);
                ps.setInt(1, cuporesta);

                updates = ps.executeUpdate();

            } else {
                updates = 404;
            }

        } catch (Exception ed) {
            System.out.println("Error al inscribir");
            System.out.println(ed.getMessage());
        }
        return updates;
    }

    public static int DardeBajaAsesoria(Asesorias e, String u) throws SQLException {
        int a = 0;
        int updates = 0;
        try {
            Connection con = Conexion.getConnection();
            System.out.println("ewl id es: " + e.getId() + "y el usu :" + u);

            String h = "select cup_max from MAsesoria where id_ase=" + e.getId() + ";";
            Statement pd = con.createStatement();
            ResultSet rs = pd.executeQuery(h);
            while (rs.next()) {
                e.setCupomax(rs.getInt(1));
            }

            String d = "delete from EListaAlumno where bol_usu =" + u + " and id_ase= " + e.getId() + " ";

            a = pd.executeUpdate(d);
            System.out.println("Exito al eliminar Update");

            String g = "select id_ase from MASesoria where id_ase = any (select id_ase from ELista"
                    + "Alumno where id_ase =" + e.getId() + ")";
            Statement pr = con.createStatement();
            ResultSet aa = pr.executeQuery(g);
            int cupooc = 0;
            while (aa.next()) {
                cupooc++;
            }
            int cuporesta = e.getCupomax() - cupooc;
            String z = "update MAsesoria set cup_dis=? where id_ase=" + e.getId() + ";";
            PreparedStatement ps = con.prepareStatement(z);

            ps.setInt(1, cuporesta);

            updates = ps.executeUpdate();

        } catch (Exception ed) {
            System.out.println("Error al inscribir");
            System.out.println(ed.getMessage());
        }
        return updates;
    }

    public static int daraviso(Usuario e) {
        int creada = 0;

        System.out.println("Entro");
        try {
            Connection con = Conexion.getConnection();
            System.out.println("base" + e.getBol() + "" + e.getContraseña());
            String q = "update MUsuario set cons_usu = 1 where bol_usu =" + e.getBol()
                    + " and pass_usu ='" + e.getContraseña() + "' ;";

            Statement ps = con.createStatement();

            creada = ps.executeUpdate(q);

            System.out.println("Registro de aviso Exitoso");
            con.close();

        } catch (Exception ed) {
            System.out.println("Error al registraraviso administrador");
            System.out.println(ed.getMessage());
        }

        return creada;
    }
    public static void enviarConGMail(String usu,String destinatario,String contra) {
    // Esto es lo que va delante de @gmail.com en tu cuenta de correo. Es el remitente también.
     String remitente = "poliasesoripn";  //Para la dirección nomcuenta@gmail.com
     
    Properties props = System.getProperties();
    props.put("mail.smtp.host", "smtp.gmail.com");  //El servidor SMTP de Google
    props.put("mail.smtp.auth", "true");    //Usar autenticación mediante usuario y clave
    props.put("mail.smtp.starttls.enable", "true"); //Para conectar de manera segura al servidor SMTP
    props.put("mail.smtp.port", "587"); //El puerto SMTP seguro de Google

    Session session = Session.getInstance(props,
    new javax.mail.Authenticator() {
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(remitente, "rbuhltzlwocrzggj"); // Update your actual password here.
        }
    });
    MimeMessage message = new MimeMessage(session);

    try {
        message.setFrom(new InternetAddress(remitente));
        message.addRecipient(Message.RecipientType.TO,new InternetAddress(destinatario));   //Se podrían añadir varios de la misma manera
        message.setSubject("Recuperación de contraseña para el uso de PoliAsesor");
        message.setText("Recuperación de contraseña para inicio de sesión por parte del usuario:  "+usu+
                "\nDirección de contacto:  "+destinatario+"\nContraseña:  "+contra+"\n\n\n"
                        + " Para más Aclaraciones favor de contactar a poliasesoripn@gmail.com");
        Transport transport = session.getTransport("smtp");
         String clave = "jose2015";
        transport.connect("smtp.gmail.com", remitente, clave);
        transport.sendMessage(message, message.getAllRecipients());
        transport.close();
    }
    catch (MessagingException me) {
        me.printStackTrace();   //Si se produce un error
    }
}
    
    

}
