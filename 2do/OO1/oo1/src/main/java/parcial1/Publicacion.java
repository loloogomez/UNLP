package parcial1;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class Publicacion {
	private String contenido;
	private Usuario usuario;
	private int likes;
	private int dislikes;
	private List<Publicacion> respuestas;
	private LocalDate fechaPublicacion;
	
	public Publicacion(String contenido, Usuario usuario) {
		this.contenido = contenido;
		this.usuario = usuario;
		this.likes = 0;
		this.dislikes = 0;
		this.respuestas = new ArrayList<Publicacion>();
		this.fechaPublicacion = LocalDate.now();
	}
	
	public Usuario getUsuario() {
		return this.usuario;
	}
	
	public Integer getLikes() {
		return this.likes;
	}
	
	public Integer getDislikes() {
		return this.dislikes;
	}
	
	public void like() {
		this.likes ++;
	}
	
	public void dislike() {
		this.dislikes ++;
	}
	
	public LocalDate getFechaPublicacion() {
		return this.fechaPublicacion;
	}
	
	public void responder(Publicacion respuesta) {
		this.respuestas.add(respuesta);
	}
	
	public void setFecha(LocalDate fecha) {
		this.fechaPublicacion = fecha;
	}
	
	public List<Publicacion> getRespuestas(){
		return this.respuestas;
	}
}	
