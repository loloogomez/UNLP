package impuestos;

import java.util.ArrayList;
import java.util.List;

public class Contribuyente {
	private List<Bien> bienes;
	private String nombre;
	private int dni;
	private String email;
	private String localidad;
	
	public Contribuyente(String nombre, int dni, String email, String localidad) {
		this.bienes = new ArrayList<Bien>();
		this.nombre = nombre;
		this.dni = dni;
		this.email = email;
		this.localidad = localidad;
	}
	
	public double calcularImpuestos() {
		return this.bienes.stream().mapToDouble(b -> b.calcularImpuestos()).sum();
	}
	
	public void cargarBien(Bien bien) {
		this.bienes.add(bien);
	}
	
	//para test
	public List<Bien> getBienes(){
		return this.bienes;
	}
}
