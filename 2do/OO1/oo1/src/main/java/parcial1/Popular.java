package parcial1;

import java.util.List;
import java.util.stream.Collectors;

public class Popular extends Recomendador{
	
	public Popular(Post post) {
		super(post);
	}
	
	public List<Publicacion> recomendar(List<Usuario> seguidos){
		return this.getPost().getPublicaciones().stream().sorted((p2, p1)-> p1.getLikes().compareTo(p2.getLikes())).collect(Collectors.toList());
	}
}
