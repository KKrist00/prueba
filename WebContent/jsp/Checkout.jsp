<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page
	import="java.util.ArrayList, java.util.Set,modelo.Libro,java.util.HashMap"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>FACTURACION</h1>
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
		float acumulado =0;
			for (String clave : claves) {
				float subtotal= carrito.get(clave).getPrecio() *carrito.get(clave).getCantidad();
		        acumulado += subtotal;
		%>
		<TR>
		<FORM ACTION="Carrito" METHOD="POST">
			<td><%=carrito.get(clave).getTitulo()%></td>
			<td> <%=carrito.get(clave).getPrecio()%></td>
			<td><%=carrito.get(clave).getCantidad()%></td>
			<td><%=subtotal %></td>
		</FORM>
		</tr>
		<%
			}
		%>
		<TR><td colspan="3"> IMPORTE TOTAL </td>
		<TD><%=acumulado %> </TD><TR>
	</TABLE>
	<%
		}
	session.invalidate();
	%>
	<A HREF="Carrito" > Nueva compra</A>
	
</body>
</html>