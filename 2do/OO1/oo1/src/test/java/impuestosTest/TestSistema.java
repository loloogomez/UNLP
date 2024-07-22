package impuestosTest;

import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalDate;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import impuestos.*;

class TestSistema {
	Sistema sistema = new Sistema();
	Contribuyente contribuyente;
	Inmueble inmueble;
	Automotor automotor;
	
	@Test
	public void cargarContribuyentesTest() {
		contribuyente = sistema.cargarContribuyente("Lorenzo", 1, "unMail@gmail.com", "CityBell");
		assertEquals(contribuyente, sistema.getContribuyentes().get(0));
	}
	
	@Test
	public void cargarInmueble(){
		contribuyente = sistema.cargarContribuyente("Lorenzo", 1, "unMail@gmail.com", "CityBell");
		inmueble = sistema.cargarInmueble(1, 50, 50, contribuyente);
		assertEquals(inmueble, contribuyente.getBienes().get(0));
	}
	
	@Test
	public void cargarAutomotor() {
		contribuyente = sistema.cargarContribuyente("Lorenzo", 1, "unMail@gmail.com", "CityBell");
		LocalDate fecha = LocalDate.now().minusYears(10);
		automotor = sistema.cargarAutomotor("ABC123", "Ford", "Ranger",fecha, 100, contribuyente);
		assertEquals(automotor, contribuyente.getBienes().get(0));
	}
	
	@Test
	public void calcularImpuestos() {
		contribuyente = sistema.cargarContribuyente("Lorenzo", 1, "unMail@gmail.com", "CityBell");
		LocalDate fecha = LocalDate.now().minusYears(10);
		sistema.cargarInmueble(1, 50, 50, contribuyente);
		sistema.cargarAutomotor("ABC123", "Ford", "Ranger",fecha, 100, contribuyente);
		
		//1 de inmueble + 5 de automotor
		assertEquals(6, contribuyente.calcularImpuestos());
	}
}
