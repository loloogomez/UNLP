package encomiendas;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class Aplicacion {
	private List<Envio> envios;
	
	public Aplicacion() {
		this.envios = new ArrayList<Envio>();
	}
	
	public List<Envio> getEnvios(){
		return this.envios;
	}
	
	public PaqueteMini nuevoPaqueteMini(String destino, List<Producto> productos) {
		PaqueteMini envio = new PaqueteMini(destino, productos);
		envios.add(envio);
		return envio;
	}
	
	public PaqueteMini nuevoPaqueteMini(LocalDate fecha, String destino, List<Producto> productos) {
		PaqueteMini envio = new PaqueteMini(fecha, destino, productos);
		envios.add(envio);
		return envio;
	}
	
	public PaqueteNormal nuevoPaqueteNormal(String destino, List<Producto> productos) {
		PaqueteNormal envio = new PaqueteNormal(destino, productos);
		envios.add(envio);
		return envio;
	}
	
	public PaqueteNormal nuevoPaqueteNormal(LocalDate fecha, String destino, List<Producto> productos) {
		PaqueteNormal envio = new PaqueteNormal(fecha, destino, productos);
		envios.add(envio);
		return envio;
	}
	
	public PaqueteMax nuevoPaqueteMax(String destino, List<Producto> productos) {
		PaqueteMax envio = new PaqueteMax(destino, productos);
		envios.add(envio);
		return envio;
	}
	
	public PaqueteMax nuevoPaqueteMax(LocalDate fecha, String destino, List<Producto> productos) {
		PaqueteMax envio = new PaqueteMax(fecha, destino, productos);
		envios.add(envio);
		return envio;
	}
	
	public List<Envio> validar (List<Envio> envios){
		List<Envio> validados;
		validados = envios.stream().filter(e -> e.validar()).collect(Collectors.toList());  
		return validados;
	}
	
	public List<Envio> cargarCamion(Camion camion, String destino){
		
		List<Envio> validados = this.validar(envios);
		
		validados = validados.stream().filter(e-> e.getDestino() == destino).sorted((e1, e2) -> e1.getFechaDespacho().compareTo(e2.getFechaDespacho())).collect(Collectors.toList());
		
		
		return validados.stream().filter(e-> {return camion.agregarEnvio(e);}).collect(Collectors.toList());
		
	}
}
