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
public abstract class Alumno {
    private int dni;
    private String nombre;
    private Materia [] materiasA;
    private int cantM;
    
    public Alumno(int dni, String nombre, int cantM) {
        this.dni = dni;
        this.nombre = nombre;
        this.cantM = cantM;
        materiasA = new Materia [cantM];
    }
    
    public void agregarM (Materia unaMateria){
        int i = 0;
        while (i < getCantM() && getMateriasA()[i] != null)
            i++;
        getMateriasA()[i] = unaMateria; 
    }

    public int getCantM() {
        return cantM;
    }

    public void setCantM(int cantM) {
        this.cantM = cantM;
    }
    
    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Materia[] getMateriasA() {
        return materiasA;
    }
    
    public String getString(int i){
        String aux;
        aux = getMateriasA()[i].toString();
        return aux;
    }
    
    public String toString(){
        String aux;
        aux = "dni: "+ getDni()+ ", nombre: "+ getNombre()+ ", ";
        return aux;
    }
}
