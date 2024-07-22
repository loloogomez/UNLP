package tp2.ejercicio7;

import tp2.ejercicio1.ArbolBinario;

public class ParcialArboles {
	private ArbolBinario<Integer> arbol;
	
	public ParcialArboles(ArbolBinario<Integer> arbol) {
		this.arbol = arbol;
	}
	
	public boolean isLeftTree(int num) {
		ArbolBinario<Integer> arbol = buscar(num, this.arbol);
		if (arbol != null) {
			int izquierdo;
			int derecho;
			if (!arbol.tieneHijoIzquierdo()) {
				izquierdo = -1;
			}else {
				izquierdo = recorrer(arbol.getHijoIzquierdo());
			}
			if (!arbol.tieneHijoDerecho()) {
				derecho = -1;
			}else {
				derecho = recorrer(arbol.getHijoDerecho());
			}
			return izquierdo > derecho;
		}else {
			return false;
		}
	}
	
	public ArbolBinario<Integer> buscar(int num, ArbolBinario<Integer> arbol){
		ArbolBinario<Integer> retorno = null;
		if (arbol.tieneHijoIzquierdo()) {
			retorno = buscar(num, arbol.getHijoIzquierdo());
		}
		if (retorno == null && arbol.tieneHijoDerecho()) {
			retorno = buscar(num, arbol.getHijoDerecho());
		}
		if (arbol.getDato() == num) {
			retorno = arbol;
		}
		return retorno;
	}
	
	public int recorrer (ArbolBinario<Integer> arbol) {
		int total = 0;
		if (arbol.tieneHijoIzquierdo()){
			total = total + recorrer(arbol.getHijoIzquierdo());
		}
		if (arbol.tieneHijoDerecho()){
			total = total + recorrer(arbol.getHijoDerecho());
		}
		if (arbol.tieneHijoIzquierdo() && !arbol.tieneHijoDerecho()) {
			total = total + 1;
		}
		if (!arbol.tieneHijoIzquierdo() && arbol.tieneHijoDerecho()) {
			total = total + 1;
		}
		return total;
	}
}
