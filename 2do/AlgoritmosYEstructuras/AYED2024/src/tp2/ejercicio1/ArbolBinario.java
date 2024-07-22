package tp2.ejercicio1;

public class ArbolBinario<T> {
	private T dato;
	private ArbolBinario<T> hijoIzquierdo;   
	private ArbolBinario<T> hijoDerecho; 

	
	public ArbolBinario() {
		super();
	}

	public ArbolBinario(T dato) {
		this.dato = dato;
	}

	/*
	 * getters y setters
	 * 
	 */
	public T getDato() {
		return dato;
	}

	public void setDato(T dato) {
		this.dato = dato;
	}
	
	/**
	 * Preguntar antes de invocar si tieneHijoIzquierdo()
	 * @return
	 */
	public ArbolBinario<T> getHijoIzquierdo() {
		return this.hijoIzquierdo;
	}

	public ArbolBinario<T> getHijoDerecho() {
		return this.hijoDerecho;

	}

	public void agregarHijoIzquierdo(ArbolBinario<T> hijo) {
		this.hijoIzquierdo = hijo;
	}

	public void agregarHijoDerecho(ArbolBinario<T> hijo) {
		this.hijoDerecho = hijo;
	}

	public void eliminarHijoIzquierdo() {
		this.hijoIzquierdo = null;
	}

	public void eliminarHijoDerecho() {
		this.hijoDerecho = null;
	}

	public boolean esVacio() {
		return this.getDato() == null && !this.tieneHijoIzquierdo() && !this.tieneHijoDerecho();
	}

	public boolean esHoja() {
		return (!this.tieneHijoIzquierdo() && !this.tieneHijoDerecho());

	}

	@Override
	public String toString() {
		return this.getDato().toString();
	}

	 
	public boolean tieneHijoIzquierdo() {
		return this.hijoIzquierdo!=null;
	}

	 
	public boolean tieneHijoDerecho() {
		return this.hijoDerecho!=null;
	}

	public int contarHojas() {
		int total = 0;
		if (this.tieneHijoIzquierdo()) {
			total = total + this.getHijoIzquierdo().contarHojas();
		}
		if (this.tieneHijoDerecho()) {
			total = total + this.getHijoDerecho().contarHojas();
		}
		if (this.esHoja()) {
			total = total + 1;
		}
		return total;
	}
	

    public ArbolBinario<T> espejo() {
    	ArbolBinario<T> arbol = new ArbolBinario<T>();
    	if (!this.esVacio()) {
    		arbol.setDato(this.getDato());
    		if (this.tieneHijoIzquierdo()) {
    			arbol.agregarHijoDerecho(this.getHijoIzquierdo().espejo());
    		}
    		if (this.tieneHijoDerecho()) {
    			arbol.agregarHijoIzquierdo(this.getHijoDerecho().espejo());
    		}
    	}
    	return arbol;
    }

	public void entreNiveles(int n, int m){
		ColaGenerica<ArbolBinario<T>> cola = new ColaGenerica<ArbolBinario<T>>();
		cola.encolar(this);
		cola.encolar(null);
		int nivel = 0;
		ArbolBinario<T> aux;
		while (!cola.esVacia()) {
			aux = cola.desencolar();
			if (!cola.esVacia() && aux == null) {
				nivel++;
				if (nivel>= n && nivel <= m) {
					System.out.println("nivel: " + nivel);
				}
				cola.encolar(null);
			}else if (!cola.esVacia()){
				if (nivel>= n && nivel <= m) {
					System.out.println(aux.getDato());
				}
				if (aux.tieneHijoIzquierdo()) {
					cola.encolar(aux.getHijoIzquierdo());
				}
				if (aux.tieneHijoDerecho()) {
					cola.encolar(aux.getHijoDerecho());
				}
			}
		}
	}
	
	public void porNiveles() {
		ColaGenerica<ArbolBinario<T>> cola = new ColaGenerica<ArbolBinario<T>>();
		cola.encolar(this);
		cola.encolar(null);
		int nivel = 0;
		ArbolBinario<T> aux;
		System.out.println("nivel: " + nivel);
		while (!cola.esVacia()) {
			aux = cola.desencolar();
			if (!cola.esVacia() && aux == null) {
				nivel++;
				System.out.println("nivel: " + nivel);
				cola.encolar(null);
			}else if (!cola.esVacia()){
				System.out.println(aux.getDato());
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
