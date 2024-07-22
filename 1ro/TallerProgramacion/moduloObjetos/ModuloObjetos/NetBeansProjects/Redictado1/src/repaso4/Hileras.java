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
public class Hileras extends Coro{
    private Corista [][] formacion;
    private int hileras;
    private int CXH;

    public Hileras(String nombre, Director director, int hileras, int CXH) {
        super(nombre, director);
        this.hileras = hileras;
        this.CXH = CXH;
        formacion = new Corista [hileras][CXH];
    }
    
    public Corista[][] getFormacion() {
        return formacion;
    }

    public void setFormacion(Corista[][] formacion) {
        this.formacion = formacion;
    }

    public int getHileras() {
        return hileras;
    }

    public void setHileras(int hileras) {
        this.hileras = hileras;
    }

    public int getCXH() {
        return CXH;
    }

    public void setCXH(int CXH) {
        this.CXH = CXH;
    }
    
    public void agregarCorista(Corista unCorista){
        int i = 0;
        int j;
        boolean listo = false;
        while (i < getHileras() && listo == false){
            j = 0;
            while (j < getCXH() && listo == false)
                if (getFormacion()[i][j] == null){
                    getFormacion()[i][j] = unCorista;
                    listo = true;
                }
                else
                    j++;
            if (listo == false)    
                i++;
        }     
    }
    
    public boolean coroLLeno(){
        boolean listo = false;
        int i = 0;
        int j = 0;
        while (i < getHileras() && listo == false ){
            j = 0; 
            while (j < getCXH() && listo == false){
               if (getFormacion()[i][j] == null)
                   listo = true;
               else
                   j++;
            }
            if (listo == false);
                i++;
        }
        return (i == getHileras()) && (j == getCXH());
    }
    
    public boolean bienFormado(){
        int act = 0;
        int ant = 1000;
        boolean listo = false;
        int i = 0;
        int j = 0;
        while (i < getHileras() && listo == false){
            j = 0;
            if (getFormacion()[i][j].getTono() < ant){
                act = getFormacion()[i][j].getTono();
                ant = getFormacion()[i][j].getTono();
                j++;
            }
            else
                listo = true;
            while (j < getCXH() && listo == false){
                if (getFormacion()[i][j].getTono() != act)
                    listo = true;
                else
                    j++;
            }
            if (listo == false)
                i++;
        }
        return (i == getHileras() && j == getCXH());
    }
    
    public String getString(int i, int j){
        String aux;
        aux = getFormacion()[i][j].getNombre()+ ", ";
        return aux;
    }
}
