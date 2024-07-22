/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso;

import java.util.Arrays;

/**
 *
 * @author low
 */
public class Proyecto {
    private String nombre;
    private int codigo;
    private String nomApe;
    private Investigador [] investigadores;
    
    public Proyecto(){
        
    };
    
    public Proyecto (String unNombre, int unCodigo, String unNomApe){
        nombre = unNombre;
        codigo = unCodigo;
        nomApe = unNomApe;
        investigadores = new Investigador [50];
    }
    
    public Proyecto (String unNombre, int unCodigo){
        nombre = unNombre;
        codigo = unCodigo;
        investigadores = new Investigador [50];
    }
    
    public void otorgarSubsidios(String unNomYApe){
        int i = 0;
        int j = 0;
        while (i < 50 && !getInvestigadores()[i].getNomYApe() .equals (unNomYApe))
            i++;
        while (j < 5 && getInvestigadores()[i].getSubsidios()[j] != null){
            getInvestigadores()[i].getSubsidios()[j].setEntregado(true);
            j++;
        }
    }
    
    public int cantidadSubsidios (String unNomYApe){
        int i = 0;
        int total = 0;
        while (i < 50 && !getInvestigadores()[i].getNomYApe().equals(unNomYApe))
            i++;
        int j = 0;
        while (j < 5 && getInvestigadores()[i].getSubsidios()[j] != null){
            total ++;
        }
        return total;
    }
    
    public double getSubTotal(){
        int i = 0;
        int j;
        double total = 0;
        while (i < 50 && getInvestigadores()[i] != null){
            j = 0;
            while (j < 5 && getInvestigadores()[i].getSubsidios()[j] != null){
                if (getInvestigadores()[i].getSubsidios()[j].isEntregado() == true)
                    total = total + getInvestigadores()[i].getSubsidios()[j].getMonto();
                j ++;
            }
            i++;
        }
        return total;
    }
    
    public void setInvestigador (Investigador unInvestigador){
        int i = 0;
        while (i < 50 && getInvestigadores()[i] != null)
            i ++;  
        getInvestigadores()[i] = unInvestigador;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int Codigo) {
        this.codigo = Codigo;
    }

    public String getNomApe() {
        return nomApe;
    }

    public void setNomApe(String NomApe) {
        this.nomApe = NomApe;
    }

    public Investigador[] getInvestigadores() {
        return investigadores;
    }
    
    public int cantInvestigadores(){
        int i = 0;
        int cant = 0;
        while (i < 50 && getInvestigadores()[i] != null){
            cant ++;
            i ++;
        }
        return cant;
    }
    
    public Investigador[] getInvestigadoresLLenos(){
        int i;
        Investigador[] investigadoresLLenos = new Investigador[cantInvestigadores()];
        for (i = 0; i < cantInvestigadores(); i++)
            investigadoresLLenos[i] = getInvestigadores()[i];
        return investigadoresLLenos;
    }
    
    public String toString(){
        String aux;
        aux = "nombre del proyecto: "+ getNombre()+ ", codigo del proyecto;  "+ getCodigo()+
              ", nombre del director del proyecto: "+ getNomApe()+
              ", cantidad de plata dada a los investigadores: "+ getSubTotal()+ " ";
        aux = aux + Arrays.toString(getInvestigadoresLLenos());
        return aux;
    }
}
