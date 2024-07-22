package veterinaria;

import java.time.LocalDate;
import java.time.Period;

public class Consulta extends ServicioMedico{
	
	public Consulta(Medico medico) {
		super(300, medico);
	}
	
	//constructor para test
	public Consulta(Medico medico, LocalDate fecha) {
		super(300, medico, fecha);
	}
	
	public double recaudado() {
		double total = super.recaudado();
		//total += (LocalDate.now().getYear() - this.getMedico().getIngreso().getYear())*100;
		total += Period.between(this.getMedico().getIngreso(), LocalDate.now()).getYears() * 100;
		return total;
	}
}
