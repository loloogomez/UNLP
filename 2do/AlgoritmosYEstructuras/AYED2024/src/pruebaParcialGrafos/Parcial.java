package pruebaParcialGrafos;

import java.util.ArrayList;
import java.util.List;

import tp5.ejercicio1.Edge;
import tp5.ejercicio1.Graph;
import tp5.ejercicio1.Vertex;
import tp5.ejercicio1.adjList.AdjListGraph;

public class Parcial {
	public Vertex<Ciudad> getComienzo(Graph<Ciudad> mapa, String ciudad) {
		for(Vertex<Ciudad> c: mapa.getVertices()) {
			if (c.getData().getNombre() == ciudad) {
				return c;
			}
		}
		return null;
	}
	
	public void recorrer(Graph<Ciudad> mapa, boolean[] visitadas, int comienzo, List<String> recorrido, List<String> recorridoParcial, int dias, int diasActual){
		visitadas[comienzo] = true;
		Vertex<Ciudad> v = mapa.getVertex(comienzo);
		System.out.println("Dias actuales:" + diasActual);
		System.out.println(v.getData().getNombre());
		System.out.println(v.getData().getDias());
		
		recorridoParcial.add(v.getData().getNombre());
		
		System.out.println("recorrido: " + recorrido.toString());
		System.out.println("recorrido parcial: " + recorridoParcial.toString());
		System.out.println();
		
		if (diasActual == dias) {
			if(recorridoParcial.size() > recorrido.size()) {
				recorrido.clear();
				recorrido.addAll(recorridoParcial);
			}
		}else {
			for(Edge<Ciudad> c: mapa.getEdges(v)) {
				if (!visitadas[c.getTarget().getPosition()] && diasActual + c.getTarget().getData().getDias() <= dias) {
					recorrer(mapa, visitadas, c.getTarget().getPosition(),recorrido, recorridoParcial, dias, diasActual + c.getTarget().getData().getDias());
				}
			}
		}
		recorridoParcial.remove(recorridoParcial.size()-1);
        visitadas[comienzo] = false;
	}
	
	
	
	public List<String> resolver(Graph<Ciudad>mapa,String ciudad, int cantDiasVacas){
		List<String> recorrido = new ArrayList<String>(); 
		boolean[] visitadas = new boolean[mapa.getSize()];
		for (int i = 0; i< mapa.getSize(); i++) {
			visitadas[i] = false;
		}
		Vertex<Ciudad> comienzo = this.getComienzo(mapa, ciudad);
		if (comienzo.getData().getDias() <= cantDiasVacas) {
			recorrer(mapa, visitadas, comienzo.getPosition(), recorrido, new ArrayList<String>(), cantDiasVacas, comienzo.getData().getDias());
		}
		return recorrido;
	}
	
	 public static void main(String args[]) {
	        Graph<Ciudad> mapa = new AdjListGraph<Ciudad>();
	        Vertex<Ciudad> MarDelPlata = mapa.createVertex(new Ciudad(7, "Mar Del Plata"));
	        Vertex<Ciudad> Pila = mapa.createVertex(new Ciudad(1, "Pila"));
	        Vertex<Ciudad> Dolores = mapa.createVertex(new Ciudad(1, "Dolores"));
	        Vertex<Ciudad> Chascomus = mapa.createVertex(new Ciudad(1, "Chascomús"));
	        Vertex<Ciudad> MarAzul = mapa.createVertex(new Ciudad(3, "Mar Azul"));
	        Vertex<Ciudad> Pinamar = mapa.createVertex(new Ciudad(4, "Pinamar"));
	        Vertex<Ciudad> Madariaga = mapa.createVertex(new Ciudad(1, "Madariaga"));
	        Vertex<Ciudad> LaPlata = mapa.createVertex(new Ciudad(5, "La Plata"));
	        Vertex<Ciudad> LasGaviotas = mapa.createVertex(new Ciudad(1, "Las Gaviotas"));
	        Vertex<Ciudad> Querandi = mapa.createVertex(new Ciudad(1, "Querandi"));
	        Vertex<Ciudad> Hudson = mapa.createVertex(new Ciudad(1, "Hudson"));
	        
	        mapa.connect(MarDelPlata, Pila);
	        mapa.connect(Pila, MarDelPlata);
	        mapa.connect(Pila, Dolores);
	        mapa.connect(Dolores, Pila);
	        mapa.connect(Dolores, Chascomus);
	        mapa.connect(Chascomus, Dolores);
	        
	        mapa.connect(MarDelPlata, MarAzul);
	        mapa.connect(MarAzul, MarDelPlata);
	        mapa.connect(MarAzul, Pinamar);
	        mapa.connect(Pinamar, MarAzul);
	        mapa.connect(Pinamar, Madariaga);
	        mapa.connect(Madariaga, Pinamar);
	        mapa.connect(Dolores, Madariaga);
	        mapa.connect(Madariaga, Dolores);
	        mapa.connect(Madariaga, LaPlata);
	        mapa.connect(LaPlata, Madariaga);
	        mapa.connect(Chascomus, LaPlata);
	        mapa.connect(LaPlata, Chascomus);
	        
	        mapa.connect(MarAzul, LasGaviotas);
	        mapa.connect(LasGaviotas, MarAzul);
	        mapa.connect(MarAzul, Querandi);
	        mapa.connect(Querandi, MarAzul);
	        mapa.connect(LaPlata, Hudson);
	        mapa.connect(Hudson, LaPlata);
	        
	        Parcial p = new Parcial();
	        System.out.println(p.resolver(mapa, "Mar Del Plata", 15));
	    }
}
