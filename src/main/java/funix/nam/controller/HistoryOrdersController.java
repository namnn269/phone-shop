package funix.nam.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import funix.nam.dao.HistoryDetailOrderDao;
import funix.nam.model.Account;
import funix.nam.model.HistoryDetailOrderDTO;

@WebServlet(urlPatterns = { "/history" })
public class HistoryOrdersController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		Account account = (Account) session.getAttribute("curCustomer");
		HistoryDetailOrderDao detailOrderDao = new HistoryDetailOrderDao();
		List<HistoryDetailOrderDTO> listDetailOrderDTO = detailOrderDao.getHistoryOder(account.getUserMail());
		for (HistoryDetailOrderDTO hdod : listDetailOrderDTO) {
			System.out.println(hdod.getImgSource());
		}
		session.setAttribute("historyOrders", listDetailOrderDTO);
		resp.sendRedirect("history.jsp");
	}
}
