/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso2;

/**
 *
 * @author low
 */
public class Materia {
    private String nombre;
    private double nota;
    private Fecha fecha;

    public Materia(String nombre, double nota, Fecha fecha) {
        this.nombre = nombre;
        this.nota = nota;
        this.fecha = fecha;
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getNota() {
        return nota;
    }

    public void setNota(double nota) {
        this.nota = nota;
    }

    public Fecha getFecha() {
        return fecha;
    }

    public void setFecha(Fecha fecha) {
        this.fecha = fecha;
    }
    
    public String toString(){
        String aux;
        aux = getNombre() + ", "+ getNota() + ", " + getFecha().getDia()+ "/"+ getFecha().getMes()+ "/"+
              getFecha().getAnio()+ ", ";
        return aux;
    }
    
}
