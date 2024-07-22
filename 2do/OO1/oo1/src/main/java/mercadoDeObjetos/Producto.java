package mercadoDeObjetos;

public class Producto {
	private String nombre;
	private String descripcion;
	private double precio;
	private int cantidad;
	private Vendedor vendedor;
	
	public Producto(String nombre, String descripcion, double precio, int cantidad, Vendedor vendedor) {
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.precio = precio;
		this.cantidad = cantidad;
		this.vendedor = vendedor;
	}
	
	public String getNombre() {
		return this.nombre;
	}
	
	public Vendedor getVendedor() {
		return this.vendedor;
	}
	
	public int getCantidad() {
		return this.cantidad;
	}
	
	public void reducirCantidad(int reducir) {
		this.cantidad = this.cantidad - reducir;
	}
	
	public double calcularPrecio(int cantidad) {
		return this.precio*cantidad;
	}
	
	public boolean nombreIgual(String nombre) {
		return this.nombre == nombre;
	}
	
	public boolean cantidadSuficiente(int cantidad) {
		return this.cantidad >= cantidad;
	}
	
}
