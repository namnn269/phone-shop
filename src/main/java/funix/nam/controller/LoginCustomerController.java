package funix.nam.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import funix.nam.model.Account;

@WebServlet(urlPatterns = { "/login-customer" })
public class LoginCustomerController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		String passwordForm = req.getParameter("passwordForm");
		String emailForm = req.getParameter("emailForm");
		String checkRemember = (String) req.getAttribute("remember");
		Account account = (Account) session.getAttribute("curCustomer");
		if (!account.isRegistered()) {
			req.setAttribute("email", emailForm);
			req.setAttribute("error", "Tài khoản không tồn tại !!!");
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		} else if (account.getPassword().equals(passwordForm)) {
			session.setAttribute("curCustomer", account);
			if (checkRemember != null && checkRemember.equals("remember")) {
				Cookie createUserCookie = new Cookie("username", emailForm);
				createUserCookie.setMaxAge(1 * 60 * 60);
				resp.addCookie(createUserCookie);
			}
			resp.sendRedirect("home.jsp");
		} else {
			req.setAttribute("email", emailForm);
			req.setAttribute("error", "Thông tin tài khoản mật khẩu không đúng!!!");
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		}
	}

}
