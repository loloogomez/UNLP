/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica1.ejercicio6P2;

import practica1.ejercicio6P2.Partido;
import PaqueteLectura.Lector;

/**
 *
 * @author User
 */
public class main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        String Local;
        String Visita;
        int GolLocal;
        int GolVisita;
        int i = 0;
        int dimL = 0;
        Partido [] Vector = new Partido [20];
        int riverGano = 0;
        int golesBoca = 0;
        double empates= 0.0;
        
        System.out.println("ingrese el nombre del club local: ");
        Local = Lector.leerString();
        System.out.println("ingrese el nombre del club visitante: ");
        Visita = Lector.leerString();
        
        while (i < 20 && !"ZZZ".equals(Visita)){
            
            System.out.println("ingrese los goles del equipo local: ");
            GolLocal = Lector.leerInt();
            System.out.println("ingrese los goles del equipo visitante: ");
            GolVisita = Lector.leerInt();
            
            Partido partido = new Partido (Local, Visita, GolLocal, GolVisita);
            Vector[i] = partido;
            i++;
            dimL = i;
            
            System.out.println("ingrese el nombre del club local: ");
            Local = Lector.leerString();
            System.out.println("ingrese el nombre del club visitante: ");
            Visita = Lector.leerString();    
        }
        
        for (i= 0; i < dimL; i++ ){
            if (Vector[i].getGanador().equals("river"))
                riverGano++;
            
            if (Vector[i].getLocal().equals("boca"))
                golesBoca = golesBoca + Vector[i].getGolesLocal();
            
            if (Vector[i].hayEmpate() == true)
                empates = empates + 1.0 ;
        }
        
        empates = empates / dimL;
        
        System.out.println ("river gano "+ riverGano+ " partidos");
        System.out.println("boca metio "+ golesBoca+ " goles de local");
        System.out.println("el "+ empates+ " de los partidos termino en empate");
    }
    
}
