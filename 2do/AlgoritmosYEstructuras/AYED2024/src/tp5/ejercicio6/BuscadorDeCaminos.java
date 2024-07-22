package tp5.ejercicio6;

import java.util.ArrayList;
import java.util.List;

import tp5.ejercicio1.Edge;
import tp5.ejercicio1.Graph;
import tp5.ejercicio1.Vertex;

public class BuscadorDeCaminos {
	Graph<String> bosque;
	
	public Vertex<String> buscar(){
		for (Vertex<String> v: this.bosque.getVertices()) {
			if (v.getData().equals("Casa caperucita")) {
				return v;
			}
		}
		return null;
	}
	
	public void recorrer(Vertex<String> vertice, boolean[] visitados, List<List<String>> listas, List<String> lista){
		lista.add(vertice.getData());
		visitados[vertice.getPosition()] = true;
		if (vertice.getData().equals("Casa abuelita")) {
			listas.add(lista);
		}else {
			int size = this.bosque.getSize();
			for (Edge<String> edge:this.bosque.getEdges(vertice)) {
				Vertex<String> v = edge.getTarget();
				if ((!visitados[v.getPosition()]) && (edge.getWeight() < 5)) {
					recorrer(v, visitados, listas, lista);
					lista = lista.subList(0, size);
				}
			}
		}
		visitados[vertice.getPosition()] = false;
	}
	
	public List<List<String>> recorridosMasSeguros(){
		Vertex<String> inicio = this.buscar();
		List<List<String>> listas = new ArrayList<List<String>>();
		List<String> lista = new ArrayList<String>();
		boolean[] visitados = new boolean[this.bosque.getSize()];
		if (inicio != null) {
			recorrer(inicio,visitados, listas, lista);
		}
		return listas;
	}
}
