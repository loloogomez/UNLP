package tp2.ejercicio3;

import tp2.ejercicio1.ArbolBinario;
import tp2.ejercicio1.ListaEnlazadaGenerica;
import tp2.ejercicio1.ListaGenerica;

public class ContadorArbol {
	private ArbolBinario<Integer> arbol;
	
	public ContadorArbol(ArbolBinario<Integer> arbol) {
		this.arbol = arbol;
	}
	
	public boolean esPar(ArbolBinario<Integer> elem) {
		return elem.getDato() % 2 == 0;
	}
	
	public ListaGenerica<Integer> postOrden(ArbolBinario<Integer> aux, ListaGenerica<Integer> lista) {
		if (!aux.esVacio()) {
			if (aux.tieneHijoIzquierdo()) {
				inOrden(aux.getHijoIzquierdo(), lista);
			}
			if (aux.tieneHijoDerecho()) {
				inOrden(aux.getHijoDerecho(), lista);
			}
			if (esPar(aux)) {
				lista.agregarFinal(aux.getDato());
			}
		}
		return lista;
	}
	
	public ListaGenerica<Integer> inOrden(ArbolBinario<Integer> aux, ListaGenerica<Integer> lista) {
		if (!aux.esVacio()) {
			if (aux.tieneHijoIzquierdo()) {
				inOrden(aux.getHijoIzquierdo(), lista);
			}
			if (esPar(aux)) {
				lista.agregarFinal(aux.getDato());
			}
			if (aux.tieneHijoDerecho()) {
				inOrden(aux.getHijoDerecho(), lista);
			}	
		}
		return lista;
	}
	
	public ListaGenerica<Integer> numerosPares(){
		ListaGenerica<Integer> lista = new ListaEnlazadaGenerica<Integer>();
		lista = postOrden(this.arbol, lista);
		return lista;
	}
}
