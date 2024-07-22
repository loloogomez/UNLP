/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso4;

/**
 *
 * @author low
 */
public class semiCirculo extends Coro{
    private Corista[]formacion;
    private int dimension;

    public semiCirculo(String nombre, Director director, int dimension) {
        super(nombre, director);
        this.dimension = dimension;
        formacion = new Corista [dimension];
    }

    public Corista[] getFormacion() {
        return formacion;
    }

    public void setFormacion(Corista[] formacion) {
        this.formacion = formacion;
    }

    public int getDimension() {
        return dimension;
    }

    public void setDimension(int dimension) {
        this.dimension = dimension;
    }
    
    public void agregarCorista(Corista unCorista){
        int i = 0;
        while (i < dimension && formacion[i] != null)
            i++;
        formacion[i] = unCorista;
    }
    
    public boolean coroLLeno(){
        boolean listo = false;
        int i = 0;
        while (i < getDimension() && listo == false){
            if (getFormacion()[i] == null)
                listo = true;
            else
                i++;
        }
        return (i == getDimension());
    }
    
    public boolean bienFormado(){
        int ant = 1000;
        boolean listo = false;
        int i = 0;
        while (i < getDimension() && listo == false){
            if (getFormacion()[i].getTono() >= ant)
                listo = true;
            else{
                ant = getFormacion()[i].getTono();
                i ++;
            }
        }
        return (i == getDimension());
    }
    
    public String getString(int i){
        String aux;
        aux = getFormacion()[i].getNombre()+ ", ";
        return aux;
    }
}
