package practica1;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

/**
 *
 * @author User
 */
public class practicaJava4 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        int filas = 10;
        int columnas = 10;
        int[][] matriz = new int[filas][columnas];
        int fil;
        int col;
        int suma = 0;
        int i;
        int[] vector = new int[columnas];
        int num;
        GeneradorAleatorio.iniciar();

        for (fil = 0; fil < filas; fil++) {
            for (col = 0; col < columnas; col++) {
                matriz[fil][col] = GeneradorAleatorio.generarInt(201);
            }
        }
        for (fil = 0; fil < filas; fil++) {
            for (col = 0; col < columnas; col++) {
                System.out.println(matriz[fil][col]);
            }
        }
        System.out.println();
        for (fil = 2; fil < filas; fil++) {
            for (col = 0; col < 4; col++) {
                suma = suma + matriz[fil][col];
            }
        }
        System.out.println("suma: " + suma);
        System.out.println();
        for (col = 0; col < columnas; col++) {
            suma = 0;
            for (fil = 0; fil < filas; fil++) {
                suma = suma + matriz[fil][col];
            }
            vector[col] = suma;
        }
        for (i = 0; i < columnas; i++) {
            System.out.println("suma de columna " + i + ": " + vector[i]);
        }
        
        System.out.println();
        System.out.println("ingrese un numero para buscarlo: ");
        num = Lector.leerInt();
        System.out.println();
        fil = 0;
        col = 0;
        while (fil < filas && num != matriz[fil][col]) {
            fil++;
            col++;
        }
        if (fil < 10) {
            System.out.println("el numero se encuentra en la ubicacion " + fil + ", " + col);
        } else {
            System.out.println("el numero ingresado no se encuentra");
        }
    }

}
