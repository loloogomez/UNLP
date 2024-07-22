package parcial1;

import java.util.List;

public abstract class Recomendador {
	private Post post;
	
	public Recomendador(Post post) {
		this.post = post;
	}
	
	public Post getPost() {
		return this.post;
	}
	
	public abstract List<Publicacion> recomendar(List<Usuario> seguidos);
}
