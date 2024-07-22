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
public class Premiacion {
    private int N;
    private Postulado [] postulado;
    private int dimL = -1;
    
    public Premiacion(int unaCantMax){
        N = unaCantMax;
        postulado = new Postulado [N];
    }
    
    public void  setDimL(int unaDimL){
        dimL = unaDimL;
    }
    
    public int getDimL(){
        return dimL;
    }
    
    public int getCantMax(){
        return N;
    }
    
    public Postulado getPostulado(int unaPos){
        return postulado[unaPos];
    }
    
    public void setPostulante(Postulado unPostulado){
        setDimL(dimL +1);
        postulado[dimL] = unPostulado;
    }
}
