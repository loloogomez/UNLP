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
public class ejecucion2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        nuevoProyecto ventana1 = new nuevoProyecto ();
        ventana1.setVisible(true);
        if (ventana1.isVisible() == false){
            Proyecto proyecto1 = new Proyecto(ventana1.getNombreP(), ventana1.getNumDelP(), ventana1.getNombreD());
            
            nuevoInvestigador ventana2 = new nuevoInvestigador();
            ventana2.setVisible(true);
            if (ventana2.getListo() == false){    
                Investigador investigador1 = new Investigador (ventana2.getNombre(), ventana2.getCategoria(), ventana2.getEspecialidad());
                proyecto1.setInvestigador(investigador1);

                nuevoInvestigador ventana3 = new nuevoInvestigador();
                ventana3.setVisible(false);
                if (ventana3.isVisible() == false){
                    Investigador investigador2 = new Investigador (ventana3.getNombre(), ventana3.getCategoria(), ventana3.getEspecialidad());
                    proyecto1.setInvestigador(investigador2);

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

                    proyecto1.otorgarSubsidios(investigador1.getNomYApe());
                    System.out.println (proyecto1.toString());
                }
            }
        }
    }   
}
