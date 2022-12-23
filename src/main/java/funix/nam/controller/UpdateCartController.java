package funix.nam.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import funix.nam.dao.ProductDao;
import funix.nam.model.Cart;

@WebServlet("/update-cart")
public class UpdateCartController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateCartController() {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String[] idsUpdate = request.getParameterValues("id");
		String[] quantitysUpdate = request.getParameterValues("quantity");

		HttpSession session = request.getSession();
		ProductDao dao = new ProductDao();
		Cart cart = new Cart(1);
		for (int i = 0; i < quantitysUpdate.length; i++) {
			cart.addToCart(dao.getById(idsUpdate[i]), Integer.parseInt(quantitysUpdate[i]));
		}
		
		session.setAttribute("totalMoney", cart.getTotalMoney());
		session.setAttribute("curCart", cart);
		response.sendRedirect("cart.jsp");
	}
}




