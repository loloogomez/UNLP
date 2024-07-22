package mercadoDeObjetosTest;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import mercadoDeObjetos.Cliente;
import mercadoDeObjetos.Envio;
import mercadoDeObjetos.MetodoPago;
import mercadoDeObjetos.Pedido;
import mercadoDeObjetos.Producto;
import mercadoDeObjetos.Sistema;
import mercadoDeObjetos.Vendedor;

class CalcularCostoPedidoTest {
	
	Sistema sistema;
	Cliente cliente;
	Vendedor vendedor;
	Producto producto;
	
	Envio retirarComercio;
	Envio retirarSucursal;
	Envio domicilio;
	MetodoPago cuotas6;
	MetodoPago contado;

	
	@BeforeEach
	public void setUp() {
		sistema = new Sistema();
		
		//envios
		retirarComercio = sistema.getMetodosEnvio().get(0);
		retirarSucursal = sistema.getMetodosEnvio().get(1);
		domicilio = sistema.getMetodosEnvio().get(2);
		
		//metodos de pago
		cuotas6 = sistema.getMetodoPago().get(0);
		contado = sistema.getMetodoPago().get(1);

		cliente = sistema.registrarCliente("cliente", "direccion");
		vendedor = sistema.registrarVendedor("vendedor1", "direccion1");
		producto = sistema.venderProducto("producto1", "descripcion1", 10, 10, vendedor);
	}
	
	
	@Test
	public void testPagoContadoRetirarComercio() {
		Pedido pedido = sistema.crearPedido(cliente, producto, 10, retirarComercio, contado);
		
		//10 productos * 10 unidades = 100, contado y retirar al comercio no modifan precio
		assertEquals(100, sistema.calcularCostoPedido(pedido));
	}
	
	@Test
	public void testPago6Cuotas() {
		Pedido pedido = sistema.crearPedido(cliente, producto, 10, retirarComercio, cuotas6);
		
		//10 productos * 10 unidades = 100,retirar al comercio no modifan precio, 6 cuotas aumentas 20% = 120
		assertEquals(120, sistema.calcularCostoPedido(pedido));
	}
	
	@Test
	public void testRetirarSucursal() {
		Pedido pedido = sistema.crearPedido(cliente, producto, 10, retirarSucursal, contado);
		
		//10 productos * 10 unidades = 100, contado no modifan precio, retirar en sucursal aumenta 50 = 150
		assertEquals(150, sistema.calcularCostoPedido(pedido));
	}
	
	
	@Test
	public void testDomicilio() {
		Pedido pedido = sistema.crearPedido(cliente, producto, 10, domicilio, contado);
		
		//10 productos * 10 unidades = 100, contado no modifan precio, domicilio aumenta 0.5 x km, km = 100, 150
		assertEquals(150, sistema.calcularCostoPedido(pedido));
	}


}
