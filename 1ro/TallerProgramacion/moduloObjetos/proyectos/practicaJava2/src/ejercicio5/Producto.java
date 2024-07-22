/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio5;

/**
 *
 * @author User
 */
public class Producto {
    private double peso;
    private String descripcion;
    
    public Producto(double unPeso, String unaDescripcion){
        peso = unPeso;
        descripcion = unaDescripcion;
    }
    
    public void setPeso(double unPeso){
        peso = unPeso;
    }
    
    public void serDescripcion(String unaDescripcion){
        descripcion = unaDescripcion;
    }
    
    public double getPeso(){
        return peso;
    }
    
    public String getDescripcion(){
        return descripcion;
    }
}
