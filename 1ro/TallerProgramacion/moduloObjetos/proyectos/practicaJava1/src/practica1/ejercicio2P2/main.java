/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica1.ejercicio2P2;

import PaqueteLectura.GeneradorAleatorio;
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
        
        int cantPer = 15;
        Persona [] personas = new Persona[cantPer];
        int dniMen = 10000000;
        int personaMen = 0;
        int cantidad = 0;
        int i;
        String nom;
        int dni;
        int Edad;
        GeneradorAleatorio.iniciar();
        
        for (i= 0; i< cantPer; i++){
            System.out.println("ingrese un nombre: ");
            nom = Lector.leerString();
            dni = GeneradorAleatorio.generarInt(100000000);
            Edad = GeneradorAleatorio.generarInt(100);
            
            Persona persona = new Persona (nom, dni, Edad);
            personas[i] = persona;
        } 
        
        for (i= 0; i < cantPer; i++){
            if (personas[i].getEdad() > 65)
                cantidad ++;
            
            if (personas[i].getDNI() < dniMen){
                dniMen = personas[i].getDNI();
                personaMen = i;
            }
        }
        
        System.out.println(personas[personaMen].toString());
        System.out.println("cantidad de personas con mas de 65 anios: "+ cantidad);
    }
    
}
