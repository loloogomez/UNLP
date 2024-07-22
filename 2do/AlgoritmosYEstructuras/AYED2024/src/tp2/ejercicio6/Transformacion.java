package tp2.ejercicio6;
import tp2.ejercicio1.ArbolBinario;

public class Transformacion {
	private ArbolBinario<Integer> arbol;
	
	public Transformacion(ArbolBinario<Integer> arbol) {
		this.arbol = arbol;
	}
	
	public int sumar(ArbolBinario<Integer> aux){
		int suma = 0;
		if (aux.esHoja()) {
			suma = aux.getDato();
			aux.setDato(0);
			return suma;
		}
		if (aux.tieneHijoIzquierdo()) {
			suma = suma + sumar(aux.getHijoIzquierdo());
		}
		if (aux.tieneHijoDerecho()) {
			suma = suma + sumar(aux.getHijoDerecho());
		}
		int dato = aux.getDato();
		aux.setDato(suma);
		return suma + dato;
	}
	
	public ArbolBinario<Integer> suma(){
		sumar(this.arbol);
		return this.arbol;
	}
}
