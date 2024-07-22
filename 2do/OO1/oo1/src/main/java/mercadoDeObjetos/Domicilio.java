package mercadoDeObjetos;

public class Domicilio implements Envio{
	private Mapa mapa;
	
	public Domicilio() {
		mapa = new Mapa();
	}
	
	public double calcularPrecio(String direc1, String direc2) {
		return mapa.distanciaEntre(direc1, direc2) * 0.5;
	}
}
