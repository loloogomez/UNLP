/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica1.ejercicio5;
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
        int pisos = 9;
        int oficinas = 5;
        int [][] edificio = new int [pisos][oficinas];
        int oficina;
        System.out.println("ingrse un piso: ");
        int piso = Lector.leerInt();
        
        while (piso != 9){
            System.out.println("ingrese una oficina: ");
            oficina = Lector.leerInt();
            edificio[piso][oficina] ++;
            System.out.println("ingrese un piso: ");
            piso = Lector.leerInt();
        }
        
        for (piso = 1; piso < 9; piso ++ ){
            for (oficina = 1; oficina < 5; oficina ++){
                System.out.println("oficina "+ oficina + " piso "+ piso+ ": "+ edificio[piso][oficina]);
            }
        }
        
    }
    
}
