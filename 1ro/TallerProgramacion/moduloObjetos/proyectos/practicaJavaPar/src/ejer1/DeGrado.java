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
public class DeGrado extends Alumno{
    private String carrera;
    
    public DeGrado(int unDni, String unNombre, String unaCarrera){
        super(unDni, unNombre);
        setCarrera(unaCarrera);
    }
    
    public void setCarrera(String unaCarrera){
        carrera = unaCarrera;
    }
    
    public String getCarrera(){
        return carrera;
    }
    
    public boolean graduado(){
        int i = -1;
        boolean aux = false;
        boolean stop = false;
        while (stop == false && i < 5){
            i++;
            if (getMateria()[i] == null)
                stop = true;
        }
        if (i == 4)
            while (stop == false && i > -1){
                i--;
                if (getMateria()[i].getNombreMat().equals("tesina"))
                    stop = true;
            }
        if (stop == true && getMateria()[i].getNota() > 5)
            aux = true;
        return aux;
    }
}
