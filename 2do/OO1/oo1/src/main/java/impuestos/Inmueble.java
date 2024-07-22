package impuestos;

public class Inmueble implements Bien{
	private int numeroPartida;
	private double valorLote;
	private double valorEdificacion;
	
	public Inmueble(int numeroPartida, double valorLote, double valorEdificacion) {
		this.numeroPartida = numeroPartida;
		this.valorLote = valorLote;
		this.valorEdificacion = valorEdificacion;
	}
	
	public double calcularImpuestos() {
		return (this.valorLote + this.valorEdificacion)*0.01;
	}
}
