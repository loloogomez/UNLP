package impuestosTest;

import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalDate;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import impuestos.*;

class TestContribuyente {
	
	Contribuyente contribuyente;
	Inmueble inmueble = new Inmueble(1, 50, 50);
	
	LocalDate fecha = LocalDate.now().minusYears(10);
	Automotor automotor = new Automotor("ABC123", "Ford", "Ranger",fecha, 100);
	
	@BeforeEach
	public void setUp() {
		contribuyente = new Contribuyente("Lorenzo", 1, "unMail@gmail.com", "CityBell");
	}
	
	@Test
	public void calcularImpuestos0Bienes() {
		assertEquals(0, contribuyente.calcularImpuestos());
	}
	
	@Test
	public void cargarBienTest() {
		contribuyente.cargarBien(automotor);
		
		assertEquals(automotor, contribuyente.getBienes().get(0));
	}
	
	@Test
	public void calcularImpuestos() {
		contribuyente.cargarBien(automotor);
		contribuyente.cargarBien(inmueble);
		
		//1 de inmueble, 5 de automotor, total = 6
		assertEquals(6, contribuyente.calcularImpuestos());
	}
}
