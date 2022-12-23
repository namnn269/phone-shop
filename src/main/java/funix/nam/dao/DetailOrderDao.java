package funix.nam.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import funix.nam.context.DBContext;
import funix.nam.model.DetailOrder;

public class DetailOrderDao {

	public void insert(DetailOrder detailOrder) {
		DBContext context = new DBContext();
		Connection connection = context.getConnection();
		PreparedStatement ps;
		try {
			connection.setAutoCommit(false);
			String sql = "INSERT INTO orders_detail VALUES (?,?,?,?)";
			ps = connection.prepareStatement(sql);
			ps.setInt(1, detailOrder.getOrderId());
			ps.setInt(2, detailOrder.getProduct().getProductId());
			ps.setInt(3, detailOrder.getAmount());
			ps.setFloat(4, detailOrder.getPrice());
			ps.executeUpdate();
			connection.commit();
			ps.close();
		} catch (SQLException e) {
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			
			context.closeConnection(connection);
		}
	}
}
