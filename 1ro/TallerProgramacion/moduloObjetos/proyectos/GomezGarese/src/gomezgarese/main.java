/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package gomezgarese;
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
        String Nombre;
        double Nota;
        int AniosC;
        
        System.out.println("ingrese la cantidad maxima de participantes: ");
        int CantidadMaxima = Lector.leerInt();
        
        TesisDest tesisDest = new TesisDest (CantidadMaxima);
        ProntaGrad prontaGrad = new ProntaGrad (CantidadMaxima);
        
        System.out.println("ingrese el nombre de un participante");
        Nombre = Lector.leerString();
        while (!"a".equals(Nombre)){    
            System.out.println("ingrese la nota del participante: ");
            Nota = Lector.leerDouble();
            System.out.println("ingrese la cantidad de anios en la que termino la carrera: ");
            AniosC = Lector.leerInt();
            Postulado postulado = new Postulado (Nombre ,Nota, AniosC);
            tesisDest.setPostulante(postulado);
            System.out.println("ingrese el nombre de un participante");
            Nombre = Lector.leerString();
        }    
        
        System.out.println(tesisDest.getGanador().getNombre());
        
        System.out.println("ingrese el nombre de un participante");
        Nombre = Lector.leerString();
        while (!"a".equals(Nombre)){
            System.out.println("ingrese la nota del participante: ");
            Nota = Lector.leerDouble();
            System.out.println("ingrese la cantidad de anios en la que termino la carrera: ");
            AniosC = Lector.leerInt();
            Postulado postulado2 = new Postulado (Nombre ,Nota, AniosC);
            prontaGrad.setPostulante(postulado2);
            System.out.println("ingrese el nombre de un participante");
            Nombre = Lector.leerString();
        }
        
        System.out.println(prontaGrad.getGanador().getNombre());
    }
    
}
