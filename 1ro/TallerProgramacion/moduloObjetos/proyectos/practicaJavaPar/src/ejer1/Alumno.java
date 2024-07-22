/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejer1;

/**
 *
 * @author User
 */
public abstract class Alumno {
    private int dni;
    private String nombre;
    private Materia [] materia = new Materia [5];
    
    public Alumno (int unDni, String unNombre){
        setDni(unDni);
        setNombre(unNombre);
    }
    
    public void setDni(int unDni){
        dni = unDni;
    }
    
    public void setNombre (String unNombre){
        nombre = unNombre;
    }
    
    public void setMateria (Materia unaMateria){
        int i = -1;
        boolean stop = false;
        while (stop == false && i < 5){
            i++;
            if (materia[i] == null)
                stop = true;
        }
        materia[i] = unaMateria;
    }
    
    public int getDni(){
        return dni;
    }
    
    public String getNombre(){
        return nombre;
    }
    
    public Materia[] getMateria(){
        return materia;
    }
    
    
    public String toString(){
        String aux = getDni()+ "; "+ getNombre()+ "; materias aprobadas: "+
    }
    
    public abstract boolean graduado();
    
}
