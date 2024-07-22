/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica1;

import PaqueteLectura.Lector;

/**
 *
 * @author User
 */
public class PracticaJava3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        int jugadores = 5;
        double [] vector = new double [jugadores];
        double promedio= 0;
        int cantidad = 0;
        int i;
        for (i=0 ; i < jugadores; i++){
            System.out.println ("ingrese la altura de el jugador: ");
             vector[i]= Lector.leerDouble();
             promedio = promedio + vector[i];
        }
        promedio = promedio / jugadores;
        for (i= 0; i < jugadores; i++){
            if (vector[i] > promedio)
                cantidad ++;
        }    
        System.out.println ("El promedio de altura es de: "+promedio);
        System.out.println ("Hay "+ cantidad + " jugadores con altura superior al promedio" );
        }  
    }