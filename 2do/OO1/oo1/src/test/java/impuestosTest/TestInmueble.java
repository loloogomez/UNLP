package impuestosTest;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import impuestos.Inmueble;

class TestInmueble {

	Inmueble inmueble;
	
	@Test
	public void calcularImpuestosTest() {
		inmueble = new Inmueble(1, 50, 50);
		
		//1% de 100 es 1;
		assertEquals(1, inmueble.calcularImpuestos());
	}

}
