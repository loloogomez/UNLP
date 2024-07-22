package encomiendas;

import java.time.LocalDate;
import java.util.List;

public class PaqueteNormal extends Envio{
	
	public PaqueteNormal(String destino, List<Producto> productos) {
        super(destino, 1800, productos);
    }
	
	public PaqueteNormal(LocalDate fecha, String destino, List<Producto> productos) {
        super(fecha, destino, 1800, productos);
    }
	
	public double getVolumenTotal() {
		return 10000;
	}
	
	public boolean validar() {
		return (getPesoTotal() <= 5000 && getVolumenTotal() <= 10000);
	}
}
