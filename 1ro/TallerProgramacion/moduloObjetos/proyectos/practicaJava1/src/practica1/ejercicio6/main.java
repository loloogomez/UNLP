/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica1.ejercicio6;

import PaqueteLectura.GeneradorAleatorio;
        
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
        int [] operaciones = new int [6];
        int i;
        String frase = "banco cerrado";
        int max = -1;
        GeneradorAleatorio.iniciar();
        int aux = GeneradorAleatorio.generarInt(6);
        
        while (aux != 5){
            operaciones[aux] ++;
            aux = GeneradorAleatorio.generarInt(6);
        }
        
        for (i = 0; i < 5; i++){
            if (operaciones[i] > max)
                max = i;
            System.out.println(i+ ": "+ operaciones[i]);
        }    
        
        if (max == 0)
            frase = "cobro de cheques";
        
        if (max == 1)
            frase = "deposito/ extraccion en cuenta";
        
        if (max == 2)
            frase = "pago de impuestos o servicios";
        
        if (max == 3)
            frase = "cobro de jubilacion";
        
        if (max == 4)
            frase = "cobro de planes";
        
        System.out.println("la operacion mas solicitada fue: "+ frase);
    }
    
}
