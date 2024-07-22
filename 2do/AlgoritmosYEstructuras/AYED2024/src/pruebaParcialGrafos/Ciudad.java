package pruebaParcialGrafos;

public class Ciudad {
	String nombre;
	int dias;
	
	public Ciudad(int dias,String nombre) {
		this.dias = dias;
		this.nombre = nombre;
	}
	
	public int getDias(){
		return this.dias;
	}
	
	public String getNombre() {
		return this.nombre;
	}
}
