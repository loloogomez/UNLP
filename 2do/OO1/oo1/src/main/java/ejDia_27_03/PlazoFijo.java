package ejDia_27_03;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class PlazoFijo implements Inversion{
	private LocalDate fechaConstitucion;
	private double montoDepositado;
	private double porcentajeDeInteresDiario;
	
	public PlazoFijo(LocalDate fechaConstitucion, double montoDepositado, double porcentajeDeInteresDiario) {
		this.fechaConstitucion = fechaConstitucion;
		this.montoDepositado = montoDepositado;
		this.porcentajeDeInteresDiario = porcentajeDeInteresDiario;
	}
	
	public double valorActual() {
		LocalDate fechaActual = LocalDate.now();
		long dias = ChronoUnit.DAYS.between(this.fechaConstitucion, fechaActual);
		double interes = this.montoDepositado * this.porcentajeDeInteresDiario * dias;
		return this.montoDepositado + interes;
	}
}
