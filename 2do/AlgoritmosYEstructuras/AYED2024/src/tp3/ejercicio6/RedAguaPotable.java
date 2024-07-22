package tp3.ejercicio6;

import java.util.List;

import tp3.ejercicio1.GeneralTree;

public class RedAguaPotable {
	//lo hago de integer solo para probarlo en una clase donde ya tengo hecho un GeneralTree<Integer>
	private GeneralTree<Integer> red;
	
	public RedAguaPotable(GeneralTree<Integer> red) {
		this.red = red;
	}
	
	public double minimoCaudal(double caudal) {
		return minimoCaudal(this.red, caudal);
	}
	
	public double minimoCaudal(GeneralTree<Integer> red, double caudal) {
		double minimo = caudal;
		if (!red.isEmpty()) {
			if (red.hasChildren()) {
				List<GeneralTree<Integer>> hijos = red.getChildren();
				double aux;
				for (GeneralTree<Integer> hijo: hijos) {
					aux = minimoCaudal(hijo, caudal/hijos.size());
					if ( aux < minimo){
						minimo = aux;
					}
				}
			}
		}
		return minimo;
	}
}
