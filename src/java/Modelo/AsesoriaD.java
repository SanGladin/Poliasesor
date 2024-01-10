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
public class AsesoriaD {
    
     private String nombre, horainicio, horafin;
    private int id_fec,id_ase;
    
    
    public AsesoriaD(){
        
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getHorainicio() {
        return horainicio;
    }

    public void setHorainicio(String horainicio) {
        this.horainicio = horainicio;
    }

    public String getHorafin() {
        return horafin;
    }

    public void setHorafin(String horafin) {
        this.horafin = horafin;
    }

    public int getId_fec() {
        return id_fec;
    }

    public void setId_fec(int id_fec) {
        this.id_fec = id_fec;
    }

    public int getId_ase() {
        return id_ase;
    }

    public void setId_ase(int id_ase) {
        this.id_ase = id_ase;
    }

}
