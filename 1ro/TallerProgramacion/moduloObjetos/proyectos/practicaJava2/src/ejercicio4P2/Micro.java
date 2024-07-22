/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio4P2;

/**
 *
 * @author User
 */
public class Micro {
    private String patente;
    private String destino;
    private String horaSalida;
    private boolean [] estadoAsiento = new boolean [20];
    private int cantidadOcupados;
    
    public Micro (String unaPatente, String unDestino, String unaHora){
        patente = unaPatente;
        destino = unDestino;
        horaSalida = unaHora;
        int i;
        for (i = 0; i< 20; i++)
            estadoAsiento[i] = false;
        cantidadOcupados = 0;
    }
    
    public void setPatente(String unaPatente){
        patente = unaPatente;
    }
    
    public void setDestino(String unDestino){
        destino = unDestino;
    }
    
    public void setHoraSalida(String unaHora){
        horaSalida = unaHora;
    }
    
    public void ocuparAsiento(int unAsiento){
        estadoAsiento[unAsiento] = true;
        cantidadOcupados ++;
    }
    
    public void liberarAsiento (int unAsiento){
        estadoAsiento[unAsiento] = false; 
    }
    
    public String getPatente(){
        return patente;
    }
    
    public String getDestino(){
        return destino;
    }
    
    public String getHoraSalida(){
        return horaSalida;
    }
    
    public int getAsientosOcupados(){
        return cantidadOcupados;
    }
    
    public boolean getMicroLLeno(){
        boolean aux = true;
        int i = 0;
        while (aux == true && i < 20){
            if (estadoAsiento[i] == false)
                aux = false;
            i++;
        }
        return aux;
    }
    
    public boolean validar(int asiento){
        boolean aux = false;
        if (asiento > -1 && asiento < 20)
            aux = true;
        return aux;  
    }
    
    public boolean getEstadoAsiento (int unAsiento){
        return estadoAsiento[unAsiento];
    }
    
    public String primerAsientoLibre(){
        int i = -1;
        boolean aux = true;
        while (aux == true){
            i++;
            if (estadoAsiento[i] == false)
                aux = false;
        }
        
        return "el primer asiento libre es el: "+ i;
    }
    
}
