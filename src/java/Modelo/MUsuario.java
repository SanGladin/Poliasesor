/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import java.io.InputStream;

/**
 *
 * @author Administrador
 */
public class MUsuario {
    private String bol_usu, pass_usu, nom_usu, ape_usu, img_usu, con_usu, Rol, privilegio;
    private int cons_usu;
    private InputStream foto;

    public InputStream getFoto() {
        return foto;
    }

    public void setFoto(InputStream foto) {
        this.foto = foto;
    }
    

    public String getPrivilegio() {
        return privilegio;
    }

    public void setPrivilegio(String privilegio) {
        this.privilegio = privilegio;
    }
    
    public int getCons_usu() {
        return cons_usu;
    }

    public void setCons_usu(int cons_usu) {
        this.cons_usu = cons_usu;
    }

    public String getRol() {
        return Rol;
    }

    public void setRol(String Rol) {
        this.Rol = Rol;
    }
            
    private int est_usu, can_ase_usu, id_uni_aca, id_pri, id_rol;

    public String getBol_usu() {
        return bol_usu;
    }

    public void setBol_usu(String bol_usu) {
        this.bol_usu = bol_usu;
    }

    public String getPass_usu() {
        return pass_usu;
    }

    public void setPass_usu(String pass_uss) {
        this.pass_usu = pass_uss;
    }

    public String getNom_usu() {
        return nom_usu;
    }

    public void setNom_usu(String nom_usu) {
        this.nom_usu = nom_usu;
    }

    public String getApe_usu() {
        return ape_usu;
    }

    public void setApe_usu(String ape_usu) {
        this.ape_usu = ape_usu;
    }

    public String getImg_usu() {
        return img_usu;
    }

    public void setImg_usu(String img_usu) {
        this.img_usu = img_usu;
    }

    public String getCon_usu() {
        return con_usu;
    }

    public void setCon_usu(String con_usu) {
        this.con_usu = con_usu;
    }

    public int getEst_usu() {
        return est_usu;
    }

    public void setEst_usu(int est_usu) {
        this.est_usu = est_usu;
    }

    public int getCan_ase_usu() {
        return can_ase_usu;
    }

    public void setCan_ase_usu(int can_ase_usu) {
        this.can_ase_usu = can_ase_usu;
    }

    public int getId_uni_aca() {
        return id_uni_aca;
    }

    public void setId_uni_aca(int id_uni_aca) {
        this.id_uni_aca = id_uni_aca;
    }

    public int getId_pri() {
        return id_pri;
    }

    public void setId_pri(int id_pri) {
        this.id_pri = id_pri;
    }

    public int getId_rol() {
        return id_rol;
    }

    public void setId_rol(int id_rol) {
        this.id_rol = id_rol;
    }
    
    
    
}


