package tp3.ejercicio2;

import java.util.ArrayList;
import java.util.List;
import java.util.Queue;

import tp2.ejercicio1.ColaGenerica;
import tp3.ejercicio1.GeneralTree;

public class RecorridosAG {
	
	public List<Integer> numerosImparesMayoresQuePreOrden(GeneralTree<Integer> a, Integer n){
		List<Integer> lista = new ArrayList<Integer>();
		if (!a.isEmpty()) {
			if (a.getData() > n && a.getData()%2 == 1) {
				lista.add(a.getData());
			}
			if (a.hasChildren()) {
				List<GeneralTree<Integer>> hijos = a.getChildren();
				for (GeneralTree<Integer> hijo: hijos) {
					lista.addAll(numerosImparesMayoresQuePreOrden(hijo, n));
				}
			}
		}
		return lista;
	}
	
	public List<Integer> numerosImparesMayoresQueInOrden(GeneralTree<Integer> a, Integer n){
		List<Integer> lista = new ArrayList<Integer>();
		if (!a.isEmpty()) {
			if (a.hasChildren()) {
				List<GeneralTree<Integer>> hijos = a.getChildren();
				lista.addAll(numerosImparesMayoresQueInOrden(hijos.remove(0), n));
				if (a.getData() > n && a.getData()%2 == 1) {
					lista.add(a.getData());
				}
				while (!hijos.isEmpty()) {
					lista.addAll(numerosImparesMayoresQueInOrden(hijos.remove(0), n));
				}
			}else {
				if (a.getData() > n && a.getData()%2 == 1) {
					lista.add(a.getData());
				}
			}
		}
		return lista;
	}
	
	public List<Integer> numerosImparesMayoresQuePostOrden(GeneralTree<Integer> a, Integer n){
		List<Integer> lista = new ArrayList<Integer>();
		if (!a.isEmpty()) {
			if (a.hasChildren()) {
				List<GeneralTree<Integer>> hijos = a.getChildren();
				for (GeneralTree<Integer> hijo: hijos) {
					lista.addAll(numerosImparesMayoresQuePreOrden(hijo, n));
				}
			}
			if (a.getData() > n && a.getData()%2 == 1) {
				lista.add(a.getData());
			}
		}
		return lista;
	}
	
	public List<Integer> numerosImparesMayoresQuePorNivel(GeneralTree<Integer> a, Integer n){
		List<Integer> lista = new ArrayList<Integer>();
		GeneralTree<Integer> aux;
		ColaGenerica<GeneralTree<Integer>> cola = new ColaGenerica<GeneralTree<Integer>>();
		cola.encolar(a);
		while (!cola.esVacia()) {
			aux = cola.desencolar();
			if (!aux.isEmpty()) {
				if (aux.getData() > n && aux.getData()%2 == 1) {
					lista.add(aux.getData());
				}
				if (aux.hasChildren()) {
					List<GeneralTree<Integer>> hijos = aux.getChildren();
					for(GeneralTree<Integer> hijo: hijos) {
						cola.encolar(hijo);
					}
				}
			}
		}
		return lista;
	}
	
}
