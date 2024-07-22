/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica1.ejercicio5P2;

/**
 *
 * @author User
 */
public class Mensaje {
    private String msj;
    
    public Mensaje(String unMensaje){
        msj = unMensaje;
    }

    public char charAt(){
        return msj.charAt(0);
    }
}