package parcial1;

public class PublicacionInicial extends Publicacion{
	private String titulo;
	
	public PublicacionInicial(String titulo, String contenido, Usuario usuario) {
		super(contenido, usuario);
		this.titulo = titulo;
	}
}
