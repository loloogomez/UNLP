package tp2.ejercicio1;

import tp2.ejercicio3.ContadorArbol; 
import tp2.ejercicio5.ProfundidadDeArbolBinario;
import tp2.ejercicio6.Transformacion;
import tp2.ejercicio7.ParcialArboles;
import tp2.ejercicio8.*;

public class PruebaArbolBinario {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		//nivel 0
		ArbolBinario<Integer> arbol = new ArbolBinario<Integer>(10);
		
		//nivel 1
		arbol.agregarHijoIzquierdo(new ArbolBinario<Integer>(5));
		
		arbol.agregarHijoDerecho(new ArbolBinario<Integer>(15));
		
		//nivel 2
		arbol.getHijoIzquierdo().agregarHijoIzquierdo(new ArbolBinario<Integer>(2));
		arbol.getHijoIzquierdo().agregarHijoDerecho(new ArbolBinario<Integer>(7));
		
		arbol.getHijoDerecho().agregarHijoDerecho(new ArbolBinario<Integer>(20));
		
		//nivel 3
		arbol.getHijoIzquierdo().getHijoDerecho().agregarHijoDerecho(new ArbolBinario<Integer>(9));
		
		arbol.getHijoDerecho().getHijoDerecho().agregarHijoDerecho(new ArbolBinario<Integer>(25));
		
		//arbol 2
		//nivel 0
		ArbolBinario<Integer> arbol2 = new ArbolBinario<Integer>(10);
		
		//nivel 1
		arbol2.agregarHijoIzquierdo(new ArbolBinario<Integer>(5));
		
		//nivel 2
		arbol2.getHijoIzquierdo().agregarHijoIzquierdo(new ArbolBinario<Integer>(3));

		
		/*
		System.out.println("arbol por niveles");
		arbol.porNiveles();
		
		System.out.println("cant Hojas: " + arbol.contarHojas());
		
		System.out.println("espejado por niveles");
		arbol.espejo().porNiveles();
		
		System.out.println("entre niveles 1 y 2");
		arbol.entreNiveles(1, 2);
		
		
		ContadorArbol contador = new ContadorArbol(arbol);
		
		System.out.println(contador.numerosPares().toString());
		
		
		ProfundidadDeArbolBinario profundidad = new ProfundidadDeArbolBinario(arbol);
		
		System.out.println(profundidad.sumaElementosProfundidad(3));
		
		
		
		Transformacion transformacion = new Transformacion(arbol);
		transformacion.suma();
		
		arbol.porNiveles();
		
		
		ParcialArboles parcialArboles= new ParcialArboles(arbol);
		
		System.out.println(parcialArboles.isLeftTree(10));
		
		*/
		
		ParcialArboles2 pA2 = new ParcialArboles2();
		System.out.println( pA2.esPrefijo(arbol2, arbol));
	}

}
