package funix.nam.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LogoutController() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// khi đăng xuất thì hủy session chứa thông tin user hiện tại
		HttpSession session = request.getSession();
		System.out.println("logout");
		String action = (String) request.getParameter("action");
		if (action.equals("logout")) {
			session.invalidate();
			response.sendRedirect("login.jsp");
		} else {
			response.sendRedirect("home.jsp");
		}
//		response.sendRedirect("home.jsp");
	}

}
