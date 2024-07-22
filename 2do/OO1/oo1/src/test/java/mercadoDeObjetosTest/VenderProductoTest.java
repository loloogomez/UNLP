package mercadoDeObjetosTest;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

import mercadoDeObjetos.*;

class VenderProductoTest {

	Sistema sistema = new Sistema();
	Vendedor vendedor = sistema.registrarVendedor("vendedor1", "direccion1");
	
	@Test
	public void testVenderProducto() {
		Producto producto = sistema.venderProducto("producto1", "descripcion1", 10, 10, vendedor);
		assertEquals(producto, sistema.buscarProducto("producto1").get(0)) ;
	}

}
