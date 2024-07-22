/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica2;
import PaqueteLectura.Lector;
/**
 *
 * @author low
 */
public class Ejer6 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Partido [] V = new Partido [20];
        
        System.out.println ("ingrese el local: ");
        String Local = Lector.leerString();
        System.out.println ("ingrese el visitante: ");
        String Visitante = Lector.leerString();
        int golesL = 0;
        int golesV = 0;
        if (!"ZZZ".equals(Visitante)){
            System.out.println ("ingrese los goles del local: ");
            golesL = Lector.leerInt();
            System.out.println ("ingrese los goles del visitante: ");
            golesV = Lector.leerInt();
        }
        System.out.println ();
        
        int i = -1;
        while (i < 20 && !"ZZZ".equals (Visitante)){
            Partido P = new Partido (Local, Visitante, golesL, golesV);
            i++;
            V[i] = P;
            
            System.out.println ("ingrese el local: ");
            Local = Lector.leerString();
            System.out.println ("ingrese el visitante: ");
            Visitante = Lector.leerString();
            
            if (!"ZZZ".equals(Visitante)){
                System.out.println ("ingrese los goles del local: ");
                golesL = Lector.leerInt();
                System.out.println ("ingrese los goles del visitante: ");
                golesV = Lector.leerInt();
            }
            System.out.println ();
        }
        
        int j = 0;
        int river = 0;
        int empate = 0;
        int golesBocaLocal = 0;
        while (j <= i){
            if (V[j].getGanador().equals ("River"))
                river ++;
            if (V[j].getLocal().equals ("Boca"))
                golesBocaLocal = golesBocaLocal + V[j].getGolesLocal();
            if (V[j].hayEmpate() == true)
                empate ++;
            
            j++;    
        }
        
        empate = empate * 100 / j;
        System.out.println ("victorias de river: "+ river);
        System.out.println ("goles de Boca de local: "+ golesBocaLocal);
        System.out.println ("el porcentaje de empates es: "+ empate +"%");
    }
    
}
