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

@WebServlet("/search-product")
public class SearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SearchController() {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String search = request.getParameter("searchForm");
		ProductDao dao = new ProductDao();
		List<Product> list = dao.getBySearch(search);

		if (search.equals("")) {
			request.setAttribute("search1", "no1");
			request.getRequestDispatcher("home.jsp").forward(request, response);
		} else {
			request.setAttribute("search1", "yes1");
			request.setAttribute("listSearch", list);
			request.getRequestDispatcher("list-product").forward(request, response);
		}
	}
}
