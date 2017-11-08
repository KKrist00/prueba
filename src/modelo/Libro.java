package modelo;

public class Libro {

	private String titulo;
	private float precio;
	private int cantidad;

	public Libro(String titulo, float precio, int cantidad) {
		super();
		this.titulo = titulo;
		this.precio = precio;
		this.cantidad = cantidad;
	}

	public int getCantidad() {
		return cantidad;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public float getPrecio() {
		return precio;
	}

	public void setPrecio(float precio) {
		this.precio = precio;
	}

}
