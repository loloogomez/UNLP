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
public class Doctorado extends Alumno{
    private String titulo;
    private String uniOrig;
    
    public Doctorado(int unDni, String unNombre, String unTitulo, String unaUniOrig){
        super(unDni, unNombre);
        setTitulo(unTitulo);
        setUniOrig(unaUniOrig);
    }
            
    public void setTitulo(String unTitulo){
        titulo = unTitulo;
    }
    
    public void setUniOrig(String unaUniOrig){
        uniOrig = unaUniOrig;
    }
    
    public String getTitulo(){
        return titulo;
    }
    
    public String getUniOrig(){
        return uniOrig;
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
                if (getMateria()[i].getNombreMat().equals("metodologias de investigacion"))
                    stop = true;
            }
        if (stop == true)
            aux = true;
        return aux;
    }
    
    public String toString (){
        String Aux = 
    }
    
}
