package myCarBoxes;

import java.time.LocalDate;

public class Factura {
	private LocalDate fecha;
	private String patente;
	private double montoFinal;
	private double descuento;

	public Factura (LocalDate fecha, String patente, double montoFinal, boolean descuento) {
		this.fecha = fecha;
		this.patente = patente;
		if (descuento) {
			this.montoFinal = montoFinal * 0.95;
			this.descuento = montoFinal * 0.05;
		}else {
			this.montoFinal = montoFinal;
			this.descuento = 0;
		}
	}
}
