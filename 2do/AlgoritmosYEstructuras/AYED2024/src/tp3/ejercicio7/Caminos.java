package tp3.ejercicio7;

import java.util.ArrayList;
import java.util.List;

import tp3.ejercicio1.GeneralTree;

public class Caminos {
	private GeneralTree<Integer> arbol;
	
	public Caminos(GeneralTree<Integer> arbol) {
		this.arbol = arbol;
	}
	
	public List<Integer> caminoAHojaMasLejana(){
		return caminoMasLargo(arbol);
	}
	
	public ArrayList<Integer> caminoMasLargo(GeneralTree<Integer> a){
		ArrayList<Integer> lista = new ArrayList<Integer>();
		if (!a.isEmpty()) {
			//se agrega a si mismo
			lista.add(a.getData());
	
			if (a.hasChildren()) {
				//lisita con recorrido mas largo de sus hijos
				
				ArrayList<Integer> max = new ArrayList<Integer>();
				List<GeneralTree<Integer>> hijos = a.getChildren();
				
				for (GeneralTree<Integer> hijo: hijos) {
					if (caminoMasLargo(hijo).size() > max.size()) {
						max = caminoMasLargo(hijo);
					}
				}
				lista.addAll(max);
			}
		}
		return lista;
	}
}
