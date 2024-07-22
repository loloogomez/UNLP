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
public class Libro {
    private String titulo;
    private String primerAutor;
    private String editorial;
    private int anioEdicion;
    private String ISBN;
    private double precio;
    
    public void setTitulo (String unTitulo){
        titulo = unTitulo;
    }
    
    public void setEditorial(String unaEditorial){
        editorial = unaEditorial;
    }
    
    public void setAnioEdicion(int unAnio){
        anioEdicion = unAnio;
    }
    
    public void setPrecio(double unPrecio){
        precio = unPrecio;
    }
    
    public void setPrimerAutor(String unAutor){
        primerAutor = unAutor;
    }
    
    public void setISBN (String unISBN){
        ISBN = unISBN;
    }
    
    public String getTitulo(){
        return titulo;
    }
    
    public double getPrecio(){
        return precio;
    }
    
    
    
    @Override
    public String toString() {
        String aux = titulo + " por " + primerAutor + " - " + anioEdicion + " - ISBN: " + ISBN;
        return (aux);
    }
    
}
