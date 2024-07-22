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
public class TesisDest extends Premiacion {
    public TesisDest (int cantMax){
        super(cantMax);
    }
    
    public Postulado getGanador(){
        double aux = -1;
        Postulado unPostulado = null;
        int i;
        for (i = 0; i <= getDimL(); i++)
            if (getPostulado(i).getNota() > aux){
                aux = getPostulado(i).getNota();
                unPostulado = getPostulado(i);
            }
        return unPostulado;
    }                                       
}
