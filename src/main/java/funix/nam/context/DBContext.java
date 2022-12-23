package funix.nam.context;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {
	private final String url = "jdbc:mysql://localhost:3306/shoppingdb";
	private final String user = "root";
	private final String password = "12345678";

	public Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
//			DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			conn = DriverManager.getConnection(url, user, password);

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("loi khi khoi tao connection 1!!");
		} catch (Exception e) {
			System.out.println("loi khi khoi tao connection 2!!");
		}
		return conn;
	}

	public void closeConnection(Connection conn) {
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
