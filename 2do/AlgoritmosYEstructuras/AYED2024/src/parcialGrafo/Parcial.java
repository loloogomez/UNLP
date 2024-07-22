package parcialGrafo;

import tp5.ejercicio1.Edge;
import tp5.ejercicio1.Graph;
import tp5.ejercicio1.Vertex;

public class Parcial {
	private Vertex<Recinto> buscarOrigen (Graph<Recinto> grafo) {
		for (int i = 0; i < grafo.getSize(); i++) {
			Vertex<Recinto> v = grafo.getVertex(i);
			if (v.getData().getNombre().equals("Entrada"))
				return v;
		}
		return null;
	}
	
	private int resolver (int origen, boolean[] marcas, Graph<Recinto> grafo, int tiempo, int recintos, int recintosAct, int totalAct)  {
		marcas[origen] = true;
		Vertex<Recinto> v = grafo.getVertex(origen);
		totalAct+= v.getData().getTiempo();
		recintosAct++;
		if (totalAct > tiempo) //si el tiempo actual el mayor que el mejor tiempo guardado 
			recintosAct--;     //quitar este recinto
		else {	
			if (recintosAct > recintos) //si el tiempo fue menor, y tiene mas recintos visitados que la lista guardada, se actualiza
				recintos =  recintosAct;
			for (Edge<Recinto> a:grafo.getEdges(v)) {
				int j = a.getTarget().getPosition();
				if (!marcas[j]) {
					recintos = resolver(j, marcas, grafo, tiempo, recintos, recintosAct, totalAct + a.getWeight());
				}
			}
		}
		marcas[origen] = false;
		return recintos;
	}
	
	public int resolver (Graph<Recinto> sitios, int tiempo) {
		boolean[] marcas = new boolean[sitios.getSize()];
		Vertex<Recinto> origen = buscarOrigen(sitios);
		int cantRecintos = 0;
		if (origen != null) {
			int posOrigen = origen.getPosition();
			cantRecintos = resolver(posOrigen, marcas, sitios, tiempo, 0, 0, 0);
		} else {
			System.out.println("La entrada no existe...");
		}
		return cantRecintos;
	}
}
//ademas de la clase Recinto que contiene el nombre y tiempo de cada recinto
