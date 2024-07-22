/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gomezgarese;

/**
 *
 * @author User
 */
public class ProntaGrad extends Premiacion {
    
    public ProntaGrad(int unaCantMax){
        super (unaCantMax); 
    }
    
    public Postulado getGanador(){
        int aux = 50;
        Postulado unPostulado = null;
        int i;
        for (i = 0; i <= getDimL(); i++)
            if (aux > getPostulado(i).getAniosC()){
                aux = getPostulado(i).getAniosC();
                unPostulado = getPostulado(i);
            }
        return unPostulado;
    }      
}
