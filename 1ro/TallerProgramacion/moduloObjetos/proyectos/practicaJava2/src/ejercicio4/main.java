/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio4;

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
        double Radio;
        String ColorRelleno;
        String ColorLinea;
        
        System.out.println("ingrese un radio: ");
        Radio = Lector.leerDouble();
        System.out.println("ingrese un color de relleno: ");
        ColorRelleno = Lector.leerString();
        System.out.println("ingrese un color de linea: ");
        ColorLinea = Lector.leerString();
        
        Circulo circulo = new Circulo (Radio, ColorRelleno, ColorLinea);
        
        System.out.println(circulo.getArea());
        System.out.println(circulo.getPerimetro());
    }
    
}
