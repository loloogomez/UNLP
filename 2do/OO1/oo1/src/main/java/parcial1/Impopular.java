package parcial1;

import java.util.List;
import java.util.stream.Collectors;

public class Impopular extends Recomendador{
	
	public Impopular (Post post) {
		super(post);
	}
	
	public List<Publicacion> recomendar(List<Usuario> seguidos){
		return this.getPost().getPublicaciones().stream().sorted((p2, p1)-> p1.getDislikes().compareTo(p2.getDislikes())).collect(Collectors.toList());
	}
}
