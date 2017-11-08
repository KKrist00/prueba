package controlador;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.Libro;

/**
 * Servlet implementation class Carrito
 */
// @WebServlet("/Carrito")
public class Carrito extends HttpServlet {

	private HashMap<String, Libro> carrito;

	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		// System.out.println("init -> contexto: "
		// +config.getServletContext().getInitParameter("ctxtNIF"));
		// System.out.println("init -> servlet : "
		// +this.getInitParameter("svltNIF"));
		ServletContext contexto = config.getServletContext();

		String[] libros = { "El Quijote de La Mancha#18.13", "Un espia en Nueva York#20.35",
				"La casa de Bernarda Alba#15.56", "Los pilares de la tierra#30.5" };

		ArrayList<Libro> stock = new ArrayList<Libro>();
		for (String libro : libros) {
			String titulo = libro.split("#")[0];
			float precio = Float.parseFloat(libro.split("#")[1]);
			Libro objLibro = new Libro(titulo, precio, 0);
			stock.add(objLibro);
		}
		contexto.setAttribute("stock", stock);

	}

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Carrito() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		/*
		 * response.getWriter().append("Served at: "
		 * ).append(request.getContextPath()); System.out .println(
		 * "svlt -> contexto : " +
		 * request.getSession().getServletContext().getInitParameter("ctxtNIF"))
		 * ;
		 * 
		 * System.out.println("svlt -> svlt : " +
		 * this.getInitParameter("svltNIF"));
		 * 
		 * System.out.println("Esperando clientes ...");
		 */
		HttpSession sesion = request.getSession(true);
		carrito = (HashMap<String, Libro>) sesion.getAttribute("carrito");

		if (carrito == null) // Primera vez
		{
			carrito = new HashMap<String, Libro>();

		}
		String oper = request.getParameter("operacion");
		String ruta = "jsp/Carrito.jsp";
		if (oper != null) { // Primera vez ..
			switch (oper) {
			case "add":

				addItem(request);
				break;
			case "remove":

				removeItem(request);
				break;
			case "check":
				ruta = "jsp/Checkout.jsp";
				check();
				break;
			default:
				ruta = "jsp/Carrito.jsp";
			}
		}
		sesion.setAttribute("carrito", carrito); // guardar el carrito
													// modificado en sesión
		RequestDispatcher dispatcher = request.getRequestDispatcher(ruta);
		dispatcher.forward(request, response);
		// System.out.println("Esto se ejecuta ...");
	}

	private void check() {
		// TODO Auto-generated method stub

	}

	private void removeItem(HttpServletRequest request) {
		String titulo = request.getParameter("titulo");
		carrito.remove(titulo);
	}

	private void addItem(HttpServletRequest request) {
		String libro = request.getParameter("libro");
		String titulo = libro.split("#")[0];
		float precio = Float.parseFloat(libro.split("#")[1]);
		try {
			int cantidad = Integer.parseInt(request.getParameter("cantidad"));
			if (cantidad > 0) {
				if (carrito.containsKey(titulo)) { // ya existe en carro el
													// libro
					Libro item = carrito.get(titulo);
					item.setCantidad(item.getCantidad() + cantidad);
				} else {
					Libro objLibro = new Libro(titulo, precio, cantidad);
					carrito.put(titulo, objLibro);
				}
			}
		} catch (NumberFormatException e) {

		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
