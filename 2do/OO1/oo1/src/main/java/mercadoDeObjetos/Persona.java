package mercadoDeObjetos;

public abstract class Persona {
	private String nombre;
	private String direccion;
	
	public Persona(String nombre, String direccion) {
		this.nombre = nombre;
		this.direccion = direccion;
	}
	
	public String getNombre() {
		return this.nombre;
	}
	
	public String getDireccion() {
		return this.direccion;
	}
	
	public boolean soyYo(String nombre) {
		return this.nombre == nombre;
	}
}
