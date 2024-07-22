package ejDia_27_03;

public class Accion implements Inversion{
	private String nombre;
	private double valor;
	private int cantidad;
	
	public Accion (String nombre, double valor, int cantidad) {
		this.nombre = nombre;
		this.valor = valor;
		this.cantidad = cantidad;
	}
	
	public double valorActual() {
		return this.valor * this.cantidad;
	}
}
