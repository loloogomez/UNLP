/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio1;

/**
 *
 * @author User
 */
public class Triangulo {
    private double lado1;
    private double lado2;
    private double lado3;
    private String colorRelleno;
    private String colorLinea;
    
    public Triangulo (double unLado1, double unLado2, double unLado3, String unColor1, String unColor2){
        lado1 = unLado1;
        lado2 = unLado2;
        lado3 = unLado3;
        colorRelleno= unColor1;
        colorLinea= unColor2;
    }
    
    public void setLado1( double unLado){
        lado1 = unLado;
    }
    
    public void setLado2( double unLado){
        lado2 = unLado;
    }
    
    public void setLado3( double unLado){
        lado3 = unLado;
    }
    
    public void setColorRelleno (String unColor){
        colorRelleno = unColor;
    }
    
    public void setColorLinea (String unColor){
        colorLinea = unColor;
    }
    
    public double getLado1(){
        return lado1;
    }
    
    public double getLado2(){
        return lado2;
    }
    
    public double getLado3(){
        return lado3;
    }
    
    public String getColorRelleno(){
        return colorRelleno;
    }
    
    public String getColorLinea(){
        return colorLinea;
    }
    
    public double calcularArea(){
        double S = lado1 + lado2 + lado3;
        S = S/2;
        S = Math.sqrt (S*(S - lado1)*(S - lado2)*(S - lado3));
        return S;
    }
    
    public double calcularPerimetro(){
        return lado1 + lado2 + lado3;
    }
}
