package funix.nam.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import funix.nam.context.DBContext;
import funix.nam.model.Product;

public class ProductDao {
	public List<Product> getAll() {
		List<Product> list = new ArrayList<>();
		String sql = "SELECT * FROM products";
		DBContext context = new DBContext();
		Connection conn = context.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String description = rs.getString(3);
				float price = rs.getFloat(4);
				String imgSrc = rs.getString(5);
				String type = rs.getString(6).toUpperCase();
				String band = rs.getString(7);
				Product product = new Product(id, name, description, price, imgSrc, type, band);
				list.add(product);
			}
			conn.commit();
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		return list;
	}

	public List<Product> getByPage(int pageIndex, int productionsPerPage) {
		int offset = (pageIndex - 1) * productionsPerPage;
		List<Product> list = new ArrayList<>();
		String sql = "SELECT * FROM products LIMIT " + offset + ", " + productionsPerPage;
		DBContext context = new DBContext();
		Connection conn = context.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String description = rs.getString(3);
				float price = rs.getFloat(4);
				String imgSrc = rs.getString(5);
				String type = rs.getString(6).toUpperCase();
				String band = rs.getString(7);
				Product product = new Product(id, name, description, price, imgSrc, type, band);
				list.add(product);
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public Product getById(String idDetail) {
		Product product = null;
		String sql = "SELECT * FROM products WHERE product_id=?";
		DBContext context = new DBContext();
		Connection connection = context.getConnection();
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, idDetail);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String description = rs.getString(3);
				float price = rs.getFloat(4);
				String imgSrc = rs.getString(5);
				String type = rs.getString(6);
				String band = rs.getString(7);
				product = new Product(id, name, description, price, imgSrc, type, band);
			}
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return product;
	}

	public int getTotalQuantity() {
		String sql = "SELECT count(*) FROM products";
		int count = 0;
		DBContext context = new DBContext();
		Connection connection = context.getConnection();
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				count = rs.getInt(1);
			}
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	public List<Product> getBySearch(String search) {
		List<Product> list = new ArrayList<>();
		String searchCondition = " '%" + search + "%' ";
		String sql = "SELECT * FROM products WHERE product_name like " + searchCondition;

		DBContext context = new DBContext();
		Connection conn = context.getConnection();
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int id = rs.getInt(1);
				String name = rs.getString(2);
				String description = rs.getString(3);
				float price = rs.getFloat(4);
				String imgSrc = rs.getString(5);
				String type = rs.getString(6);
				String band = rs.getString(7);
				Product product = new Product(id, name, description, price, imgSrc, type, band);
				list.add(product);
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
		
}
