/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso2;
import PaqueteLectura.Lector;
/**
 *
 * @author low
 */
public class ejecucion {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        System.out.println ("ingrese el nombre del alumno: ");
        String Nombre = Lector.leerString();
        System.out.println ("ingrese el dni del alumno: ");
        int dni = Lector.leerInt();
        System.out.println ("ingrese la cantidad maxima de materias: ");
        int cantMax = Lector.leerInt();
        System.out.println ("ingrese la carrera del alumno: ");
        String carrera = Lector.leerString();
        
        Grado grado = new Grado (carrera, dni, Nombre, cantMax);
        
        System.out.println("ingrese el nombre de la materia: ");
        String nombreM = Lector.leerString();
        System.out.println("ingrese la nota obtenida: ");
        double nota = Lector.leerDouble();
        System.out.println("ingrese le fecha de aprobacion de la materia: ");
        System.out.println("dia: ");
        int dia = Lector.leerInt();
        System.out.println("mes: ");
        int mes = Lector.leerInt();
        System.out.println("anio: ");
        int anio = Lector.leerInt();
        
        Fecha fecha1 = new Fecha (dia, mes, anio);
        Materia materia1 = new Materia (nombreM, nota, fecha1);
        grado.agregarM(materia1);
        
        System.out.println("ingrese el nombre de la materia: ");
        nombreM = Lector.leerString();
        System.out.println("ingrese la nota obtenida: ");
        nota = Lector.leerDouble();
        System.out.println("ingrese le fecha de aprobacion de la materia: ");
        System.out.println("dia: ");
        dia = Lector.leerInt();
        System.out.println("mes: ");
        mes = Lector.leerInt();
        System.out.println("anio: ");
        anio = Lector.leerInt();
        
        Fecha fecha2 = new Fecha (dia, mes, anio);
        Materia materia2 = new Materia (nombreM, nota, fecha2);
        grado.agregarM(materia2);
        
        System.out.println ("ingrese el nombre del alumno: ");
        Nombre = Lector.leerString();
        System.out.println ("ingrese el dni del alumno: ");
        dni = Lector.leerInt();
        System.out.println ("ingrese la cantidad maxima de materias: ");
        cantMax = Lector.leerInt();
        System.out.println ("ingrese el titulo del alumno: ");
        String titulo = Lector.leerString();
        System.out.println ("ingrese la universidad en la que estudio: ");
        String universidad = Lector.leerString();
        
        Doctorado doctorado = new Doctorado (titulo, universidad, dni, Nombre, cantMax);
        
        System.out.println("ingrese el nombre de la materia: ");
        nombreM = Lector.leerString();
        System.out.println("ingrese la nota obtenida: ");
        nota = Lector.leerDouble();
        System.out.println("ingrese le fecha de aprobacion de la materia: ");
        System.out.println("dia: ");
        dia = Lector.leerInt();
        System.out.println("mes: ");
        mes = Lector.leerInt();
        System.out.println("anio: ");
        anio = Lector.leerInt();
        
        Fecha fecha3 = new Fecha (dia, mes, anio);
        Materia materia3 = new Materia (nombreM, nota, fecha3);
        doctorado.agregarM(materia3);
        
         System.out.println("ingrese el nombre de la materia: ");
        nombreM = Lector.leerString();
        System.out.println("ingrese la nota obtenida: ");
        nota = Lector.leerDouble();
        System.out.println("ingrese le fecha de aprobacion de la materia: ");
        System.out.println("dia: ");
        dia = Lector.leerInt();
        System.out.println("mes: ");
        mes = Lector.leerInt();
        System.out.println("anio: ");
        anio = Lector.leerInt();
        
        Fecha fecha4 = new Fecha (dia, mes, anio);
        Materia materia4 = new Materia(nombreM, nota, fecha4);
        doctorado.agregarM(materia4);
    
        String aux = "";
        int i = 0;
        while (i < grado.getCantM() && grado.getMateriasA()[i] != null){
            aux = aux + grado.getString(i);
            i++;
        }
        System.out.println(grado.toString() + aux + grado.toString2());
        
        aux = "";
        i = 0;
        while (i < doctorado.getCantM() && doctorado.getMateriasA()[i] != null){
            aux = aux + doctorado.getString(i);
            i++;
        }
        System.out.println(doctorado.toString() + aux + doctorado.toString2());
    }
}
