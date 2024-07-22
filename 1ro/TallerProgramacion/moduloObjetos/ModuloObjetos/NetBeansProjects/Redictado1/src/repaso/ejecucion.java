/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso;
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
        System.out.println ("ingrese el nombre del proyecto: ");
        String Nombre = Lector.leerString();
        System.out.println ("ingrese el codigo del proyecto: ");
        int Codigo = Lector.leerInt();
        Proyecto proyecto = new Proyecto (Nombre, Codigo);
        
        System.out.println ("ingrese el nombre y apellido del director: ");
        Nombre = Lector.leerString();
        proyecto.setNomApe(Nombre);
        
        System.out.println ("ingrese el nombre del investigador a agregar: ");
        Nombre = Lector.leerString();
        System.out.println ("ingrese la categoria del investigador: ");
        int categoria = Lector.leerInt();
        System.out.println ("ingrese la especialidad: ");
        String especialidad = Lector.leerString();
        Investigador investigador1 = new Investigador(Nombre, categoria, especialidad);
        
        System.out.println ("ingrese el nombre del investigador a agregar: ");
        Nombre = Lector.leerString();
        System.out.println ("ingrese la categoria del investigador: ");
        categoria = Lector.leerInt();
        System.out.println ("ingrese la especialidad: ");
        especialidad = Lector.leerString();
        Investigador investigador2 = new Investigador(Nombre, categoria, especialidad);
        
        proyecto.setInvestigador(investigador1);
        proyecto.setInvestigador(investigador2);
        
        int monto;
        String motivo;
        System.out.println ("ingrese un monto: ");
        monto = Lector.leerInt();
        System.out.println("ingrese el motivo; ");
        motivo = Lector.leerString();
        Subsidio subsidio1 = new Subsidio (monto, motivo);
        investigador1.setSubsidios(subsidio1);
        
        System.out.println ("ingrese un monto: ");
        monto = Lector.leerInt();
        System.out.println("ingrese el motivo; ");
        motivo = Lector.leerString();
        Subsidio subsidio2 = new Subsidio (monto, motivo);
        investigador1.setSubsidios(subsidio2);
                
        System.out.println ("ingrese un monto: ");
        monto = Lector.leerInt();
        System.out.println("ingrese el motivo; ");
        motivo = Lector.leerString();
        Subsidio subsidio3 = new Subsidio (monto, motivo);
        investigador2.setSubsidios(subsidio3);
        
        System.out.println ("ingrese un monto: ");
        monto = Lector.leerInt();
        System.out.println("ingrese el motivo; ");
        motivo = Lector.leerString();
        Subsidio subsidio4 = new Subsidio (monto, motivo);
        investigador2.setSubsidios(subsidio4);
        
        proyecto.otorgarSubsidios(investigador1.getNomYApe());
        System.out.println (proyecto.toString());
    }
    
}
