/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica1.ejercicio1P2;

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
        System.out.println("ingrese un nombre: ");
        String nom = Lector.leerString();
        System.out.println("ingrese un DNI: ");
        int dni = Lector.leerInt();
        System.out.println("ingrese una edad: ");
        int edad = Lector.leerInt();
        
        Persona persona1 = new Persona (nom, dni, edad);
        
        System.out.println(persona1.toString());
    }
    
}
