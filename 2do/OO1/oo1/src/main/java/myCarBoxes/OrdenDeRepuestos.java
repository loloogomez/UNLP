package myCarBoxes;

import java.util.List;

public class OrdenDeRepuestos extends Orden{
	
	public OrdenDeRepuestos(String patente, List<Repuesto> repuestos) {
		super(patente);
		this.setRepuestos(repuestos);
	}
	
	public Factura facturar(boolean descuento) {
		return new Factura(this.getFecha(), this.getPatente(),this.calcularRepuestos(), descuento);
	}
}
