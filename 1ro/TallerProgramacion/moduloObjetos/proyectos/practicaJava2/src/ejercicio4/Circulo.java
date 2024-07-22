/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio4;

/**
 *
 * @author User
 */
public class Circulo {
    private double radio;
    private String colorRelleno;
    private String colorLinea;
    
    public Circulo (double unRadio, String unColorDeRelleno, String unColorDeLinea){
        radio = unRadio;
        colorRelleno = unColorDeRelleno;
        colorLinea = unColorDeLinea;
    }
    
    public void SetRadio(double unRadio){
        radio = unRadio;
    }
    
    public void setColorRelleno (String unColorRelleno){
        colorRelleno = unColorRelleno;
    }
    
    public void setColorLiena (String unColorDeLinea){
        colorLinea = unColorDeLinea;
    }
    
    public double getRadio(){
        return radio;
    }
    
    public String getColorRelleno(){
        return colorRelleno;
    }
    
    public String getColorLinea(){
        return colorLinea;
    }
    
    public double getArea(){
        return (radio * radio)*Math.PI;
    }

    public double getPerimetro(){
        return 2*(Math.PI*radio);
    }
}
