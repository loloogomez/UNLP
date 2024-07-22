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
public class Libro {
    private String titulo;
    private String primerAutor;
    private String editorial;
    private int anioEdicion;
    private String ISBN;
    private double precio;
    
    public void libro ( String unTitulo, String unaEditorial, int unAnio, String unAutor, String unISBN, double unPrecio){
        titulo = unTitulo;
        editorial = unaEditorial;
        anioEdicion = unAnio;
        primerAutor = unAutor;
        ISBN = unISBN;
        precio = unPrecio;
    }
    
    public double getIVA(){
        return precio*0.21;
    }
    
    public double getPrecioConIva(){
        return precio + this.getIVA();
    }
    
}
