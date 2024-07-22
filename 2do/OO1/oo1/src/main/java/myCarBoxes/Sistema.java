package myCarBoxes;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class Sistema {
	private List<Orden> ordenes;
	private List<Repuesto> repuestos;
	private List<Empleado> empleados;
	
	public Sistema() {
		this.ordenes = new ArrayList<Orden>();
		this.repuestos = new ArrayList<Repuesto>();
		this.empleados = new ArrayList<Empleado>();
	}
	
	public Repuesto altaRepuesto(String nombre, LocalDate fechaFabricacion, double costo){
		Repuesto repuesto = new Repuesto(nombre, fechaFabricacion, costo);
		this.repuestos.add(repuesto);
		return repuesto;
	}
	
	public Empleado altaEmpleado(String nombre, double valorHora) {
		Empleado empleado = new Empleado(nombre, valorHora);
		this.empleados.add(empleado);
		return empleado;
	}
	
	public OrdenDeRepuestos registrarCompraRepuestos(String patente, List<Repuesto> repuestos) {
		OrdenDeRepuestos ordenDeRepuestos = new OrdenDeRepuestos(patente, repuestos);
		this.ordenes.add(ordenDeRepuestos);
		return ordenDeRepuestos;
	}
	
	public OrdenDeReparacion registrarReparacion(String patente, String descripcion, List<Repuesto> repuestos, List<Empleado> empleados, int horas) {
		OrdenDeReparacion ordenDeReparacion = new OrdenDeReparacion(patente, repuestos, descripcion, empleados, horas);
		this.ordenes.add(ordenDeReparacion);
		return ordenDeReparacion;
	}
	
	public OrdenDeReparacion registrarReparacion(String patente, String descripcion, List<Empleado> empleados, int horas) {
		OrdenDeReparacion ordenDeReparacion = new OrdenDeReparacion(patente, descripcion, empleados, horas);
		this.ordenes.add(ordenDeReparacion);
		return ordenDeReparacion;
	}
	
	public boolean validarDescuento(String patente, Orden orden) {
		return this.ordenes.stream().filter(o -> o.validarDescuento(patente)).filter(o ->{return !o.equals(orden);}).count() > 0;
	}
	
	public List<Factura> facturar(){
		return this.ordenes.stream().map(o -> o.facturar(this.validarDescuento(o.getPatente(), o))).collect(Collectors.toList());
	}
}
