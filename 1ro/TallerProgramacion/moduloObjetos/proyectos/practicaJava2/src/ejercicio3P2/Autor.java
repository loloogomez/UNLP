/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio3P2;

/**
 *
 * @author User
 */
public class Autor {
    private String nombre = "";
    private String biografia = "";
    
    public Autor (String unNombre, String unaBiografia){
        nombre = unNombre;
        biografia = unaBiografia;
    }
    
    public void setNombre(String unNombre){
        nombre = unNombre;
    }
    
    public void setBiografia (String unaBiografia){
        biografia = unaBiografia;
    }
    
    public String getNombre(){
        return nombre;
    }
    
    public String getBiografia(){
        return biografia;
    }
}
