<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, java.util.Set,modelo.Libro,java.util.HashMap"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Mi primer Carrito</title>
</head>
<body>
	<fieldset>
		<legend> Seleccione Libro</legend>
		<form action="" method="post">
			Libro: <input type="hidden" name="operacion" value="add" /> <select
				name="libro">
				<%
					ArrayList<Libro> stock = (ArrayList<Libro>) application.getAttribute("stock");
					for (Libro libro : stock) {
						out.println("<option value='" + libro.getTitulo() + "#" + libro.getPrecio() + "'>" + libro.getTitulo()
								+ " </option>");
					}
				%>
			</select> <input type="text" name="cantidad" size="2" value="1" /> <input
				type="submit" value="Al carro" />
		</form>

	</fieldset>


	<!-- <tr>
		<FORM ACTION="Carrito" METHOD="POST">			
				<td><INPUT TYPE="text" name="titulo" value="libro1" /></td>
				<td><INPUT TYPE="text" name="precio" value="??????" /></td>
				<td><INPUT TYPE="text" name="cantidad" value="??????" /></td>
				<td><INPUT TYPE="SUBMIT"  VALUE="Eliminar" /></td>
		</FORM>
		</tr>
		<tr>
		<FORM ACTION="Carrito" METHOD="POST">			
				<td><INPUT TYPE="text" name="titulo" value="libro2" /></td>
				<td><INPUT TYPE="text" name="precio" value="??????" /></td>
				<td><INPUT TYPE="text" name="cantidad" value="??????" /></td>
				<td><INPUT TYPE="SUBMIT"  VALUE="Eliminar" /></td>
		</FORM>
		</tr> -->

	<%
		HashMap<String, Libro> carrito = (HashMap<String, Libro>) session.getAttribute("carrito");
		if (carrito != null && carrito.size() > 0) {
			Set<String> claves = carrito.keySet();
	%>
	<TABLE BORDER="1">
		<TR>
			<TH>TITULO</TH>
			<TH>PRECIO</TH>
			<TH>CANTIDAD</TH>
		</TR>
		<%
			for (String clave : claves) {
		%>
		<TR>
			<FORM ACTION="Carrito" METHOD="POST">
				<td><INPUT TYPE="text" name="titulo"
					value="<%=carrito.get(clave).getTitulo()%>" /><input type="hidden"
					name="operacion" value="remove" /></td>
				<td><INPUT TYPE="text" name="precio"
					value="
				     <%=carrito.get(clave).getPrecio()%>
				" /></td>
				<td><INPUT TYPE="text" name="cantidad"
					value="
				<%=carrito.get(clave).getCantidad()%>
				" /></td>
				<td><INPUT TYPE="SUBMIT" VALUE="Eliminar" /></td>
			</FORM>
		</tr>
		<%
			}
		%>
	</TABLE>
	<%
		}
	%>
	<form action="Carrito" method="post">
		<input type="hidden" name="operacion" value="check" /> 
		<input type="submit" value="Facturar" />
	</form>
	<%-- <a href="Carrito"><input type="button" name="operacion </a>
 --%>
	<!-- <input type="button" onclick="javascript:location('Carrito')" value="Facturar"/>
 -->
</body>
</html>