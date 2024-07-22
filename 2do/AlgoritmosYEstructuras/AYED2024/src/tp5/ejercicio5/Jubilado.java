package tp5.ejercicio5;

public class Jubilado extends Persona{
	private boolean cobro;
	public Jubilado(String nombre, String direccion) {
		super(nombre, direccion);
		this.cobro = false;
	}
	
	public void cobrar() {
		this.cobro = true;
	}
	public boolean getCobro() {
		return this.cobro;
	}
}
