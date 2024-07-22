/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio5;

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
        double Precio;
        String Descripcion;
        Balanza balanza = new Balanza();
        
        balanza.iniciarCompra();
        System.out.println("ingrese el peso del producto: ");
        Peso = Lector.leerDouble();
        while (Peso != 0){
            System.out.println("ingrese la descripcion del producto: ");
            Descripcion = Lector.leerString();
            System.out.println("ingrese el precio por kilo del producto: ");
            Precio = Lector.leerDouble();
            Producto producto = new Producto (Peso, Descripcion);
            balanza.registrarCompra(producto, Precio);
            System.out.println("ingrese el peso del producto: ");
            Peso = Lector.leerDouble();
        }
        
        System.out.println(balanza.devolverResumenDeCompra());
    }
    
}
