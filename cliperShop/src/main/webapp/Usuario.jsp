<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="mipk.beanDB"%>
<%@page import="java.sql.SQLException"%>
<!DOCTYPE html>
<html>
<head>
<script src="assets/js/color-modes.js"></script>
<meta charset="utf-8">
<meta name="author" content="Sergio Alfonseca vallet">
<title>CLIPERTRUCADO</title>
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.3/examples/album/">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
<link href="assets/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="cliper.css" rel="stylesheet">
<meta charset="UTF-8">
<title>Usuarios</title>
<style>
/* Estilos para la tabla */
table {
	width: auto; /* Ancho automático */
	margin: 0 auto; /* Centrar la tabla en la página */
	border-collapse: collapse; /* Colapsar bordes de celdas */
	border: 2px solid black; /* Borde de la tabla */
}

th, td {
	border: 1px solid black; /* Borde de las celdas */
	padding: 10px; /* Relleno dentro de las celdas */
	text-align: center; /* Centrar el texto dentro de las celdas */
}
</style>
</head>
<body>
	<header data-bs-theme="dark">
		<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
			<div class="container-fluid">
				<a class="navbar-brand" href="#"> <img src="imgs/logo.png"
					height="50px" alt="Clipertrucado">
				</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
					aria-controls="navbarCollapse" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse justify-content-center"
					id="navbarCollapse">
					<ul class="navbar-nav mb-2 mb-md-0">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="index.html">Inicio</a></li>
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="catalogo.html">Catalogo</a></li>
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="Colaboraciones.html">Colaboraciones</a>
						</li>
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="carro.html">Carrito</a></li>
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="Usuario.jsp">Usuarios</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>

	<h2></h2>
<br>
<br>
<br>

	<table>
		<tr>
			<th>Id_Usuario</th>
			<th>Nombre_Usuario</th>
			<th>Contrasenya_Usuario</th>
			<th>Numero_Usuario</th>
			<th>Email_Usuario</th>
			<th>Direccion_Usuario</th>
			<th>Pedidos_Usuario</th>

			<%
			beanDB db = new beanDB();
			boolean okdb = false;
			String catalogo = " ";
			try {
				db.conectarBD();
				okdb = true;
			} catch (Exception e) {
				okdb = false;
				//e.printStackTrace();
			}
			if (okdb) {
				String query = "select * from Usuarios;";
				String[][] tablares = null;
				try {
					tablares = db.resConsultaSelectA3(query);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				if (tablares != null) {

					for (int i = 0; i < tablares.length; i++) { //g es una variable tipo grupo que va recorriendo la lista
				catalogo = "<tr><th>" + tablares[i][0] + "</th><th>" + tablares[i][1] + "</th><th>" + tablares[i][2]
						+ "</th><th> " + tablares[i][3] + "</th><th>" + tablares[i][4] + "</th><th>" + tablares[i][5]
						+ "</th></tr>";
				out.println(catalogo);

				// Imprimir el contenido HTML

					}

				}
				db.desconectarBD();
			} else {
				catalogo = "<div style='color: darkred; font-weight: bold;'>ERROR: No se pudo conectar con la BBDD</div>";
			}
			%>
		
	</table>

</body>
</html>