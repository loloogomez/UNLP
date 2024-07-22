package myCarBoxes;

import java.time.LocalDate;
import java.util.List;

public abstract class Orden {
	private String patente;
	private LocalDate fecha;
	private List<Repuesto> repuestos;
	
	public Orden (String patente) {
		this.patente = patente;
		this.fecha = LocalDate.now();
	}
	
	public String getPatente() {
		return this.patente;
	}
	
	public List<Repuesto> getRepuestos() {
		return this.repuestos;
	}
	
	public LocalDate getFecha() {
		return this.fecha;
	}
	
	public void setRepuestos(List<Repuesto> repuestos) {
		this.repuestos = repuestos;
	}
	
	public boolean validarDescuento(String patente) {
		return (this.patente == patente && this.fecha.isAfter(LocalDate.now().minusMonths(12)));
	}
	
	public double calcularRepuestos() {
		return this.repuestos.stream().mapToDouble(r -> r.facturar()).sum();
	}
	
	public abstract Factura facturar(boolean descuento);
}
