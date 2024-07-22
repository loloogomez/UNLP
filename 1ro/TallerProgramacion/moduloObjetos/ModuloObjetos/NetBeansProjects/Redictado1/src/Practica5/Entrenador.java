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
public class Entrenador extends Empleado{
    private int campeonatosG;
    
    public Entrenador (String unNombre, double unSueldoB, int unaAntiguedad, int unCampeonatosG){
        super(unNombre, unSueldoB, unaAntiguedad);
        campeonatosG = unCampeonatosG;
    }
    
    public double calcularEfectividad(){
        double aux = getCampeonatosG() / getAntiguedad() * 100;
        return aux;
    }
    
    public double calcularSueldoACobrar(){
        double aux = super.calcularSueldoACobrar();
        if (getCampeonatosG() > 0 && getCampeonatosG() < 5)
            aux = aux + 5000;
        if (getCampeonatosG() > 4 && getCampeonatosG() < 11)
            aux = aux + 30000;
        if (getCampeonatosG() > 11)
            aux = aux + 50000;
        return aux;
    }

    public int getCampeonatosG() {
        return campeonatosG;
    }

    public void setCampeonatosG(int campeonatosG) {
        this.campeonatosG = campeonatosG;
    }
}
