/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio2;

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
        double Peso;
        double Precio = 0;
        Balanza balanza = new Balanza();
        
        balanza.iniciarCompra();
        System.out.println("ingrese el peso del producto: ");
        Peso = Lector.leerDouble();
        if (Peso != 0){
            System.out.println("ingrese el precio por kilo del producto: ");
            Precio = Lector.leerDouble();
        }
        while (Peso != 0){
            balanza.registrarCompra(Peso, Precio);
            System.out.println("ingrese el peso del producto: ");
            Peso = Lector.leerDouble();
            if (Peso != 0){
                System.out.println("ingrese el precio por kilo del producto: ");
                Precio = Lector.leerDouble();
            }
        }
        
        System.out.println(balanza.devolverResumenDeCompra());
    }
    
}
