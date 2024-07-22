package myCarBoxes;

public class Empleado {
	private String nombre;
	private double valorHora;
	
	public Empleado(String nombre, double valorHora) {
		this.nombre = nombre;
		this.valorHora = valorHora;
	}
	
	public double facturar(int horas) {
		return this.valorHora * horas;
	}
}
