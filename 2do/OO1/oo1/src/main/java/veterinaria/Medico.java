package veterinaria;

import java.time.LocalDate;

public class Medico {
	private String nombre;
	private LocalDate ingreso;
	private double honorarios;
	
	public Medico (String nombre, LocalDate ingreso, double honorarios) {
		this.nombre = nombre;
		this.ingreso = ingreso;
		this.honorarios = honorarios;
	}
	
	public double getHonorarios() {
		return this.honorarios;
	}
	
	public LocalDate getIngreso() {
		return this.ingreso;
	}
}
