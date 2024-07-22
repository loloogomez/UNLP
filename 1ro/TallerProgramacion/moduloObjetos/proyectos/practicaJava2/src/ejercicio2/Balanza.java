/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio2;

/**
 *
 * @author User
 */
public class Balanza {
    private int items;
    private double monto;
    
    public Balanza(){
    }
    
    public void iniciarCompra(){
        items= 0;
        monto= 0;
    }
    
    public void registrarCompra(double unPeso, double unPrecio){
        monto = monto + unPeso * unPrecio;
        items= items + 1;
    }
    
    public double devolverMontoAPagar(){
        return monto;
    }
    
    public String devolverResumenDeCompra(){
        return "Total a pagar "+ monto+ " por la compra de "+ items+ " productos";
    }
}
