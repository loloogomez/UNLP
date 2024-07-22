package tp2.ejercicio1;

public class ColaGenerica<T> {
	private ListaGenerica<T> datos;
	
	public ColaGenerica(){
		datos = new ListaEnlazadaGenerica<T>();
	}
	
	public void encolar(T dato) {
		this.datos.agregarFinal(dato);
	}
	
	public T desencolar() {
		T aux = this.datos.elemento(1);
		this.datos.eliminarEn(1);
		return aux;
	}
	
	public T tope() {
		return this.datos.elemento(1);
	}
	
	public boolean esVacia() {
		return this.datos.esVacia();
	}
	
}
