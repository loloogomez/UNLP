/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejer1;

/**
 *
 * @author User
 */
public class Materia {
    private String nombreMat;
    private double nota;
    private String fecha;
    
    public Materia(String unNombre, double unaNota, String unaFecha){
        nombreMat = unNombre;
        nota = unaNota;
        fecha = unaFecha;
    }
    
    public void setNombreMat(String unNombre){
        nombreMat = unNombre;
    } 
    
    public void setNota(double unaNota){
        nota = unaNota;
    }
    
    public void setFecha(String unaFecha){
        fecha = unaFecha;
    }
    
    public String getNombreMat(){
        return nombreMat;
    }
    
    public double getNota(){
        return nota;
    }
    
    public String getFecha(){
        return fecha;
    }
    
}
