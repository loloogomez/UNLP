/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica1.ejercicio5P2;

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
        Mensaje [] Vector = new Mensaje[10];
        int i;
        String mensajeEscondido;
        
        mensajeEscondido = "";
        
        for (i= 0; i< 10; i++){
            System.out.println("ingrese un string: ");
            Mensaje mensaje= new Mensaje (Lector.leerString());
            Vector[i] = mensaje;
        }
        
        for (i= 0; i< 10; i++)
            mensajeEscondido = mensajeEscondido + Vector[i].charAt();
        
        System.out.println(mensajeEscondido);
    }
    
}
