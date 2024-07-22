package tp3.ejercicio1;

import java.util.List;

import tp3.ejercicio2.RecorridosAG;
import tp3.ejercicio6.RedAguaPotable;
import tp3.ejercicio7.Caminos;

public class PruebaGeneralTree {

	public static void main(String[] args) {
		//nivel 0
		GeneralTree<Integer> arbol = new GeneralTree<Integer>(10);
		
		//nivel 1 
		GeneralTree<Integer> a1 = new GeneralTree<Integer>(1);
		GeneralTree<Integer> b1 = new GeneralTree<Integer>(20);
		GeneralTree<Integer> c1 = new GeneralTree<Integer>(30);
		
		arbol.addChild(a1);
		arbol.addChild(b1);
		arbol.addChild(c1);
		
		//nivel 2
		GeneralTree<Integer> a2 = new GeneralTree<Integer>(21);
		GeneralTree<Integer> b2 = new GeneralTree<Integer>(25);
		GeneralTree<Integer> c2 = new GeneralTree<Integer>(35);
		
		b1.addChild(a2);
		b1.addChild(b2);
		c1.addChild(c2);
		
		/*
		RecorridosAG recorridos = new RecorridosAG();

		System.out.println(recorridos.numerosImparesMayoresQuePreOrden(arbol, 21).toString());
		System.out.println(recorridos.numerosImparesMayoresQueInOrden(arbol, 21).toString());
		System.out.println(recorridos.numerosImparesMayoresQuePostOrden(arbol, 21).toString());
		System.out.println(recorridos.numerosImparesMayoresQuePorNivel(arbol, 21).toString());
		

		System.out.println(arbol.altura());
		
		
		System.out.println(arbol.nivel(35));
		
		System.out.println(arbol.ancho());
		
		
		RedAguaPotable redAgua = new RedAguaPotable(arbol);
		System.out.println(redAgua.minimoCaudal(999));
		
		
		
		Caminos caminos = new Caminos(arbol);
		System.out.println(caminos.caminoAHojaMasLejana().toString());
		
		*/
		
	}

}
