package impuestos;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class Sistema {
	private List<Contribuyente> contribuyentes;
	
	public Sistema() {
		this.contribuyentes = new ArrayList<Contribuyente>();
	}
	
	public Contribuyente cargarContribuyente(String nombre, int dni, String email, String localidad) {
		Contribuyente contribuyente = new Contribuyente(nombre, dni, email, localidad);
		this.contribuyentes.add(contribuyente);
		return contribuyente;
	}
	
	public Inmueble cargarInmueble(int numeroPartida, double valorLote, double valorEdificacion, Contribuyente propietario) {
		Inmueble inmueble = new Inmueble(numeroPartida, valorLote, valorEdificacion);
		propietario.cargarBien(inmueble);
		return inmueble;
	}
	
	public Automotor cargarAutomotor(String patente, String marca, String modelo, LocalDate fechaFabricacion, double valor, Contribuyente propietario) {
		Automotor automotor = new Automotor(patente, marca, modelo, fechaFabricacion, valor);
		propietario.cargarBien(automotor);
		return automotor;
	}
	
	public double calcularImpuestos(Contribuyente contribuyente) {
		return contribuyente.calcularImpuestos();
	}
	
	//para test
	public List<Contribuyente> getContribuyentes() {
		return this.contribuyentes;
	}
}
