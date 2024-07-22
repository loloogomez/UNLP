package impuestos;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class Automotor implements Bien{
	private String patente;
	private String marca;
	private String modelo;
	private LocalDate fechaFabricacion;
	private double valor;
	
	public Automotor(String patente, String marca, String modelo, LocalDate fechaFabricacion, double valor) {
		this.patente = patente;
		this.marca = marca;
		this.modelo = modelo;
		this.fechaFabricacion = fechaFabricacion;
		this.valor = valor;
	}
	
	public double calcularImpuestos() {
		if (ChronoUnit.YEARS.between(this.fechaFabricacion, LocalDate.now()) > 10) {
			return 0;
		}else {
			return this.valor * 0.05;
		}
	}
}
