package segundaFecha;

import java.util.ArrayList;
import java.util.List;
import java.util.Queue;

import tp5.ejercicio1.Edge;
import tp5.ejercicio1.Graph;
import tp5.ejercicio1.Vertex;

public class Parcial {
	public Vertex<String> buscar(Graph<String> red, String nombre){
		for(Vertex<String> v:red.getVertices()) {
			if (v.getData().equals(nombre)) {
				return v;
			}
		}
		return null;
	}
	
	/*
	
	public List<Usuario> invitacionMasterClass(Graph<String> red, String usuario, int distancia, int limite){
		if (!red.isEmpty()) {
			Vertex<String> usr = buscar(red, usuario);
			if (usr!= null) {
				boolean[] visitados = new boolean[red.getSize()];
				return recorrer(red, usr, distancia, limite, visitados;)
			}
		}
		return null;
	}
	
	public List<Usuario> recorrer (Graph<String> red, Vertex<String> usuario, int distancia, int limite, boolean[] visitados){
		List<Usuario> lista = new ArrayList<Usuario>();
		
		Queue<Vertex<String>> cola = new Queue<Vertex<String>>();
		
		Vertex<String> v;
		int nivel = 1;
		for (Edge<String> e: red.getEdges(usuario) ) {
			cola.enqueue( e.getTarget());
			visitados[e.getTarget().getPosition()] = true;
		}
		visitados[usuario.getPosition()] = true;
		
		cola.enqueue(null);
		
		while (!cola.isEmpty() && lista.size() < limite && nivel <= distancia ) {
			v = cola.dequeue();
			if (v!= null) {
				lista.add(new Usuario(nivel, v.getData()));
				for (Edge<String> e: red.getEdges(v)) {
					if (!visitados[e.getTarget().getPosition()]) {
						visitados[e.getTarget().getPosition()] = true;
						cola.enqueue(e.getTarget());
					}
				}
			}else {
				if (!cola.isEmpty()) {
					cola.enqueue(null);
					nivel++;
				}
			}
		}
		return lista;
	}
	*/
}
