package mercadoDeObjetosTest;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import mercadoDeObjetos.Sistema;
import mercadoDeObjetos.Vendedor;

class registrarVendedorTest {
	
	Sistema sistema = new Sistema();
	
	@Test
	public void testRegistrarVendedor() {
		Vendedor vendedor = sistema.registrarVendedor("vendedor1", "direccion1");
		assertEquals(vendedor, sistema.buscarVendedor("vendedor1"));
		assertNotEquals(vendedor, sistema.buscarVendedor("vendedor2"));
	}
	

}
