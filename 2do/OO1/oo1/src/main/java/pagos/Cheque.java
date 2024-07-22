package pagos;

import java.time.LocalDate;

public class Cheque extends Pago{

	public Cheque(String o, String d, LocalDate fE, float monto) {
		super(o, d, fE, monto);
	}
	
	public boolean estaVencido() {
		return (LocalDate.now().isAfter(this.getFechaEmision().plusDays(30)) || LocalDate.now().isEqual(this.getFechaEmision().plusDays(30))); 
	}
	
	public float valorLiquido() {
		if(this.estaVencido()) {
			return 0;
		}else {
			return this.getMonto();
		}
	}
}
