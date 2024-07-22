/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica5;
import PaqueteLectura.Lector;
/**
 *
 * @author low
 */
public class cargarEmpleado {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        System.out.println ("ingrese el nombre del empleado: ");
        String Nombre = Lector.leerString();
        System.out.println ("ingrese el sueldo base de el empleado: ");
        double SueldoB = Lector.leerDouble();
        System.out.println ("ingrese la antiguedad del empleado: ");
        int Antiguedad = Lector.leerInt();
        System.out.println ("ingrese la cantidad de partidos jugados: ");
        int PartidosJ = Lector.leerInt();
        System.out.println ("ingrese la cantidad de goles anotados: ");
        int Goles = Lector.leerInt();
        
        Jugador jugador = new Jugador (Nombre, SueldoB, Antiguedad, PartidosJ, Goles);
        
        System.out.println (jugador.toString());
        
        System.out.println ();
        System.out.println ("ingrese el nombre del empleado: ");
        Nombre = Lector.leerString();
        System.out.println ("ingrese el sueldo base de el empleado: ");
        SueldoB = Lector.leerDouble();
        System.out.println ("ingrese la antiguedad del empleado: ");
        Antiguedad = Lector.leerInt();
        System.out.println ("ingrese la cantidad de campeonatos ganados: ");
        int CampeonatosG = Lector.leerInt();
        
        Entrenador entrenador = new Entrenador (Nombre, SueldoB, Antiguedad, CampeonatosG);
        
        System.out.println (entrenador.toString());
    }
    
}
