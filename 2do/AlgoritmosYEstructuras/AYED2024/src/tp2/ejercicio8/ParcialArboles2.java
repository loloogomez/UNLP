package tp2.ejercicio8;

import tp2.ejercicio1.ArbolBinario;

public class ParcialArboles2 {
	public boolean esPrefijo(ArbolBinario<Integer> arbol1, ArbolBinario<Integer> arbol2) {
		boolean aux = true;
		if (arbol1.getDato() != arbol2.getDato()){
			aux = false;
		}
		if (aux == true) {
			if (arbol1.tieneHijoIzquierdo()) {
				if (arbol2.tieneHijoIzquierdo()) {
					aux = esPrefijo(arbol1.getHijoIzquierdo(), arbol2.getHijoIzquierdo());
				}else {
					aux = false;
				}
			}
		}
		if (aux == true) {
			if (arbol1.tieneHijoDerecho()) {
				if (arbol2.tieneHijoDerecho()) {
					aux = esPrefijo(arbol1.getHijoIzquierdo(), arbol2.getHijoDerecho());
				}else {
					aux = false;
				}
			}
		}
		return aux;
	}
}
