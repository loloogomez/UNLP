package mercadoDeObjetos;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class Sistema {
	private List<Vendedor> vendedores;
	private List<Cliente> clientes;
	private List<Producto> productos;
	private List<Pedido> pedidos;
	private List<Envio> metodosEnvio;
	private List<MetodoPago> metodosPago;
	
	public Sistema () {
		this.vendedores = new ArrayList<Vendedor>();
		this.clientes = new ArrayList<Cliente>();
		this.productos = new ArrayList<Producto>();
		this.pedidos = new ArrayList<Pedido>();
		this.metodosEnvio = new ArrayList<Envio>();
			this.metodosEnvio.add(new RetirarComercio());
			this.metodosEnvio.add(new RetirarSucursal());
			this.metodosEnvio.add(new Domicilio());
		
		this.metodosPago = new ArrayList<MetodoPago>();
			this.metodosPago.add(new Cuotas6());
			this.metodosPago.add(new Contado());
	}
	
	public Vendedor registrarVendedor(String nombre, String direccion) {
		Vendedor vendedor = new Vendedor(nombre, direccion);
		vendedores.add(vendedor);
		return vendedor;
	}
	
	public Vendedor buscarVendedor(String nombre) {
		return this.vendedores.stream().filter(v -> v.soyYo(nombre)).findFirst().orElse(null);
	}
	
	public Cliente registrarCliente(String nombre, String direccion) {
		Cliente cliente = new Cliente(nombre, direccion);
		clientes.add(cliente);
		return cliente;
	}
	
	public Cliente buscarCliente(String nombre) {
		return this.clientes.stream().filter(c -> c.soyYo(nombre)).findFirst().orElse(null);
	}
	
	public Producto venderProducto(String nombre, String descripcion, double precio, int cantidad, Vendedor vendedor) {
		Producto producto = new Producto(nombre, descripcion, precio, cantidad, vendedor);
		this.productos.add(producto);
		return producto;
	}
	
	public List<Producto> buscarProducto(String nombre){
		return this.productos.stream().filter(p -> p.nombreIgual(nombre)).collect(Collectors.toList());
	}
	
	//retorna pedido para test
	public Pedido crearPedido(Cliente cliente, Producto producto, int cantidad, Envio metodoEnvio, MetodoPago metodoPago) {
		Producto productosDisponibles = this.buscarProducto(producto.getNombre()).stream().filter(p -> p.cantidadSuficiente(cantidad)).findFirst().orElse(null);
		if (productosDisponibles != null) {
			Pedido pedido = new Pedido(cliente, producto, cantidad, metodoPago, metodoEnvio);
			this.pedidos.add(pedido);
			productosDisponibles.reducirCantidad(cantidad);
			return pedido;
		}else {
			return null;
		}
	}
	
	public double calcularCostoPedido(Pedido pedido) {
		return pedido.calcularPrecio();
	}
	
	//para test
	public List<Envio> getMetodosEnvio() {
		return this.metodosEnvio;
	}
	
	//para test
	public List<MetodoPago> getMetodoPago(){
		return this.metodosPago;
	}
	
	//para test
	public List<Pedido> getPedidos(){
		return this.pedidos;
	}
}
