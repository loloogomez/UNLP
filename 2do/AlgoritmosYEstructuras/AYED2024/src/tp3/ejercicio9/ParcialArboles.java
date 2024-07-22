package tp3.ejercicio9;

import java.util.List;

import tp3.ejercicio1.GeneralTree;

public class ParcialArboles {
	public static boolean esDeSeleccion(GeneralTree<Integer> arbol) {
		if (!arbol.isEmpty()) {
			if (arbol.hasChildren()) {
				List<GeneralTree<Integer>> hijos = arbol.getChildren();
				
				if (menorHijo(hijos) != arbol.getData()) {
					return false;
				}
				
				for (GeneralTree<Integer> hijo: hijos) {
					if (esDeSeleccion(hijo) == false) {
						return false;
					}
				}
			}
		}
		return true;
	}
	
	public static int menorHijo(List<GeneralTree<Integer>> hijos) {
		int min = hijos.get(0).getData();
		for(GeneralTree<Integer> hijo: hijos) {
			if (hijo.getData() < min) {
				min = hijo.getData();
			}
		}
		return min;
	}
}
