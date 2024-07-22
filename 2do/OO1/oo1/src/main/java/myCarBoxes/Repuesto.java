package myCarBoxes;

import java.time.LocalDate;

public class Repuesto {
	private String nombre;
	private LocalDate fechaFabricacion;
	private double costo;
	
	public Repuesto(String nombre, LocalDate fechaFabricacion, double costo) {
		this.nombre = nombre;
		this.fechaFabricacion = fechaFabricacion;
		this.costo = costo;
	}
	
	public double facturar() {
		if (this.fechaFabricacion.plusYears(5).isBefore(LocalDate.now())) {
			return this.costo* 1.08;
		}else {
			return this.costo * 1.15;
		}
	}
	
	public double getCosto() {
		return this.costo;
	}
}
