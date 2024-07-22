package encomiendas;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public abstract class Envio {
	private LocalDate fechaDespacho;
	private String destino;
	private double precio;
	private List<Producto> productos;
	
	public Envio(String destino, double precio, List<Producto> productos) {
		this.fechaDespacho = LocalDate.now();
		this.destino = destino;
		this.precio = precio;
		this.productos = productos;
	}
	
	public List<Producto> getProductos(){
		return this.productos;
	}
	
	public Envio(LocalDate fecha, String destino, double precio, List<Producto> productos) {
		this.fechaDespacho = fecha;
		this.destino = destino;
		this.precio = precio;
		this.productos = productos;
	}
	
	public double getPesoTotal() {
		double total = 0;
		total = total + this.productos.stream().mapToDouble(p -> p.getPeso()).sum();
		return total;
	}
	
	public abstract double getVolumenTotal();
	
	public String getDestino() {
		return this.destino;
	}
	
	public LocalDate getFechaDespacho() {
		return this.fechaDespacho;
	}
	
	public void agregarProducto(Producto producto) {
		this.productos.add(producto);
	}
	
	public abstract boolean validar();
}
