package funix.nam.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import funix.nam.dao.ProductDao;
import funix.nam.model.Product;

@WebServlet("/deltail-controller")
public class DeltailController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeltailController() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String productIdStr= request.getParameter("productId");
		ProductDao productDao= new ProductDao();
		Product product= productDao.getById(productIdStr);
		
		request.setAttribute("detailProduct", product);
		request.getRequestDispatcher("detail.jsp").forward(request, response);
	}
}
