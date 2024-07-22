package myCarBoxes;

import java.util.ArrayList;
import java.util.List;

public class OrdenDeReparacion extends Orden{
	private String descripcion;
	private int horas;
	private List<Empleado> empleados;
	
	public OrdenDeReparacion(String patente, List<Repuesto> repuestos, String descripcion, List<Empleado> empleados, int horas) {
		super(patente);
		this.setRepuestos(repuestos);
		this.descripcion = descripcion;
		this.empleados = empleados;
		this.horas = horas;
	}
	
	public OrdenDeReparacion(String patente, String descripcion, List<Empleado> empleados, int horas) {
		super(patente);
		this.setRepuestos(new ArrayList<Repuesto>());
		this.descripcion = descripcion;
		this.empleados = empleados;
		this.horas = horas;
	}
	
	public double calcularRepuestos() {
		return this.getRepuestos().stream().mapToDouble(r -> r.getCosto()).sum();
	}
	
	
	public Factura facturar(boolean descuento) {
		double total = this.calcularRepuestos();
		total += this.empleados.stream().mapToDouble(e -> e.facturar(this.horas)).sum();
		return new Factura(this.getFecha(), this.getPatente(),total, descuento);
	}
	
}
