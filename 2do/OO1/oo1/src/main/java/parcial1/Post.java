package parcial1;

import java.util.ArrayList;
import java.util.List;

public class Post {
	private List<Publicacion> publicaciones;
	
	public Post() {
		this.publicaciones = new ArrayList<Publicacion>();
	}
	
	public List<Publicacion> getPublicaciones(){
		return this.publicaciones;
	}
	
	public void agregarPublicacion(Publicacion publicacion) {
		this.publicaciones.add(publicacion);
	}
}
