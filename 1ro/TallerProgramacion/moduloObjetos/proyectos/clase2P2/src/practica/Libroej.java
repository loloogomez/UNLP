/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica;

/**
 *
 * @author User
 */
public class Libroej {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Libro libro = new Libro(); 
        libro.libro("el principito", "un planeta", 2004, "julio berne", "1234", 50.0);
        System.out.println (libro.getPrecioConIva());
    }
    
}
