package encomiendas;

import java.time.LocalDate;
import java.util.List;

public class PaqueteMax extends Envio{
	public PaqueteMax(String destino, List<Producto> productos) {
        super(destino, 3000, productos);
    }
	
	public PaqueteMax(LocalDate fecha, String destino, List<Producto> productos) {
        super(fecha, destino, 3000, productos);
    }
	
	public double getVolumenTotal() {
		return 25000;
	}
	public boolean validar() {
		return (getPesoTotal() <= 15000 && getVolumenTotal() <= 25000);
	}
}
