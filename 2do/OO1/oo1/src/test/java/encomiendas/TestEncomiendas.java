package encomiendas;

import static org.junit.jupiter.api.Assertions.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class TestEncomiendas {
	Aplicacion aplicacion;
	Camion camion;
	List<Producto> productos;

	@BeforeEach
	public void setUp() {
		aplicacion = new Aplicacion();
		camion = new Camion(2400, 2600);
		
		productos = new ArrayList<Producto>();
		
		productos.add(new Producto("...", 1000, 1000));
	}
	
	@Test
	public void testPaqueteMini() {
		Envio mini= aplicacion.nuevoPaqueteMini("La Plata", productos);
		assertEquals(mini,aplicacion.getEnvios().get(0));
	}
	
	@Test
	public void testPaqueteNormal() {
		Envio normal= aplicacion.nuevoPaqueteMini("La Plata", productos);
		assertEquals(normal, aplicacion.getEnvios().get(0));
	}
	
	@Test
	public void testPaqueteMax() {
		Envio max= aplicacion.nuevoPaqueteMini("La Plata", productos);
		assertEquals(max, aplicacion.getEnvios().get(0));
	}
	
	@Test
	public void testValidarMiniTrue() {
		productos.add(new Producto("...", 200, 300));
		//peso:1200 volumen:1300(valido)
		Envio envio = aplicacion.nuevoPaqueteMini("La Plata", productos);
		
		assertEquals(envio, aplicacion.getEnvios().get(0));
	}
	
	@Test
	public void testValidarMiniFalse() {
		productos.add(new Producto("...", 201, 301));
		//peso:1201 volumen:1301(invalido)
		aplicacion.nuevoPaqueteMini("La Plata", productos);
		
		assertEquals(0, aplicacion.validar(aplicacion.getEnvios()).size());
	}
	
	@Test void testValidarNormalTrue() {
		productos.add(new Producto("...",4000,9000));
		//peso:5000 volumen:10000 (valido)
		Envio envio = aplicacion.nuevoPaqueteNormal("La Plata", productos);
		
		assertEquals(envio, aplicacion.validar(aplicacion.getEnvios()).get(0));
	}
	
	@Test void testValidarNormalFalse() {
		
		productos.add(new Producto("...",4001,9001));
		//peso:5001 volumen:10001 (invalido)
		aplicacion.nuevoPaqueteNormal("La Plata", productos);
		
		assertEquals(0, aplicacion.validar(aplicacion.getEnvios()).size());
	}
	
	@Test
	public void testValidarMaxTrue() {
		productos.add(new Producto("...",14000,24000));
		//peso:15000 volumen:25000(valido)
		Envio envio = aplicacion.nuevoPaqueteMax("La Plata", productos);
		
		assertEquals(envio, aplicacion.validar(aplicacion.getEnvios()).get(0));
	}
	
	@Test
	public void testValidarMaxFalse() {
		productos.add(new Producto("...",14001,24001));
		//peso:15001 volumen:25001(invalido)
		aplicacion.nuevoPaqueteNormal("La Plata", productos);
		
		assertEquals(0, aplicacion.validar(aplicacion.getEnvios()).size());
	}
	
	@Test
	public void testCargarCamionValidador() {
		//mas antiguo
		aplicacion.nuevoPaqueteMini("La Plata", productos);
		
		//destino invalido
		aplicacion.nuevoPaqueteMini("Buenos Aires", productos);
		
		//mas reciente
		Envio envio = aplicacion.nuevoPaqueteMini("La Plata", productos);
		
		assertEquals(envio, aplicacion.cargarCamion(camion, "La Plata").get(1));
	}
	
	@Test
	public void testCargarCamionCapacidad() {
		//entra
		aplicacion.nuevoPaqueteMini("La Plata", productos);
		
		//entra
		Envio envio = aplicacion.nuevoPaqueteMini("La Plata", productos);
		
		productos.add(new Producto("...", 1, 1));
		
		//no entra
		aplicacion.nuevoPaqueteNormal("La Plata", productos);
		
		assertEquals(envio, aplicacion.cargarCamion(camion, "La Plata").get(1));
		assertEquals(2, camion.getCarga().size());
	}
	
	
}
