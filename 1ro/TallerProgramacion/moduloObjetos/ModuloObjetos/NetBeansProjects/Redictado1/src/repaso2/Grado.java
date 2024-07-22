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
public class Grado extends Alumno{
    private String carrera;

    public Grado(String carrera, int dni, String nombre, int cantM) {
        super(dni, nombre, cantM);
        this.carrera = carrera;
    }
    
    public boolean finalizo (){
        int i = 0;
        boolean j = false;
        while (i < getCantM() && getMateriasA()[i] != null){
            if (!getMateriasA()[i].getNombre().equals("Tesis"))
                j = true;
            i++;
        }
        return i == getCantM() && j == true;
    }
    
    public String getCarrera() {
        return carrera;
    }

    public void setCarrera(String carrera) {
        this.carrera = carrera;
    }
    
     public String toString2(){
        String aux =" esta graduado: "+ finalizo()+ ", carrera: "+ getCarrera();
        return aux;
    }
}
