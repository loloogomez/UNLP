package veterinaria;

import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.List;

public class Mascota {
	private String nombre;
	private LocalDate fechaNacimiento;
	private String especie;
	private List<Servicio> servicios;
	
	public Mascota (String nombre, LocalDate fechaNacimiento, String especie) {
		this.nombre = nombre;
		this.fechaNacimiento = fechaNacimiento;
		this.especie = especie;
		this.servicios = new ArrayList<Servicio>();
	}
	
	public List<Servicio> getServicios(){
		return this.servicios;
	}
	
	public double recaudacion (LocalDate fecha) {
		return this.servicios.stream().filter(s -> s.getFecha().equals(fecha)).mapToDouble(s -> s.recaudado()).sum();
	}
	
	public boolean esCachorro() {
		return Period.between(this.fechaNacimiento, LocalDate.now()).getYears() < 2;
	}
	
	public void addServicio(Servicio servicio) {
		this.servicios.add(servicio);
	}
	
	public long cantServiciosUsados() {
		return this.servicios.stream().filter(s -> s.getFecha().isBefore(LocalDate.now())).count();
	}
	
}
