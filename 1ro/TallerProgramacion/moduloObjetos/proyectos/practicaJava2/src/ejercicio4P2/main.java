/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ejercicio4P2;

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
        String Patente = "ABC123";
        String Destino = "Mar Del Plata";
        String HoraSalida = "5:00";
        
        Micro micro = new Micro (Patente, Destino, HoraSalida);
        
        System.out.println("ingrese un numero de asiento");
        int Asiento = Lector.leerInt();
        
        while (Asiento != -1){
            if (micro.validar(Asiento) == true && micro.getEstadoAsiento(Asiento)== false){
                micro.ocuparAsiento(Asiento);
                System.out.println("operacion exitosa");
            }
            else{
                System.out.println("el asiento esta ocupado o no existe");
                System.out.println(micro.primerAsientoLibre());
            }
            System.out.println("ingrese un numero de asiento");
            Asiento = Lector.leerInt();
        }
        
        System.out.println("cantidad de asientos ocupados: "+ micro.getAsientosOcupados());
        
    }
    
}
