package parcial1;

import java.util.ArrayList;
import java.util.List;

public class Debate {
	private List<Usuario> usuarios;
	private Post post;
	
	public Debate() {
		this.usuarios = new ArrayList<Usuario>();
		this.post = new Post();
	}
	
	public Usuario registrarUsuario(String nombre, String contrasenia) {
		Usuario usuario = new Usuario(nombre, contrasenia);
		this.usuarios.add(usuario);
		return usuario;
	}
	
	public Publicacion agregarPublicacion(String titulo, String contenido, Usuario usuario){
		Publicacion publicacion = new PublicacionInicial(titulo, contenido, usuario);
		this.post.agregarPublicacion(publicacion);
		return publicacion;
	}
	
	public Publicacion agregarRespuesta(String contenido, Publicacion publicacion, Usuario usuario) {
		Publicacion p1 = new Publicacion(contenido, usuario);
		publicacion.responder(p1);
		this.post.agregarPublicacion(p1);
		return p1;
	}
	
	public Post getPost() {
		return this.post;
	}
}
