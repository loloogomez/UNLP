package parcial1;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class Usuario {
	private String nombre;
	private String contrasenia;
	private List<Usuario> seguidos;
	private LocalDate fechaRegistro;
	private Recomendador recomendador;
	
	public Usuario (String nombre, String contrasenia) {
		this.nombre = nombre;
		this.contrasenia = contrasenia;
		this.seguidos = new ArrayList<Usuario>();
		this.fechaRegistro = LocalDate.now();
	}
	
	public void setRecomendador(Recomendador recomendador) {
		this.recomendador = recomendador;
	}
	
	public void like(Publicacion publicacion) {
		publicacion.like();
	}
	
	public void dislike(Publicacion publicacion) {
		publicacion.dislike();
	}
	
	public void seguir(Usuario usuario) {
		this.seguidos.add(usuario);
	}
	
	public List<Publicacion> getFeed(){
		return this.recomendador.recomendar(this.seguidos);
	}
}
