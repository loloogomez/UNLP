package tp3.ejercicio1;

import java.util.LinkedList;
import java.util.List;

import tp2.ejercicio1.ColaGenerica;
import tp2.ejercicio1.ListaEnlazadaGenerica;

public class GeneralTree<T>{

	private T data;
	private List<GeneralTree<T>> children = new LinkedList<GeneralTree<T>>(); 

	public GeneralTree() {
		
	}
	public GeneralTree(T data) {
		this.data = data;
	}

	public GeneralTree(T data, List<GeneralTree<T>> children) {
		this(data);
		this.children = children;
	}	
	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	public List<GeneralTree<T>> getChildren() {
		return this.children;
	}
	
	public void setChildren(List<GeneralTree<T>> children) {
		if (children != null)
			this.children = children;
	}
	
	public void addChild(GeneralTree<T> child) {
		this.getChildren().add(child);
	}

	public boolean isLeaf() {
		return !this.hasChildren();
	}
	
	public boolean hasChildren() {
		return !this.children.isEmpty();
	}
	
	public boolean isEmpty() {
		return this.data == null && !this.hasChildren();
	}

	public void removeChild(GeneralTree<T> child) {
		if (this.hasChildren())
			children.remove(child);
	}
	
	public int altura() {
		int total = 0;
		if (!this.isEmpty()) {
			if (!this.isLeaf()) {
				total++;
			}
			if (this.hasChildren()) {
				List<GeneralTree<T>> hijos = this.getChildren();
				int max = 0;
				for (GeneralTree<T> hijo:hijos) {
					if (hijo.altura() > max) {
						max = hijo.altura();
					}
				}
				total = total + max;
			}
		}
		return total;
	}
	
	public int nivel(T dato){
		int profundidad = -1;
		if (!this.isEmpty()) {
			if (this.getData() == dato) {
				profundidad = 0;
				return profundidad;
			}else {
				if (this.hasChildren()) {
					List<GeneralTree<T>> hijos = this.getChildren();
					for (GeneralTree<T> hijo:hijos) {
						if (hijo.nivel(dato) > -1) {
							return hijo.nivel(dato) + 1;
						}
					}
				}
				return profundidad;
			}
		}
		return profundidad;
	}

	public int ancho(){
		int max = 0;
		if (!this.isEmpty()) {
			int total = 0;
			ColaGenerica<GeneralTree<T>> cola = new ColaGenerica<GeneralTree<T>>();
			cola.encolar(this);
			cola.encolar(null);
			GeneralTree<T> aux;
			while (!cola.esVacia()) {
				aux = cola.desencolar();
				if (aux == null) {
					if (total > max) {
						max = total;
					}
					total = 0;
					if (!cola.esVacia()) {
						cola.encolar(null);
					}
				}else {
					total = total + 1;
					if (aux.hasChildren()) {
						List<GeneralTree<T>> hijos = aux.getChildren();
						for (GeneralTree<T> hijo: hijos) {
							cola.encolar(hijo);
						}
					}
				}
			}
		}
		return max;
	}
	
	public boolean esAncestro(T a, T b) {
		if (!this.isEmpty()) {
			if (this.getData() == a) {
				return esAncestro(this, b);
			}
			if (this.hasChildren()) {
				List<GeneralTree<T>> hijos = this.getChildren();
				for (GeneralTree<T> hijo: hijos) {
					if (hijo.esAncestro(a, b)) {
						return true;
					}
				}
				return false;
			}
		}return false;
	}
	
	public boolean esAncestro(GeneralTree<T> arbol, T b) {
		if (!arbol.isEmpty()) {
			if (arbol.getData() == b) {
				return true;
			}
			if (arbol.hasChildren()) {
				List<GeneralTree<T>> hijos = arbol.getChildren();
				for (GeneralTree<T> hijo: hijos) {
					if (esAncestro(hijo, b)) {
						return true;
					}
				}
				return false;
			}
		}return false;	
	}
}