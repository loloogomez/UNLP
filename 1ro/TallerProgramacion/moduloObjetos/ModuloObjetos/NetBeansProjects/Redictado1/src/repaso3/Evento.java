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
public class Evento extends Recital{
    private String motivo;
    private String contratista;
    private int dia;
    
    public Evento (String unNombre, int cantTemas, String unMotivo, String unContratista, int unDia){
        super(unNombre, cantTemas);
        motivo = unMotivo;
        contratista = unContratista;
        dia = unDia;
    }
    
    public double calcularCosto(){
        double aux = 0;
        switch (getMotivo()){
            case "a beneficio":
                aux = 0;
            break;
            case "show de tv":
                aux = 50000;
            break;
            case "privado":
                aux = 150000;
            break;
        }
        return aux;
    }
    
    public String actuar(){
        String aux = "";
        String aux2 = super.actuar();
        switch (getMotivo()) {
            case "a beneficio":
                aux = "Recuerden colaborar con "+ getContratista()+ aux2;
                break;
            case "show de tv":
                aux = "Saludos amigos televidentes" + aux2;
                break;
            case "show privado":
                aux = "Un feliz cumpleanios para "+ getContratista()+ aux2;
                break;
        }
        return aux;
    }
    
    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getContratista() {
        return contratista;
    }

    public void setContratista(String contratista) {
        this.contratista = contratista;
    }

    public int getDia() {
        return dia;
    }

    public void setDia(int dia) {
        this.dia = dia;
    }
}
