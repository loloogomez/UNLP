package impuestosTest;

import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalDate;

import org.junit.jupiter.api.Test;

import impuestos.Automotor;

class TestAutomotor {

	Automotor automotor;
	
	@Test
	public void calcularImpuestosLess10YearsTest() {
		LocalDate fecha = LocalDate.now().minusYears(10);
		automotor = new Automotor("ABC123", "Ford", "Ranger",fecha, 100);
		
		//10 anios paga impuestos
		assertEquals(5, automotor.calcularImpuestos());
	}
	
	@Test
	public void calcularImpuestosMore10YearsTest() {
		LocalDate fecha = LocalDate.now().minusYears(11);
		automotor = new Automotor("ABC123", "Ford", "Ranger",fecha, 100);
		
		//11 anios no paga impuestos
		assertEquals(0, automotor.calcularImpuestos());
	}

}
