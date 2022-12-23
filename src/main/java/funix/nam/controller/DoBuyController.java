package funix.nam.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import funix.nam.dao.AccountDao;
import funix.nam.dao.DetailOrderDao;
import funix.nam.dao.OrderDao;
import funix.nam.model.Account;
import funix.nam.model.Cart;
import funix.nam.model.DetailOrder;
import funix.nam.model.Order;

@WebServlet("/do-buy")
public class DoBuyController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DoBuyController() {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AccountDao accountDao = new AccountDao();
		OrderDao orderDao = new OrderDao();
		DetailOrderDao detailOrderDao = new DetailOrderDao();
		HttpSession session = request.getSession();

		String address = request.getParameter("address");
		String fullname = request.getParameter("fullname");
		String phoneNumber = request.getParameter("phonenumber");
		String email = request.getParameter("email");
		String register = request.getParameter("register");

		Cart cart = (Cart) session.getAttribute("curCart");

		Account accSearch = accountDao.getByEmail(email);
		Account account = new Account();
		if (accSearch == null) {
			account.setAddress(address);
			account.setName(fullname);
			account.setPhone(phoneNumber);
			account.setUserMail(email);
			account.setRegistered(register.equals("yes"));
			accountDao.insert(account);
		} else {
			account = accSearch;
		}

		Order order = new Order();
		order.setAccount(account);
		order.setOrderStatus(true);
		order.setAddress(address);
		int idOrder = orderDao.insertOrder(order);

		List<DetailOrder> orderCur = cart.getListItem();
		for (DetailOrder detailOrder : orderCur) {
			detailOrder.setOrderId(idOrder);
			detailOrderDao.insert(detailOrder);
		}
		session.setAttribute("curCart", null);
		response.sendRedirect("successBuy.jsp");
	}

}
