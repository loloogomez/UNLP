/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso;

/**
 *
 * @author low
 */
public class Investigador{
    private String nomYApe;
    private int categoria;
    private String especialidad;
    private Subsidio [] subsidios;

    public Investigador (String unNomYApe, int unaCategoria, String unaEspecialidad){
        nomYApe = unNomYApe;
        categoria = unaCategoria;
        especialidad = unaEspecialidad;
        subsidios = new Subsidio [5];
    }
    
    public void setSubsidios (Subsidio unSubsidio){
        int i = 0;
        while (i < 5 && getSubsidios()[i] != null)
            i ++;
        getSubsidios()[i] = unSubsidio;
    }
    
    public String getNomYApe() {
        return nomYApe;
    }

    public void setNomYApe(String nomYApe) {
        this.nomYApe = nomYApe;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public Subsidio[] getSubsidios() {
        return subsidios;
    }
    
    public int cantSubsidios(){
        int i = 0;
        int cant = 0;
        while ( i < 5 && getSubsidios()[i] != null){
            if (getSubsidios()[i].isEntregado() == true)
                cant ++;
            i ++;
        }
        return cant;
    }

    public String toString(){
        String aux;
        aux = "nombre y apellido: "+ getNomYApe()+ ", categoria: "+ getCategoria()+ ", cantidad de subsidios dados: "+
              cantSubsidios()+ " ";
        return aux;
    }
}
