/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio5P2;

/**
 *
 * @author User
 */
public class FlotaDeMicros {
    private Micro [] cantidadMicros = new Micro[15];
    
    public FlotaDeMicros(){
    }
    
    public boolean flotaCompleta(){
        boolean aux = true;
        int i = -1;
        while ( aux == true && i < 15){
            i++;
            if (cantidadMicros[i] == null)
                aux = false;
        }
        return aux;
    }
    
    public void agregarMicro (Micro unMicro){
        int i = -1;
        boolean stop = false;
        while (stop == false){
            i++;
            if (cantidadMicros[i] == null)
                stop = true;
        }
        cantidadMicros[i] = unMicro;
    }
    
    public boolean eliminarMicro (String unaPatente){
        int i = -1;
        boolean stop = false;
        while (stop == false && i < 15){
            i++;
            if (cantidadMicros[i] != null)
                if ( cantidadMicros[i].getPatente().equals(unaPatente)){
                    cantidadMicros[i] = null;
                    stop = true;
                }
        }
        return stop;
    }
    
    public Micro getMicroPatente(String unaPatente){
        int i = -1;
        boolean stop = false;
        while (stop == false && i < 15){
            i++;
            if (cantidadMicros[i] != null)
                if (cantidadMicros[i].getPatente() .equals(unaPatente))
                    stop = true;
        }
        if (stop == true)
            return cantidadMicros[i];
        else
            return null;
    }
    
    public Micro getMicroDestino (String unDestino){
        int i = -1;
        boolean stop = false;
        while (stop == false && i < 15){
            i++;
            if (cantidadMicros[i] != null)
                if (cantidadMicros[i].getDestino() .equals(unDestino))
                    stop = true;
        }
        if (stop == true)
            return cantidadMicros[i];
        else
            return null;
    }
}
