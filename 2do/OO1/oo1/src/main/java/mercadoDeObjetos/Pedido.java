package mercadoDeObjetos;

public class Pedido {
	private Cliente cliente;
	private MetodoPago metodoPago;
	private Envio envio;
	private Producto producto;
	private int cantidad;
	
	public Pedido(Cliente cliente, Producto producto, int cantidad, MetodoPago metodoPago, Envio envio) {
		this.cliente = cliente;
		this.metodoPago = metodoPago;
		this.envio = envio;
		this.producto = producto;
		this.cantidad = cantidad;
	}
	
	public double calcularPrecio() {
		double total = this.producto.calcularPrecio(this.cantidad);
		total = total + envio.calcularPrecio(this.cliente.getDireccion(), this.producto.getVendedor().getDireccion());
		return metodoPago.calcularPrecio(total);
	}
	
}
