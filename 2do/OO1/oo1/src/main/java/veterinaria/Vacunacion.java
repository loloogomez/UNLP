package veterinaria;

import java.time.LocalDate;

public class Vacunacion extends ServicioMedico{
	
	private String nombreVacuna;
	private double precioVacuna;
	
	public Vacunacion (Medico medico, String nombreVacuna, double precioVacuna) {
		super(500, medico);
		this.nombreVacuna = nombreVacuna;
		this.precioVacuna = precioVacuna;
	}
	
	//para test
	public Vacunacion (Medico medico, String nombreVacuna, double precioVacuna, LocalDate fecha) {
		super(500, medico, fecha);
		this.nombreVacuna = nombreVacuna;
		this.precioVacuna = precioVacuna;
	}
	
	public double recaudado() {
		double total = super.recaudado();
		total += this.precioVacuna;
		return total;
	}
}
