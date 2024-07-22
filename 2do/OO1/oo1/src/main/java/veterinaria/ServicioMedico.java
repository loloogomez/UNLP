package veterinaria;

import java.time.DayOfWeek;
import java.time.LocalDate;

public abstract class ServicioMedico extends Servicio{
	private double costoDescartables;
	private Medico medico;
	
	public ServicioMedico (double costoDescartable, Medico medico) {
		super();
		this.costoDescartables = costoDescartable;
		this.medico = medico;
	}
	
	//para test
	public ServicioMedico (double costoDescartable, Medico medico, LocalDate fecha) {
		super(fecha);
		this.costoDescartables = costoDescartable;
		this.medico = medico;
	}
	
	public Medico getMedico() {
		return this.medico;
	}
	
	public double recaudado() {
		double total = medico.getHonorarios();
		total += this.costoDescartables;
		if (this.getFecha().getDayOfWeek().equals(DayOfWeek.SUNDAY)){
			total += 200;
		}
		return total;
	}
}
