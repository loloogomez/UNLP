package encomiendas;

import java.time.LocalDate;
import java.util.List;

public class PaqueteMini extends Envio{
	
	public PaqueteMini(String destino, List<Producto> productos) {
		super(destino, 750, productos);
    }
	
	//test
	public PaqueteMini(LocalDate fecha, String destino, List<Producto> productos) {
        super(fecha, destino, 750, productos);
    }
	
	public double getVolumenTotal() {
		return 1300;
	}
	
	public boolean validar() {
		return (getPesoTotal() <= 1200 && getVolumenTotal() <= 1300);
	}
	
}
