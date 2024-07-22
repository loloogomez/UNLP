/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gomezgarese;

/**
 *
 * @author User
 */
public class Postulado {
    private String nombre;
    private double nota;
    private int aniosC;
    
    public Postulado(String unNombre, double unaNota, int unAnioC){
        nombre = unNombre;
        nota = unaNota;
        aniosC = unAnioC;
    }
    
    public void setNombre (String unNombre){
        nombre = unNombre;
    }
    
    public void setNota(double unaNota){
        nota = unaNota;
    }
    
    public void setAniosC(int unAniosC){
        aniosC = unAniosC;
    }
    
    public String getNombre(){
        return nombre;
    }
    
    public double getNota(){
        return nota;
    }
    
    public int getAniosC(){
        return aniosC;
    }
}
