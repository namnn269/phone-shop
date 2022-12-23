package funix.nam.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import funix.nam.context.DBContext;
import funix.nam.model.Order;

public class OrderDao {

	public int insertOrder(Order order) {
		DBContext context = new DBContext();
		Connection connection = context.getConnection();
		int idOrder = 0;

		String sql = "INSERT INTO orders (user_mail, order_status, order_discount_code, order_address) "
				+ "values (?,?,?,?)";
		try {
			connection.setAutoCommit(false);
			PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, order.getAccount().getUserMail());
			ps.setInt(2, 0);
			ps.setString(3, order.getOrderDiscountCode());
			ps.setString(4, order.getAddress());
			int affectedRow = ps.executeUpdate();
			if (affectedRow == 0)
				throw new SQLException("Creating new order is failed!!");

			ResultSet resultSet = ps.getGeneratedKeys();
			while (resultSet.next()) {
				idOrder = resultSet.getInt(1);
			}
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
		return idOrder;
	}

}
