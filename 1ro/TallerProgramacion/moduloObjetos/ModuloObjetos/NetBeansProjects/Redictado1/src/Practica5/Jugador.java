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
public class Jugador extends Empleado {
    private int partidosJ;
    private double goles;
    
    public Jugador (String unNombre, double unSueldoB, int unaAntiguedad, int unPartidosJ, int unGoles){
        super(unNombre, unSueldoB, unaAntiguedad);
        partidosJ = unPartidosJ;
        goles = unGoles;
    }
    
    public double calcularEfectividad(){
        double aux = getGoles() / getPartidosJ()* 100;
        return aux;
    }
    
    public double calcularSueldoACobrar (){
        double aux = super.calcularSueldoACobrar();
        if (this.calcularEfectividad() > 0.5)
            aux = aux + getSueldoB();
        return aux;
    }

    public int getPartidosJ() {
        return partidosJ;
    }

    public void setPartidosJ(int partidosJ) {
        this.partidosJ = partidosJ;
    }

    public double getGoles() {
        return goles;
    }

    public void setGoles(int goles) {
        this.goles = goles;
    }
    
    
}
