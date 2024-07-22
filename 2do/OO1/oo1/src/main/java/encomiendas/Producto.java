package encomiendas;

public class Producto {
	private String descripcion;
	private double peso;
	private double volumen;
	
	public Producto(String descripcion, double peso, double volumen) {
		this.descripcion = descripcion;
		this.peso = peso;
		this.volumen = volumen;
	}
	
	public double getPeso() {
		return this.peso;
	}
	
	public double getVolumen() {
		return this.volumen;
	}
}
