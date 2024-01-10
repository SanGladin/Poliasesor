/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;


/**
 *
 * @author Administrador
 */
public class ListaUsuarios {
    
    int idlis,idase;
    String bol_usu,nombre,ape,con;
    String tiempo;
    public ListaUsuarios(){
    
}

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApe() {
        return ape;
    }

    public void setApe(String ape) {
        this.ape = ape;
    }

    public String getCon() {
        return con;
    }

    public void setCon(String con) {
        this.con = con;
    }
    

    public int getIdlis() {
        return idlis;
    }

    public void setIdlis(int idlis) {
        this.idlis = idlis;
    }

    public int getIdase() {
        return idase;
    }

    public void setIdase(int idase) {
        this.idase = idase;
    }

    public String getBol_usu() {
        return bol_usu;
    }

    public void setBol_usu(String bol_usu) {
        this.bol_usu = bol_usu;
    }

    public String getTiempo() {
        return tiempo;
    }

    public void setTiempo(String tiempo) {
        this.tiempo = tiempo;
    }
    
}
