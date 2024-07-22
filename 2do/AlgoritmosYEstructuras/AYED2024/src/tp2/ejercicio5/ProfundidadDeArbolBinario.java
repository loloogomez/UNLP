package tp2.ejercicio5;

import tp2.ejercicio1.ArbolBinario;
import tp2.ejercicio1.ColaGenerica;

public class ProfundidadDeArbolBinario {
	private ArbolBinario<Integer> arbol;
	
	public ProfundidadDeArbolBinario(ArbolBinario<Integer> arbol) {
		this.arbol = arbol;
	}
	
	public int sumaElementosProfundidad(int p) {
		ColaGenerica<ArbolBinario<Integer>> cola = new ColaGenerica<ArbolBinario<Integer>>();
		int nivel = 0;
		int suma = 0;
		ArbolBinario<Integer> aux;
		cola.encolar(this.arbol);
		cola.encolar(null);
		while (!cola.esVacia()) {
			aux = cola.desencolar();
			if ( !cola.esVacia() && aux == null) {
				nivel++;
				cola.encolar(null);
			}else {
				if (!cola.esVacia()) {
					if (nivel == p) {
						suma = suma + aux.getDato();
					}else {
						if (aux.tieneHijoIzquierdo()) {
							cola.encolar(aux.getHijoIzquierdo());
						}
						if (aux.tieneHijoDerecho()) {
							cola.encolar(aux.getHijoDerecho());
						}
					}
				}
			}
		}
		return suma;
	}
}
