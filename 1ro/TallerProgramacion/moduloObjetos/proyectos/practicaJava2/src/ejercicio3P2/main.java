/*
Demo que crea objetos Libro invocando a los constructores definidos. Tema 4.
 */
package ejercicio3P2;

import PaqueteLectura.Lector;

/**
 *
 * @author vsanz
 */
public class main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        System.out.println("ingrese el titulo del libro: ");
        String Titulo = Lector.leerString();
        
        System.out.println("ingrese el nombre del autor: ");
        String Nombre = Lector.leerString();
        System.out.println("ingrese la biografia del autor; ");
        String Biografia = Lector.leerString();
        Autor autor = new Autor (Nombre, Biografia);
        
        System.out.println("ingrese el nombre de la editorial: ");
        String Editorial = Lector.leerString();
        
        System.out.println("ingrese el año de la edicion: ");
        int Anio = Lector.leerInt();
        
        System.out.println("ingrese el ISBN");
        String Isbn = Lector.leerString();
        
        System.out.println("ingrese el precio: ");
        double Precio = Lector.leerDouble();
        
        Libro libro = new Libro (Titulo, autor, Editorial, Anio, Isbn, Precio);
        
        System.out.println(libro.toString());
        System.out.println("Precio del libro: " +libro.getPrecio());
        System.out.println("Año edición del libro: " +libro.getAñoEdicion());
    }
    
}
