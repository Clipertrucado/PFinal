<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "https://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Mi Primer Formulario</title>

<link rel="stylesheet" href="common/general.css">

<script type="text/javascript">
	function compruebayenvia() {
		datos = document.datosUser;
		if (datos.nombre.value == '' || datos.email.value == ''|| datos.contrasenya.value == ''|| datos.telefono.value == ''|| datos.direccion.value == '')
			alert('¡Tiene que rellenar todos los campos!');
		else
			datos.submit();

	}
</script>
</head>
<body>

	<h1>Nuevo usuario en la App</h1>
	<form action="./NewUser" method="post" name="datosUser" id="datosUser">
		<table style="text-align: left; border: none;">
			<tr>
				<td><input type="hidden" name="varoculta" value="secreto" />
					Nombre y Apellidos:</td>
				<td><input type="text" name="nombre" value="" class="inputgris" /></td>
			</tr>
			<tr>
				<td>Email usuario:</td>
				<td><input type="text" name="email" value="" class="inputgris" /></td>
			</tr>
			<tr>
				<td><input type="hidden" name="varoculta" value="secreto" />
					Contraseña:</td>
				<td><input type="text" name="contrasenya" value="" class="inputgris" /></td>
			</tr>
			<tr>
				<td>Numero telefono:</td>
				<td><input type="tel" name="telefono" maxlength="9"
					minlength="9" value="" class="inputgris" /></td>
			</tr>

			<tr>
				<td>Direccion:</td>
				<td><input type="text" name="direccion" value=""
					class="inputgris" /></td>
			</tr>
			<tr>
				<td></td>
				<td style="text-align: right;"><input type="button" name="send"
					value="Enviar" onclick="compruebayenvia();" /></td>
			</tr>
		</table>
	</form>

</body>
</html>