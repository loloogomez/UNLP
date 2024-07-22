package veterinaria;

import java.time.LocalDate;

public abstract class Servicio {
	private LocalDate fecha;
	
	public Servicio () {
		this.fecha = LocalDate.now();
	}
	
	//para test
	public Servicio (LocalDate fecha) {
		this.fecha = fecha;
	}
	
	public abstract double recaudado();
	
	public LocalDate getFecha() {
		return this.fecha;
	}
}
