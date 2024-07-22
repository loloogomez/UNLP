/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio5P2;

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
        FlotaDeMicros flotaDeMicros = new FlotaDeMicros();
        System.out.println("ingrese la patente del micro: ");
        String Patente = Lector.leerString();
        String Destino;
        String HoraDeSalida;
        
        while (!"ZZZ000".equals(Patente) && flotaDeMicros.flotaCompleta() == false){
            System.out.println("ingrese el destino del micro: ");
            Destino = Lector.leerString();
            System.out.println("ingrese la hora de salida del micro: ");
            HoraDeSalida = Lector.leerString();
            
            Micro micro = new Micro(Patente, Destino, HoraDeSalida);
            
            flotaDeMicros.agregarMicro(micro);
            
            System.out.println("ingrese la patente del micro: ");
            Patente = Lector.leerString();
        }
        
        System.out.println("ingrese la patente del micro que dese eliminar de la flota: ");
        Patente = Lector.leerString();
        
        System.out.println(flotaDeMicros.eliminarMicro(Patente));
        
        
        System.out.println ("ingrese e destino del micro que desea buscar: ");
        Destino = Lector.leerString();
        
        if (flotaDeMicros.getMicroDestino(Destino) != null)
            System.out.println (flotaDeMicros.getMicroDestino(Destino).getPatente());
        else
            System.out.println("no hay ningun micro en la flota que vaya a ese destino");
    }
}
