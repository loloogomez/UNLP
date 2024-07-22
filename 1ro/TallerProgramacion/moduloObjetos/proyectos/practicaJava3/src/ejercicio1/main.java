/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio1;


public class main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Cuadrado cuadrado = new Cuadrado(10,"Rojo", "Negro");
        System.out.println("Representacion del cuadrado: " + cuadrado.toString()); 
       
        Triangulo triangulo = new Triangulo (4, 5, 6, "rojo", "negro");
        System.out.println("Representacion del triangulo: " + triangulo.toString());
        
        
        
    }
    
    
    
}
