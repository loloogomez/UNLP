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
public class Balanza {
    private int items;
    private double monto;
    private String resumen;
    
    public Balanza(){
    }
    
    public void iniciarCompra(){
        items= 0;
        monto= 0;
        resumen = "";
    }
    
    public void registrarCompra(Producto unProducto, double unPrecioKg){
        double precioProd = unProducto.getPeso()*unPrecioKg;
        monto = monto + precioProd;
        items= items + 1;
        resumen = resumen + " - " + unProducto.getDescripcion()+": "+ precioProd ;
    }
    
    public double devolverMontoAPagar(){
        return monto;
    }
    
    public String devolverResumenDeCompra(){
        return resumen + " - Total a pagar "+ monto + " pesos por la compra de "+ items+ " productos.";
    }
    
    
    
}
