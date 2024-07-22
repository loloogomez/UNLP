package veterinaria;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class Veterinaria {
	private List<Mascota> mascotas;
	private List<Medico> medicos;
	
	public Veterinaria() {
		this.mascotas = new ArrayList<Mascota>();
		this.medicos = new ArrayList<Medico>();
	}
	
	public List<Medico> getMedicos(){
		return this.medicos;
	}
	
	public List<Mascota> getMascotas(){
		return this.mascotas;
	}
	
	public Medico registrarMedico(String nombre, LocalDate ingreso, double honorario) {
		Medico medico = new Medico(nombre, ingreso, honorario);
		medicos.add(medico);
		return medico;
	}
	
	public Mascota registrarMascota(String nombre, LocalDate nacimiento, String especie) {
		Mascota mascota = new Mascota(nombre, nacimiento, especie);
		mascotas.add(mascota);
		return mascota;
	}
	
	public Consulta registrarConsulta(Medico medico, Mascota mascota) {
		Consulta consulta = new Consulta(medico);
		mascota.addServicio(consulta);
		return consulta;
	}
	
	public Consulta registrarConsulta(Medico medico, Mascota mascota, LocalDate fecha) {
		Consulta consulta = new Consulta(medico, fecha);
		mascota.addServicio(consulta);
		return consulta;
	}
	
	public Vacunacion registrarVacunacion(Medico medico, Mascota mascota, String nombreVacuna, double precioVacuna) {
		Vacunacion vacunacion = new Vacunacion(medico, nombreVacuna, precioVacuna);
		mascota.addServicio(vacunacion);
		return vacunacion;
	}
	
	public Vacunacion registrarVacunacion(Medico medico, Mascota mascota, String nombreVacuna, double precioVacuna, LocalDate fecha) {
		Vacunacion vacunacion = new Vacunacion(medico, nombreVacuna, precioVacuna, fecha);
		mascota.addServicio(vacunacion);
		return vacunacion;
	}
	
	public Guarderia registrarGuarderia(int dias, Mascota mascota) {
		Guarderia guarderia = new Guarderia(dias, mascota);
		mascota.addServicio(guarderia);
		return guarderia;
	}
	
	public Guarderia registrarGuarderia(int dias, Mascota mascota, LocalDate fecha) {
		Guarderia guarderia = new Guarderia(dias, mascota, fecha);
		mascota.addServicio(guarderia);
		return guarderia;
	}
	
	public double recaudacion(Mascota mascota, LocalDate fecha) {
		return mascota.recaudacion(fecha);
	}
	
	public double recaudacionCachorros(LocalDate fecha) {
		return this.mascotas.stream().filter(m -> m.esCachorro()).mapToDouble(m -> m.recaudacion(fecha)).sum();
	}
	
}
