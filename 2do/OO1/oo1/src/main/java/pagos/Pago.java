package pagos;

import java.sql.Date;
import java.time.LocalDate;

public abstract class Pago {
	private String originante;
	private String destinatario;
	private LocalDate fechaEmision;
	private float monto;
	
	public Pago (String o, String d, LocalDate fE, float monto) {
		this.originante = o;
		this.destinatario = d;
		this.fechaEmision = fE;
		this.monto = monto;
	}
	
	public abstract boolean estaVencido();
	
	public LocalDate getFechaEmision() {
		return this.fechaEmision;
	}
	
	public float getMonto() {
		return this.monto;
	}
	
	public abstract float valorLiquido();
}
