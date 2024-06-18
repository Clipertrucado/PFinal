package mipk;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import org.apache.jasper.tagplugins.jstl.core.Out;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginAuthenticator
 */
public class NewUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NewUser() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("./index.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		beanDB db = new beanDB();
		String nombre = request.getParameter("nombre");
		String email = request.getParameter("email");
		String contrasenya = request.getParameter("contrasenya");
		String telefono = request.getParameter("telefono");
		String direccion = request.getParameter("direccion");

		// Corregir la consulta SQL
		String insert = "INSERT INTO Usuarios (nombre_Usuario, contrasenya_Usuario, numero_Usuario, email_Usuario, direccion_Usuario) VALUES "
				+ "('" + nombre + "', '" + contrasenya + "', '" + telefono + "', '" + email + "', '" + direccion
				+ "');";
		String query = "SELECT email_Usuario FROM Usuarios;";
		String[][] tablares = null;

		boolean okdb = false;
		boolean ok = false;

		try {
			db.conectarBD();
			okdb = true;
		} catch (Exception e) {
			okdb = false;
		}
		if (okdb) {
			try {
				tablares = db.resConsultaSelectA3(query);
			} catch (SQLException e) {
				e.printStackTrace();
			}

			if (tablares != null) {
				for (int i = 0; i < tablares.length; i++) {
					if (tablares[i][0].equals(email)) {
						ok = true;
						break;
					}
				}
			}

			if (!ok) {
				
					db.insert(insert);
			}

			db.desconectarBD();
		}

		if (ok) {
			response.sendRedirect("NewUser.jsp");
		} else {
			response.sendRedirect("index.jsp");
		}
	}
}