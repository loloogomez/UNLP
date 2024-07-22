package parcialTercera;

import java.util.ArrayList;
import java.util.List;

import tp5.ejercicio1.Edge;
import tp5.ejercicio1.Graph;
import tp5.ejercicio1.Vertex;
import tp5.ejercicio1.adjList.AdjListGraph;

public class Parcial {
	private Graph<String> bosque;
	
	public Parcial(Graph<String> bosque) {
		this.bosque = bosque;
	}
	
	public Vertex<String> buscar (String caperucita) {
		for (Vertex<String> v: this.bosque.getVertices()) {
			if (v.getData().equals(caperucita)) {
				return v;
			}
		}
		return null;
	}
	
	public void recorrer(int maxFrutal, List<String> lista, List<String> listaAct, int max, int maxAct,
	Vertex<String> vertice, boolean[] visitados, String abuelita) {
		
		listaAct.add(vertice.getData());
		visitados[vertice.getPosition()] = true;
		
		System.out.println("lista: " + lista.toString());
		System.out.println("lista actual: " + listaAct.toString());
		System.out.println();
		
		if (vertice.getData().equals(abuelita)) {
			if (maxAct > max) {
				lista.removeAll(lista);
				lista.addAll(listaAct);
				max = maxAct;
			}
		}else {
			for (Edge<String> e: this.bosque.getEdges(vertice)) {
				Vertex<String> v = e.getTarget();
				if (!visitados[v.getPosition()] && e.getWeight()<= maxFrutal) {
					int size = listaAct.size();
					
					recorrer(maxFrutal, lista, listaAct, max, maxAct + e.getWeight(), v, visitados, abuelita);
					
					
					listaAct = listaAct.subList(0, size);
				}
			}
		}
		visitados[vertice.getPosition()] = false;
	}
	
	public List<String> parcial(String abuelita, String caperucita, int maxFrutal){
		if (!this.bosque.isEmpty()) {
			Vertex<String> vertice = buscar(caperucita);
			if (vertice != null) {
				boolean[] visitados = new boolean[this.bosque.getSize()];
				List<String> lista = new ArrayList<String>();
				recorrer(maxFrutal, lista, new ArrayList<String>(), 0, 0, vertice, visitados, abuelita);
				return lista;
			}
		}
		return null;
	}
	
	public static void main(String args[]) {
		Graph<String> bosque = new AdjListGraph<String>();
        Vertex<String> caperucita = bosque.createVertex("Caperucita");
        Vertex<String> uno = bosque.createVertex("Uno");
        Vertex<String> dos = bosque.createVertex("Dos");
        Vertex<String> tres = bosque.createVertex("Tres");
        Vertex<String> cuatro = bosque.createVertex("Cuatro");
        Vertex<String> cinco = bosque.createVertex("Cinco");
        Vertex<String> seis = bosque.createVertex("Seis");
        Vertex<String> abuela = bosque.createVertex("Abuela");
       
        //caperucita
        bosque.connect(caperucita, uno, 3);
        bosque.connect(caperucita, tres, 20);
        
        //uno
        bosque.connect(uno, dos, 7);
        bosque.connect(uno, caperucita, 3);
        
        //dos
        bosque.connect(dos, uno, 7);
        bosque.connect(dos, tres, 9);
        
        //tres
        bosque.connect(tres, caperucita, 20);
        bosque.connect(tres, cuatro, 50);
        bosque.connect(tres, cinco, 15);
        bosque.connect(tres, seis, 20);
        bosque.connect(tres, abuela, 70);
        
        //cuatro	
        bosque.connect(cuatro, cinco, 8);
        bosque.connect(cuatro, tres, 50);
        
        //cinco
        bosque.connect(cinco, cuatro, 8);
        bosque.connect(cinco, tres, 15);
        
        //seis
        bosque.connect(seis, tres, 20);
        bosque.connect(seis, abuela, 30);
        
        //abuela
        bosque.connect(abuela, tres, 70);
        bosque.connect(abuela, seis, 30);
        
        //camino con maxFrutal = 30:
        // Caperucita - Tres - Seis - Abuela
        //max = 70
        
        Parcial p = new Parcial(bosque);
        System.out.println(p.parcial("Abuela", "Caperucita", 30).toString());
	}
}
