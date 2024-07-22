/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio3;

import PaqueteLectura.Lector;

/**
 *
 * @author User
 */
public class main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        String Nombre;
        double SueldoBasico;
        int Campeonatos;
        
        System.out.println ("ingrese el nombre del DT: ");
        Nombre = Lector.leerString();
        System.out.println("ingrese el sueldo basico: ");
        SueldoBasico = Lector.leerDouble();
        System.out.println("ingrese la cantidad de campeonatos: ");
        Campeonatos = Lector.leerInt();
        
        Entrenador entrenador = new Entrenador(Nombre, SueldoBasico, Campeonatos);
        
        System.out.println(entrenador.calcularSueldoACobrar());
        
    }
    
}
