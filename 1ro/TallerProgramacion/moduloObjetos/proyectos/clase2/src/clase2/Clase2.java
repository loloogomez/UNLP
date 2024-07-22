/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clase2;

/**
 *
 * @author User
 */
public class Clase2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Libro libro = new Libro();
        libro. setTitulo("el principito");
        libro. setEditorial("un planeta");
        libro. setAnioEdicion (2004);
        libro. setPrimerAutor("julio berne");
        libro. setISBN ("12345");
        libro. setPrecio(50.21);
        System.out.println (libro.toString());
    }
    
}
