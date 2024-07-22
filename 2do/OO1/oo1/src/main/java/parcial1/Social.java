package parcial1;

import java.util.List;
import java.util.stream.Collectors;

public class Social extends Recomendador{
	public Social(Post post) {
		super(post);
	}
	
	public List<Publicacion> recomendar(List<Usuario> seguidos){
		return this.getPost().getPublicaciones().stream().filter(p ->{return seguidos.contains(p.getUsuario());}).sorted((p2, p1)-> p1.getFechaPublicacion().compareTo(p2.getFechaPublicacion())).collect(Collectors.toList());
	}
}
