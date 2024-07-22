package encomiendas;

import java.util.ArrayList;
import java.util.List;

public class Camion {
	private double pesoMax;
	private double volumenMax;
	private List<Envio> carga;
	
	public Camion(double pesoMax, double volumenMax) {
		this.pesoMax = pesoMax;
		this.volumenMax = volumenMax;
		carga = new ArrayList<Envio>();
	}
	
	public boolean agregarEnvio(Envio envio){
		if (this.getVolumenTotal() + envio.getVolumenTotal() <= this.volumenMax && this.getPesoTotal() + envio.getPesoTotal() <= this.pesoMax) {
			carga.add(envio);
			return true;
		}else {
			return false;
		}
	}
	
	public double getPesoTotal() {
		double total = 0;
		total = total + this.carga.stream().mapToDouble(c -> c.getPesoTotal()).sum();
		return total;
	}
	
	public List<Envio> getCarga(){
		return this.carga;
	}
	
	public double getVolumenTotal() {
		double total = 0;
		total = total + this.carga.stream().mapToDouble(c-> c.getVolumenTotal()).sum();
		return total;
	}
}
