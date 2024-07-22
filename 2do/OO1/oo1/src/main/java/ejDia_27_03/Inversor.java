package ejDia_27_03;

import java.util.ArrayList;
import java.util.List;

public class Inversor {
	private String nombre;
	private List<Inversion> inversiones;
	
	public Inversor (String nombre) {
		this.nombre = nombre;
		inversiones = new ArrayList<Inversion>();
	}
	
	public void agregarInversion(Inversion inversion) {
		this.inversiones.add(inversion);
	}
	
	public double valorActual() {
		double valorActual = 0;
		List<Inversion> inversionesValor = this.inversiones;
		valorActual = inversionesValor.stream().mapToDouble(i->i.valorActual()).sum();
		return valorActual;
	}
	
	public double valorActual(Inversion inversion) {
		return inversion.valorActual();
	}
}
