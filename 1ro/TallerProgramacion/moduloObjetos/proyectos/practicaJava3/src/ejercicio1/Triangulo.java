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
public class Triangulo extends Figura {
    private double lado1; 
    private double lado2; 
    private double lado3;
    
    public Triangulo (double unLado1, double unLado2, double unLado3, String unColorR, String unColorL){
        super (unColorR, unColorL);
        setLados (unLado1, unLado2, unLado3);
    }
    
    public void setLados(double unLado1, double unLado2, double unLado3){
        lado1 = unLado1;
        lado2 = unLado2;
        lado3 = unLado3;
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
    
    public double calcularArea(){
        double S = (getLado1() + getLado2() + getLado3())/ 2;
        return Math.sqrt(S*(S - getLado1()) * (S - getLado2()) * (S - getLado3()));
    }
    
    public double calcularPerimetro(){
        return (getLado1() + getLado2() + getLado3());
    }
    
    public String toString(){
        String aux = super.toString() + ", lado 1: "+ getLado1()+ ", lado 2: "+ getLado2()+ ", lado 3: "+ getLado3();
        return aux;
    }
    
}
