/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica5;

/**
 *
 * @author low
 */
public abstract class Empleado {
    private String nombre;
    private double sueldoB;
    private int antiguedad;
    
    public Empleado (String unNombre, double unSueldoB, int unaAntiguedad){
        nombre = unNombre;
        sueldoB = unSueldoB;
        antiguedad = unaAntiguedad;
    }
    
    public abstract double calcularEfectividad ();
    
    public double calcularSueldoACobrar (){
        double aux = getSueldoB() / 100 * 10;
        aux = getSueldoB() + aux * getAntiguedad();
        return aux;
    }
    
    public String toString(){
        String aux = "Nombre: " + getNombre() +
                     " sueldo a cobrar: " + this.calcularSueldoACobrar() +
                     " efectividad: " + this.calcularEfectividad() + "%"; 
        return aux;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getSueldoB() {
        return sueldoB;
    }

    public void setSueldoB(double sueldoB) {
        this.sueldoB = sueldoB;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }
}
