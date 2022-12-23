package funix.nam.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import funix.nam.dao.ProductDao;
import funix.nam.model.Product;

@WebServlet(urlPatterns = { "/list-product" })
public class ListProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		@SuppressWarnings("unchecked")
		List<Product> searchList = (List<Product>) request.getAttribute("listSearch");
		String search = (String) request.getAttribute("search1");
		String iPage = request.getParameter("iPage");
		String keySearch = request.getParameter("searchForm");
		int productsPerPage = 5;
		ProductDao productDao = new ProductDao();

		if (iPage == null)
			iPage = "1";

		int indexPage = Integer.parseInt(iPage);
		int totalProductions = productDao.getTotalQuantity();
		int totalPage = totalProductions / productsPerPage;
		if (totalProductions / productsPerPage != 0)
			totalPage++;

		List<Product> listProduct = productDao.getByPage(indexPage, productsPerPage);

		if (search == null || search.equals("no1")) {
			request.setAttribute("search1", "no1");
		} else {
			listProduct = searchList;
			request.setAttribute("quantitySearch", listProduct.size());
			request.setAttribute("search1", "yes1");
		}

		request.setAttribute("keySearch", keySearch);
		request.setAttribute("listProduct", listProduct);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("active", indexPage);
		request.setAttribute("search", "search");
		request.getRequestDispatcher("home.jsp").forward(request, response);
	}
}
