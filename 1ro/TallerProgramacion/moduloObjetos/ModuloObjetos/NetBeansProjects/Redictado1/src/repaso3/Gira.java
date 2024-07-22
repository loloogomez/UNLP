/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso3;

/**
 *
 * @author low
 */
public class Gira extends Recital{
    private String gira;
    private Fecha [] fechas;
    private int cantFechas;
    private Fecha fechaA;

    public Gira (String unNombre, int cantTemas, String unaGira, int cantFechas){
        super(unNombre, cantTemas);
        gira = unaGira;
        this.cantFechas = cantFechas;
        fechas = new Fecha [cantFechas];
    }
    
    public double calcularCosto(){
        double aux = 0;
        int i = 0;
        while (i < getCantFechas() && getFechas()[i] != null){
            aux = aux + 30000;
            i++;
        }
        return aux;
    }

    public Fecha getFechaA() {
        return fechaA;
    }

    public void setFechaA(Fecha fechaA) {
        this.fechaA = fechaA;
    }
  
    public String actuar(){
        String aux = super.actuar();
        String aux2 = "Buenas noches " + getFechaA().getLugar()+ aux;
        int i= 0;
        while (!getFechas()[i].equals(getFechaA()))
            i++;
        setFechaA(getFechas()[i+1]);
        return aux2;
    }
    
    public void agregarFecha(Fecha unaFecha){
        int i = 0;
        while (i < getCantFechas() && getFechas()[i] != null)
            i++;
        if (i < getCantFechas())
            getFechas()[i] = unaFecha;
    }
    
    public String getGira() {
        return gira;
    }

    public void setGira(String gira) {
        this.gira = gira;
    }

    public int getCantFechas() {
        return cantFechas;
    }

    public void setCantFechas(int cantFechas) {
        this.cantFechas = cantFechas;
    }

    public Fecha[] getFechas() {
        return fechas;
    }    

    public void setFechas(Fecha[] fechas) {
        this.fechas = fechas;
        setFechaA(getFechas()[0]);
    }
    
}
