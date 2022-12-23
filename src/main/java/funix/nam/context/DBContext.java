package funix.nam.context;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {
	private final String url = "jdbc:mysql://b44c5bb4302696:4d30ca11@us-cdbr-east-06.cleardb.net/heroku_f4e55b2d6def88c?reconnect=true";
	private final String user = "b44c5bb4302696";
	private final String password = "4d30ca11";

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
