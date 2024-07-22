package pagosTest;

import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalDate;

import org.junit.jupiter.api.Test;

import pagos.Cheque;
import pagos.Pagare;

class TestPago {

	Pagare pagare;
	Cheque cheque;
	
	@Test
	public void pagareVencidoTest() {
		LocalDate fV = LocalDate.now();
		LocalDate fE = LocalDate.of(2024, 03, 18);
		
		pagare = new Pagare("originante", "destinatario", fE, 100, fV);
		
		assertTrue(pagare.estaVencido());
	}
	
	@Test
	public void pagareNoVencidoTest() {
		LocalDate fV = LocalDate.now().plusDays(1);
		LocalDate fE = LocalDate.of(2024, 03, 18);
		
		pagare = new Pagare("originante", "destinatario", fE, 100, fV);
		
		assertFalse(pagare.estaVencido());
	}
	
	@Test
	public void chequeVencidoTest() {
		LocalDate fE = LocalDate.now().minusDays(30);
		
		cheque = new Cheque("originante", "destinatario", fE, 100);
		
		assertTrue(cheque.estaVencido());
	}
	
	@Test
	public void chequeNoVencidoTest() {
		LocalDate fE = LocalDate.now().minusDays(29);
		
		cheque = new Cheque("originante", "destinatario", fE, 100);
		
		assertFalse(cheque.estaVencido());
	}
}
