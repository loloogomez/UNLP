package ejDia_27_03;

import java.time.LocalDate;

public class PruebaInversor {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Inversor inversor = new Inversor("juan");
		Inversion inversion1 = new Accion("Coca-Cola", 10, 5);
		Inversion inversion2 = new Accion("Apple", 50, 10);
		Inversion inversion3 = new PlazoFijo(LocalDate.of(2024, 03, 01), 100, 0.1);
		
		inversor.agregarInversion(inversion1); //$50
		inversor.agregarInversion(inversion2); //$500
		inversor.agregarInversion(inversion3); //3% mensual
		
		System.out.println("valor de inversion1: " + inversor.valorActual(inversion1));
		System.out.println("valor de inversion2: " + inversor.valorActual(inversion2));
		System.out.println("valor de inversion3: " + inversor.valorActual(inversion3));
		
		System.out.println("valor de inversiones " + inversor.valorActual());
	}

}
