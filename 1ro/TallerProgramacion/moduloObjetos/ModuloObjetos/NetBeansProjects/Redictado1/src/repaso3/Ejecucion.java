/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso3;
import PaqueteLectura.Lector;

/**
 *
 * @author low
 */
public class Ejecucion {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        String nombre;
        int cantTemas;
        String motivo;
        String contratista;
        int dia;
        
        System.out.println ("ingrese el nombre de la banda: ");
        nombre = Lector.leerString();
        System.out.println ("ingrese la cantidad maxima de temas: ");
        cantTemas = Lector.leerInt();
        System.out.println ("ingrse el motivo del evento ocacional: ");
        motivo = Lector.leerString();
        System.out.println ("ingrese el nombre del contratista: ");
        contratista = Lector.leerString();
        System.out.println ("ingrese el dia del evento: ");
        dia = Lector.leerInt();
        
        Evento evento1 = new Evento(nombre, cantTemas, motivo, contratista, dia);
        
        String cancion;
        String [] canciones = new String [cantTemas];
        
        int i = 0;
        
        System.out.println ("ingrese el nombre de una cancion: ");
        cancion = Lector.leerString();
        
        while (i < cantTemas && !cancion.equals("")){
            canciones[i] = cancion;
            i++;
            System.out.println ("ingrese el nombre de una cancion: ");
            cancion = Lector.leerString();
        }
        
        evento1.setCanciones(canciones);
        
        System.out.println(evento1.calcularCosto());
        
        System.out.println(evento1.actuar());
        
        System.out.println ("ingrese el nombre de la banda: ");
        nombre = Lector.leerString();
        System.out.println("ingrese el nombre de la gira: ");
        String nombreGira = Lector.leerString();
        System.out.println("ingrese la cantidad maxima de fechas: ");
        int cantFechas = Lector.leerInt();
        
        Gira gira = new Gira (nombre, cantTemas, nombreGira, cantFechas);
        gira.setCanciones(canciones);
        
        Fecha [] fechas = new Fecha [cantFechas];
        
        System.out.println ("ingrese el dia de la fecha: ");
        dia = Lector.leerInt();
        System.out.println ("ingrese el lugar de la fecha: ");
        String lugar = Lector.leerString();
                
        i = 0;
        while (i <= cantFechas && dia != -1){
            fechas[i] = new Fecha(dia, lugar);
            System.out.println ("ingrese el dia de la fecha: ");
            dia = Lector.leerInt();
            if (dia != -1){
                System.out.println ("ingrese el lugar de la fecha: ");
                lugar = Lector.leerString();
                i++;
            }
        }
        
        gira.setFechas(fechas);
        
        System.out.println(gira.calcularCosto());
        
        for (i = 0; i < gira.getCantFechas(); i++){
            if (gira.getFechaA() != null)
                System.out.println(gira.actuar());
        }
    }
}
