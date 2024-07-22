/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio3;

/**
 *
 * @author User
 */
public class Entrenador {
    private String nombre;
    private double sueldoBasico;
    private int campeonatos;
    
    public Entrenador (String unNombre, double unSueldo, int unNumero){
        nombre = unNombre;
        sueldoBasico = unSueldo;
        campeonatos = unNumero;
    }
    
    public void setNombre(String unNombre){
        nombre = unNombre;
    }
    
    public void setSueldo(double unSueldo){
        sueldoBasico = unSueldo;
    }
    
    public void setCampeonatos (int unNumero){
        campeonatos = unNumero;
    }
    
    public String getNombre(){
        return nombre;
    }
    
    public double getSueldoBasico(){
        return sueldoBasico;
    }
    
    public int getCampeonatos(){
        return campeonatos;
    }
    
    public double calcularSueldoACobrar (){
        double plus = 0;
        if ( campeonatos > 0 && campeonatos < 5)
            plus = 5000;
        if (campeonatos > 4 && campeonatos < 11)
            plus = 30000;
        if (campeonatos > 10)
            plus = 50000;
        
        return sueldoBasico + plus;
    }
    
}
