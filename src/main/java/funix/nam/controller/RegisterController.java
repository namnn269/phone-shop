package funix.nam.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import funix.nam.dao.AccountDao;
import funix.nam.model.Account;

@WebServlet(urlPatterns = { "/register" })
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String fullnameRegister = req.getParameter("fullnameregister");
		String phoneRegister = req.getParameter("phoneregister");
		String addressRegister = req.getParameter("addressregister");
		String emailRegister = req.getParameter("emailregister");
		String passwordRegister = req.getParameter("passwordregister");
		String passwordRegister2 = req.getParameter("passwordregister2");
		String register = req.getParameter("register");
		Account newAccount = new Account();

		AccountDao accountDao = new AccountDao();
		Account account = accountDao.getByEmail(emailRegister);
		if (account != null && account.isRegistered()) {
			req.setAttribute("registererror", "Email đã tồn tại!");
			req.setAttribute("fullnameregister", fullnameRegister);
			req.setAttribute("emailregister", emailRegister);
			req.setAttribute("phoneregister", phoneRegister);
			req.setAttribute("addressregister", addressRegister);
			req.getRequestDispatcher("register.jsp").forward(req, resp);
			return;
		} else if (account != null && !account.isRegistered()) {
			newAccount.setUserMail(emailRegister);
			newAccount.setName(fullnameRegister);
			newAccount.setPassword(passwordRegister);
			newAccount.setPhone(phoneRegister);
			newAccount.setAddress(addressRegister);
			newAccount.setRegistered(register.equals("yes"));
			accountDao.update(newAccount);
		} else if (!passwordRegister.equals(passwordRegister2)) {
			req.setAttribute("registererror", "Mật khẩu không khớp!");
			req.setAttribute("phoneregister", phoneRegister);
			req.setAttribute("addressregister", addressRegister);
			req.setAttribute("fullnameregister", fullnameRegister);
			req.setAttribute("emailregister", emailRegister);
			req.getRequestDispatcher("register.jsp").forward(req, resp);
			return;
		} else {
			newAccount.setUserMail(emailRegister);
			newAccount.setName(fullnameRegister);
			newAccount.setPassword(passwordRegister);
			newAccount.setPhone(phoneRegister);
			newAccount.setAddress(addressRegister);
			newAccount.setRegistered(register.equals("yes"));
			accountDao.insert(newAccount);
		}

		req.getRequestDispatcher("successRegister.jsp").forward(req, resp);

	}
}
