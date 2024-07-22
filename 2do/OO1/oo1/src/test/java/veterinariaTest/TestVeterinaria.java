package veterinariaTest;

import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalDate;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import veterinaria.Consulta;
import veterinaria.Guarderia;
import veterinaria.Mascota;
import veterinaria.Medico;
import veterinaria.Vacunacion;
import veterinaria.Veterinaria;

class TestVeterinaria {
	
	Veterinaria veterinaria;
	Medico medico;
	Mascota mascota;
	LocalDate domingo;
	
	@BeforeEach
	public void setUp(){
		veterinaria = new Veterinaria();
		
		medico = new Medico("...", LocalDate.of(2022, 03, 18), 100);
		
		mascota = new Mascota("Denver", LocalDate.of(2023, 03, 18), "Caniche");
			
		domingo = LocalDate.of(2024, 04, 28);
	}
	
	@Test
	public void testRegistrarMedico() {
		Medico medico = veterinaria.registrarMedico("...", LocalDate.of(2024, 03, 18), 100);
		assertEquals(medico, veterinaria.getMedicos().get(0));
	}
	
	@Test
	public void testRegistrarMascota() {
		Mascota mascota= veterinaria.registrarMascota("Denver", LocalDate.of(2023, 03, 18), "Caniche");
		assertEquals(mascota, veterinaria.getMascotas().get(0));
	}
	
	@Test
	public void testRegistrarConsulta() {
		Consulta consulta = veterinaria.registrarConsulta(medico, mascota);
		assertEquals(consulta, mascota.getServicios().get(0));
	}
	
	@Test
	public void testRecaudadoConsultaDomingo() {
		//consulta un domingo
		Consulta consulta = veterinaria.registrarConsulta(medico, mascota, domingo);
		//100(honorario) + 200(domingo) + 200(antiguedad) + 300(descartable) = 800;
		assertEquals(800, consulta.recaudado());
	}
	
	@Test
	public void testRecaudadoConsultaNoDomingo() {
		//consulta un no domingo
		Consulta consulta = veterinaria.registrarConsulta(medico, mascota, LocalDate.of(2024, 04, 27));
		//100(honorario) + 200(antiguedad) + 300(descartable) = 800;
		assertEquals(600, consulta.recaudado());
	}
	
	@Test
	public void testRegistrarVacunacion() {
		Vacunacion vacunacion = veterinaria.registrarVacunacion(medico, mascota, "covid", 100);
		assertEquals(vacunacion, mascota.getServicios().get(0));
	}
	
	@Test
	public void testRecaudadoVacunacionDomingo() {
		//vacunacion un domingo
		Vacunacion vacunacion = veterinaria.registrarVacunacion(medico, mascota, "covid", 100,domingo);
		//100(honorario) + 200(domingo) + 500(descartable) + 100(vacuna) = 900
		assertEquals(900, vacunacion.recaudado());
	}
	
	@Test
	public void testRecaudadoVacunacionNoDomingo() {
		//vacunacion un no domingo
		Vacunacion vacunacion = veterinaria.registrarVacunacion(medico, mascota, "covid", 100, LocalDate.of(2024, 04, 27));
		//100(honorario) + 500(descartable) + 100(vacuna) = 900
		assertEquals(700, vacunacion.recaudado());
	}
	
	@Test
	public void testRegistrarGuarderia() {
		Guarderia guarderia = veterinaria.registrarGuarderia(10, mascota);
		assertEquals(guarderia, mascota.getServicios().get(0));
	}
	
	@Test
	public void testRecaudadoGuarderiaConDescuento() {
		//mascota con 5 servicios
		veterinaria.registrarConsulta(medico, mascota, domingo);
		veterinaria.registrarConsulta(medico, mascota, domingo);
		veterinaria.registrarConsulta(medico, mascota, domingo);
		veterinaria.registrarConsulta(medico, mascota, domingo);
		veterinaria.registrarConsulta(medico, mascota, domingo);
		
		Guarderia guarderia = veterinaria.registrarGuarderia(5, mascota);
		
		//(5 * 500)* 0.9 = 2250
		assertEquals(2250, guarderia.recaudado());
	}
	
	@Test
	public void testRecaudadoGuarderiaSinDescuento() {
		//mascota con 4 servicios
		veterinaria.registrarConsulta(medico, mascota, domingo);
		veterinaria.registrarConsulta(medico, mascota, domingo);
		veterinaria.registrarConsulta(medico, mascota, domingo);
		veterinaria.registrarConsulta(medico, mascota, domingo);
		
		Guarderia guarderia = veterinaria.registrarGuarderia(5, mascota);
		
		//5 * 500 = 2500
		assertEquals(2500, guarderia.recaudado());
	}
	
	@Test
	public void testRecaudacion() {
		LocalDate sabado= LocalDate.of(2024, 04, 27);
		
		//no domingo -> 100(honorario) + 200(antiguedad) + 300(descartable) = 600
		veterinaria.registrarConsulta(medico, mascota, sabado);
		//no domingo -> 100(honorario) + 500(descartable) + 100(vacuna) = 700
		veterinaria.registrarVacunacion(medico, mascota, "covid", 100, sabado);
		//2500
		veterinaria.registrarGuarderia(5, mascota, sabado);
		
		//otro dia (no se contabiliza)
		veterinaria.registrarConsulta(medico, mascota, domingo);
		
		assertEquals(3800, veterinaria.recaudacion(mascota, sabado));
	}
	
	@Test
	public void testRecaudacionCachorros() {
		Mascota mascota = veterinaria.registrarMascota("Denver", LocalDate.of(2023, 1, 1), "Bull dog");
		Mascota mascota2 = veterinaria.registrarMascota("Berlin", LocalDate.of(2020, 1, 1), "Bull dog");
		
		veterinaria.registrarGuarderia(5, mascota, domingo);
		veterinaria.registrarGuarderia(10, mascota2, domingo);
		
		assertEquals(2500, veterinaria.recaudacionCachorros(domingo));
	}

}
