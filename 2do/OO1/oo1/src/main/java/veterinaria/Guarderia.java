package veterinaria;

import java.time.LocalDate;

public class Guarderia extends Servicio{
	private int dias;
	private Mascota mascota;
	
	public Guarderia(int dias, Mascota mascota) {
		super();
		this.dias = dias;
		this.mascota = mascota;
	}
	
	//para test
	public Guarderia(int dias, Mascota mascota, LocalDate fecha) {
		super(fecha);
		this.dias = dias;
		this.mascota = mascota;
	}
	
	public double recaudado() {
		double total = this.dias * 500;
		if (this.mascota.cantServiciosUsados() >= 5) {
			total = total*0.9;
		}
		return total;
	}
}
