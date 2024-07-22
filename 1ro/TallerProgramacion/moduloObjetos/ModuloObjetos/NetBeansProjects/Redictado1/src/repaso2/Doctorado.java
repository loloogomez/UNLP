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
public class Doctorado extends Alumno{
    private String titulo;
    private String universidad;

    public Doctorado(String titulo, String universidad, int dni, String nombre, int cantM) {
        super(dni, nombre, cantM);
        this.titulo = titulo;
        this.universidad = universidad;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getUniversidad() {
        return universidad;
    }

    public void setUniversidad(String universidad) {
        this.universidad = universidad;
    }
    
    public String toString2(){
        String aux =" titulo: " + getTitulo() + ", universidad de origen: "+ getUniversidad();
        return aux;
    }
}
