package funix.nam.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import funix.nam.dao.AccountDao;
import funix.nam.model.Account;

//@WebServlet(urlPatterns = { "login" })
public class LoginAdminController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// dạng trả về là html, utf-8
		resp.setContentType("text/html; charset=UTF-8");
		req.setCharacterEncoding("utf-8");

		// xóa dữ liệu cũ trong session nếu đăng nhập thành công
		req.getSession().invalidate();
		HttpSession session = req.getSession();
		// định dạng biểu thức chính quy cho email và password
		String regexMail = "^[a-zA-Z_]+[a-zA-Z0-9_]*@[a-zA-Z0-9]+[\\\\.a-zA-Z0-9]+$";
		String regexPass = "^[a-zA-Z0-9_!@#$%^&*]+$";

		// lấy dữ liệu từ form gửi về
		String emailForm = req.getParameter("emailForm");
		String passwordForm = req.getParameter("passwordForm");
		String checkRemember = req.getParameter("check-remember"); // "remember"
		String messageError = "";

		AccountDao accountDao = new AccountDao();
		Account account = accountDao.getByEmail(emailForm);
		if (account != null && account.getRole() == 0) {
			session.setAttribute("curCustomer", account);
			req.setAttribute("remember", checkRemember);
			req.getRequestDispatcher("login-customer").forward(req, resp);
			return;
		}

		// lấy dữ liệu trong web.xml
		String emailInit = getServletContext().getInitParameter("username");// nam@gmail.com
		String passwordInit = getServletContext().getInitParameter("password"); // 1234

		// vào trang đăng nhập lầ đầu email và pass đều null => trả về login.jsp
		if (emailForm == null && passwordForm == null) {
			messageError = "";
			req.setAttribute("error", messageError);
			resp.sendRedirect("login.jsp");
		}
		// nếu định dạng email hoặc password không đúng => chuyển tiếp về login.jsp
		else if (!emailForm.matches(regexMail) || !passwordForm.matches(regexPass)) {
			messageError = "Invalid syntax!! ";
			req.setAttribute("error", messageError);
			req.setAttribute("email", emailForm);
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		}
		// tài khoản hoặc mật khẩu đúng => trả về trang admin.jsp
		else if (emailForm != null && emailForm.equals(emailInit) && passwordForm.equals(passwordInit)) {
			// check xem người dùng có remember tài khoản không => dùng cookie để lưu
			if (checkRemember != null && checkRemember.equals("remember")) {
				Cookie createUserCookie = new Cookie("username", emailForm);
				createUserCookie.setMaxAge(1 * 60 * 60);
				resp.addCookie(createUserCookie);
			}

			session.setAttribute("user", emailForm);
			resp.sendRedirect("admin/index.jsp");
		}
		// các trường hợp còn lại là không đúng tài khoản hoặc mật khẩu => trả về trang
		// login.jsp
		else {
			messageError = "Thông tin tài khoản không chính xác!! ";
			req.setAttribute("email", emailForm);
			req.setAttribute("error", messageError);
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
