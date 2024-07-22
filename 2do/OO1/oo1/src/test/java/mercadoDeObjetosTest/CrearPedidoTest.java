package mercadoDeObjetosTest;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import mercadoDeObjetos.*;

class CrearPedidoTest {

	Sistema sistema = new Sistema();
	Cliente cliente;
	Vendedor vendedor;
	Producto producto;
	
	//envio = retirar en comercio
	Envio metodoEnvio = sistema.getMetodosEnvio().get(0);
	
	// metodo de pago = 6 cuotas
	MetodoPago metodoPago = sistema.getMetodoPago().get(0);


	
	@BeforeEach
	public void setUp() {
		cliente = sistema.registrarCliente("cliente", "direccion");
		vendedor = sistema.registrarVendedor("vendedor1", "direccion1");
		producto = sistema.venderProducto("producto1", "descripcion1", 10, 10, vendedor);
	}
	
	@Test
	public void testCrearPedido() {		
		Pedido pedido = sistema.crearPedido(cliente, producto, 10, metodoEnvio, metodoPago);
		
		assertEquals(pedido, sistema.getPedidos().get(0));
		
		//quedan 0 productos disponibles
		
		//se pide uno mas
		sistema.crearPedido(cliente, producto, 1, metodoEnvio, metodoPago);
		assertEquals(1, sistema.getPedidos().size());
	}

}
