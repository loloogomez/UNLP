package tp2.ejercicio1;

public class PilaGenerica<T> {
	private ListaGenerica<T> datos;
	
	public PilaGenerica() {
		this.datos = new ListaEnlazadaGenerica<T>();
	}
	
	public void apilar(T dato) {
		this.datos.agregarFinal(dato);
	}
	
	public T desapilar() {
		T aux = this.datos.elemento(this.datos.tamanio());
		this.datos.eliminarEn(this.datos.tamanio());
		return aux;
	}
	
	public T tope() {
		return this.datos.elemento(this.datos.tamanio());
	}
	
	public boolean esVacia() {
		return this.datos.esVacia();
	}
}
