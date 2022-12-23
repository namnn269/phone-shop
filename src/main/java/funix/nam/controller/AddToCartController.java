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
import funix.nam.model.Product;

@WebServlet(urlPatterns = { "/cart-controller" })
public class AddToCartController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("productId");
		String quantityStr = req.getParameter("quantity");
		int quantity = Integer.parseInt(quantityStr);

		ProductDao productDao = new ProductDao();
		Product newProduct = productDao.getById(id);
		Cart cart = null;
		Cart tempCart = null;

		HttpSession session = req.getSession();
		cart = (Cart) session.getAttribute("curCart");
		tempCart = (Cart) session.getAttribute("tempCart");

		if (cart == null)
			cart = new Cart(1);

		if (tempCart == null)
			tempCart = new Cart(1);

		cart.addToCart(newProduct, quantity);

		session.setAttribute("tempCart", tempCart);
		session.setAttribute("curCart", cart);
		session.setAttribute("totalMoney", cart.getTotalMoney());
		resp.sendRedirect("list-product");
	}

}
