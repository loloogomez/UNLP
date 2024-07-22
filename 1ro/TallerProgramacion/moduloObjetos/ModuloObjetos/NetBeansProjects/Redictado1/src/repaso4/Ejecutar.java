/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso4;
import PaqueteLectura.Lector;
/**
 *
 * @author low
 */
public class Ejecutar {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        String nombreC;
        String nombre;
        double dni;
        int edad;
        int antiguedad;
        int dimension;
        
        System.out.println("ingrese el nombre del coro: ");
        nombreC = Lector.leerString();
        System.out.println("ingrese el nombre del director del coro: ");
        nombre = Lector.leerString();
        System.out.println("ingrese el dni del director del coro: ");
        dni = Lector.leerDouble();
        System.out.println("ingrese la edad del director del coro: ");
        edad = Lector.leerInt();
        System.out.println("ingrese la antiguedad del director del coro: ");
        antiguedad = Lector.leerInt();
        
        Director director1 = new Director (nombre, dni, edad, antiguedad);
        
        System.out.println("ingrese la cantidad de coristas: ");
        dimension = Lector.leerInt();
        
        semiCirculo semiCirculo1 = new semiCirculo (nombreC, director1, dimension);
        
        int i;
        int tono;
        Corista [] coristas = new Corista [dimension];
        
        for (i = 0; i < dimension; i++){
            System.out.println("ingrese el nombre del corista: ");
            nombre = Lector.leerString();
            System.out.println("ingrese el dni del corista: ");
            dni = Lector.leerDouble();
            System.out.println("ingrese la edad del corista: ");
            edad = Lector.leerInt();
            System.out.println("ingrese el tono del corista: ");
            tono = Lector.leerInt();
            coristas[i] = new Corista(nombre, dni, edad, tono);
        }
        
        semiCirculo1.setFormacion(coristas);
        
        String aux = semiCirculo1.toString();
        for (i= 0; i < dimension; i++)
            aux = aux + semiCirculo1.getString(i);
        
        System.out.println(aux); 
        System.out.println("el coro esta bien formado: "+ semiCirculo1.bienFormado());
        
        System.out.println("ingrese el nombre del coro: ");
        nombreC = Lector.leerString();
        System.out.println("ingrese el nombre del director del coro: ");
        nombre = Lector.leerString();
        System.out.println("ingrese el dni del director del coro: ");
        dni = Lector.leerDouble();
        System.out.println("ingrese la edad del director del coro: ");
        edad = Lector.leerInt();
        System.out.println("ingrese la antiguedad del director del coro: ");
        antiguedad = Lector.leerInt();
        
        Director director2 = new Director (nombre, dni, edad, antiguedad);
        
        int hileras;
        int CXH;
        
        System.out.println("ingrese la cantidad de hileras del coro: ");
        hileras = Lector.leerInt();
        System.out.println("ingrese la cantidad de coristas por hilera: ");
        CXH = Lector.leerInt();
        
        Hileras hileras1 = new Hileras (nombreC, director2, hileras, CXH);
        
        int j;
        Corista [][] coristas2 = new Corista [hileras][CXH];
        
        for (i = 0; i < hileras; i++)
            for (j = 0; j < CXH; j++){
                System.out.println("ingrese el nombre del corista: ");
                nombre = Lector.leerString();
                System.out.println("ingrese el dni del corista: ");
                dni = Lector.leerDouble();
                System.out.println("ingrese la edad del corista: ");
                edad = Lector.leerInt();
                System.out.println("ingrese el tono del corista: ");
                tono = Lector.leerInt();
                coristas2[i][j] = new Corista(nombre, dni, edad, tono); 
            }
        
        hileras1.setFormacion(coristas2);
        
        aux = hileras1.toString();
        for (i = 0; i < hileras; i++)
            for (j = 0; j < CXH; j++)
                aux = aux + hileras1.getString(i,j);
        
        System.out.println(aux);
        System.out.println("el coro esta bien formado: "+ hileras1.bienFormado());       
    }
    
}
