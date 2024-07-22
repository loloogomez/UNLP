/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso3;

/**
 *
 * @author low
 */
public abstract class Recital {
    private String nombre;
    private String [] canciones;
    
    public Recital(String unNombre, int cantTemas){
        nombre = unNombre;
        canciones = new String [cantTemas];
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String[] getCanciones() {
        return canciones;
    }

    public void setCanciones(String[] canciones) {
        this.canciones = canciones;
    }
    
    public void agregarTema(String unTema){
        int i = 0;
        while (getCanciones()[i] != null)
            i++;
        getCanciones()[i] = unTema;
    }
    
    public String actuar(){
        String aux ="";
        int i = 0;
        while (getCanciones()[i] != null){
            aux = aux + " y ahora tocaremos: "+ canciones[i]+ ", ";
            i++;
        }
        return aux;
    }
    
    public abstract double calcularCosto();
}
