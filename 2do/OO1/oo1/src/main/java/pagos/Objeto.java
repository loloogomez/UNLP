package pagos;

import java.util.List;

public class Objeto {
	private List<Pago> pagos;
	
	public Objeto(List<Pago> pagos) {
		this.pagos = pagos;
	}
	
	public double valorLiquido() {
		return this.pagos.stream().mapToDouble(p -> p.valorLiquido()).sum();
	}
	
}
