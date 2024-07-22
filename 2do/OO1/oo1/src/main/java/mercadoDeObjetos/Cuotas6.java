package mercadoDeObjetos;

public class Cuotas6 implements MetodoPago{
	public double calcularPrecio(double precio) {
		return precio + precio*0.2;
	}
}
