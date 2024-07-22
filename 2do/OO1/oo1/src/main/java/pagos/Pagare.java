package pagos;

import java.sql.Date;
import java.time.LocalDate;

public class Pagare extends Pago{
	private LocalDate fechaVencimiento;
	
	public Pagare (String o, String d, LocalDate fE, float monto, LocalDate fV) {
		super(o, d, fE, monto);
		this.fechaVencimiento = fV;
	}
	
	public boolean estaVencido() {
		return (LocalDate.now().isAfter(this.fechaVencimiento) || LocalDate.now().isEqual(this.fechaVencimiento));
	}
	
	public float valorLiquido() {
		if (this.estaVencido()) {
			return this.getMonto();
		}else {
			return 0;
		}
	}
}
