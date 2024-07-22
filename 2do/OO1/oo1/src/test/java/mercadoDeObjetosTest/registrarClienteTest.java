package mercadoDeObjetosTest;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

import mercadoDeObjetos.Cliente;
import mercadoDeObjetos.Sistema;
import mercadoDeObjetos.Vendedor;

class registrarClienteTest {

	Sistema sistema = new Sistema();
	
	@Test
	public void testRegistrarCliente() {
		Cliente cliente = sistema.registrarCliente("cliente1", "direccion1");
		assertEquals(cliente, sistema.buscarCliente("cliente1"));
		assertNotEquals(cliente, sistema.buscarCliente("cliente2"));
	}
	
}
