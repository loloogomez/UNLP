/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica2;
import PaqueteLectura.Lector;
/**
 *
 * @author low
 */
public class Ejer5 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Persona [][] M = new Persona [5][8];
        String nom;
        int dni = 0;
        int Edad = 0;
        
        System.out.println("ingrese el nombre: ");
        nom = Lector.leerString();
        if (!"ZZZ".equals(nom)){
            System.out.println("ingrese el dni: ");
            dni = Lector.leerInt();
            System.out.println("ingrese la edad: ");
            Edad = Lector.leerInt();
            System.out.println ();
        }
        
        int i = 0;
        int j;
        int cant = 0;
        while (!"ZZZ".equals(nom) && i < 5){
            j = 0;
            while (!"ZZZ".equals(nom) && j < 8){
                Persona P = new Persona (nom, dni, Edad);
                M [i][j] = P;
                cant ++;
                
                System.out.println("ingrese el nombre: ");
                nom = Lector.leerString();
                if (!"ZZZ".equals(nom)){
                    System.out.println("ingrese el dni: ");
                    dni = Lector.leerInt();
                    System.out.println("ingrese la edad: ");
                    Edad = Lector.leerInt();
                }
                System.out.println ();
                j++;
            }
            i++;
        }
        
        int cant2 = 0;
        i = 0;
        while (cant2 < cant){
            j = 0;
            System.out.println ("dia "+ i+ ":");
            while (cant2 < cant && j < 8){
                System.out.println ("turno "+ j + ": "+ M[i][j].getNombre());
                j ++;
                cant2 ++;
            }
            i ++;
        }
        
    }
    
}
