package parcial1Test;

import static org.junit.jupiter.api.Assertions.assertEquals; 
import static org.junit.jupiter.api.Assertions.assertFalse;

import java.time.LocalDate;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import parcial1.*;

public class SocialTest {
	
	Debate debate = new Debate();
	
	Usuario usr1;
	Usuario usr2;
	Usuario usr3;
	
	Publicacion p1;
	Publicacion p2;
	Publicacion p3;
	
	Publicacion r1;
	
	Social social = new Social(debate.getPost());
	
	@BeforeEach
	public void setUp() {
		
		usr1 = debate.registrarUsuario("1", "1");
		usr2 = debate.registrarUsuario("2", "2");
		usr3 = debate.registrarUsuario("3", "3");
		
		usr3.setRecomendador(social);
		usr3.seguir(usr1);
		
		p1 = debate.agregarPublicacion("p1", "p1", usr1);
		p2 = debate.agregarPublicacion("p2", "p2", usr2);
		p3 = debate.agregarPublicacion("p3", "p3", usr1);
		
		p3.setFecha(LocalDate.of(2025, 1, 1));
		
		r1 = debate.agregarRespuesta("r1", p1, usr3);
		
	}
	
	@Test
	public void respuestaTest(){
		assertEquals(r1, p1.getRespuestas().get(0));
	}
	
	@Test
	public void socialTest1() {	
		assertEquals(p3, usr3.getFeed().get(0));
	}
	
	
	@Test
	public void socialTest0() {	
		assertEquals(p1, usr3.getFeed().get(1));
	}
	
	@Test
	public void socialTest2() {	
		assertFalse(usr3.getFeed().contains(p2));
	}
}
