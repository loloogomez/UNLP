package encomiendas;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//creo aplicacion
		Aplicacion aplicacion = new Aplicacion();
		
		//valido
		List<Producto> celulares = new ArrayList<Producto>();
		celulares.add(new Producto("samsung", 400, 400));
		celulares.add(new Producto("apple", 400, 400));
		celulares.add(new Producto("xiaomi", 400, 400));
		
		//creo mini
		aplicacion.nuevoPaqueteMini(LocalDate.of(2024, 3, 18),"La Plata", celulares);
		
		//valida
		List<Producto> comidas = new ArrayList<Producto>();
		comidas.add(new Producto("pan", 2000, 5000));
		comidas.add(new Producto("papa", 2000, 2000));
		comidas.add(new Producto("lechuga", 1000, 2000));
		
		//creo normal
		aplicacion.nuevoPaqueteNormal(LocalDate.of(2024, 1, 18),"Buenos Aires", comidas);
		
		//valida
		List<Producto> libros = new ArrayList<Producto>();
		libros.add(new Producto("Principito", 5000, 8000));
		libros.add(new Producto("Biblia", 5000, 8000));
		libros.add(new Producto("Vuelta al mundo", 5000, 8000));
		
		//creo max 
		aplicacion.nuevoPaqueteMax(LocalDate.of(2024, 2, 18),"La Plata", libros);
		
		//impimir los envios validos
		System.out.print(aplicacion.validar(aplicacion.getEnvios()).toString());
		
		
		Camion camion = new Camion(17000, 27000);
		
		//imprimir lista para cargar en el camion
		System.out.println(aplicacion.cargarCamion(camion, "La Plata").toString());
		
	}

}
