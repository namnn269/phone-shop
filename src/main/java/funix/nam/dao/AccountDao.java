package funix.nam.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import funix.nam.context.DBContext;
import funix.nam.model.Account;

public class AccountDao {
	
	public void deleteByEmail(String email) {
		
		DBContext context=new DBContext();
		Connection conn=context.getConnection();
		String sql = "DELETE FROM account where email=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.execute();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}
	
	public void insert(Account account) {
		DBContext context = new DBContext();
		Connection connection = context.getConnection();
		String sql = "INSERT INTO account " + "(user_mail, password,account_role, user_name,"
				+ " user_address, user_phone, registered)" + " VALUES (?,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			connection.setAutoCommit(false);
			ps.setString(1, account.getUserMail());
			ps.setString(2, account.getPassword());
			ps.setInt(3, 0);
			ps.setString(4, account.getName());
			ps.setString(5, account.getAddress());
			ps.setString(6, account.getPhone());
			ps.setBoolean(7, account.isRegistered());
			ps.executeUpdate();
			connection.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			context.closeConnection(connection);
		}
	}

	public Account getByEmail(String email) {
		DBContext context = new DBContext();
		Connection connection = context.getConnection();
		String sql = "SELECT * FROM account WHERE user_mail=?";
		Account account = new Account();
		;
		try {
			PreparedStatement ps = connection.prepareStatement(sql);
			connection.setAutoCommit(false);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				account.setUserMail(rs.getString(1));
				account.setPassword(rs.getString(2) == null ? "" : rs.getString(2));
				account.setRole(rs.getInt(3));
				account.setName(rs.getString(4));
				account.setAddress(rs.getString(5));
				account.setPhone(rs.getString(6));
				account.setRegistered(rs.getBoolean(7));
			}
			if (account.getUserMail() == null)
				account = null;
			connection.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			context.closeConnection(connection);
		}
		return account;

	}

	public void update(Account account) {
		DBContext context = new DBContext();
		Connection connection = context.getConnection();
		String sql = "UPDATE account SET password =? ,account_role =?, user_name =?,"
				+ " user_address =?, user_phone =?, registered =?  WHERE user_mail = ?";
		try {
			System.out.println(account);
			PreparedStatement ps = connection.prepareStatement(sql);
			connection.setAutoCommit(false);
			ps.setString(1, account.getPassword());
			ps.setInt(2, 0);
			ps.setString(3, account.getName());
			ps.setString(4, account.getAddress());
			ps.setString(5, account.getPhone());
			ps.setBoolean(6, account.isRegistered());
			ps.setString(7, account.getUserMail());
			ps.executeUpdate();
			connection.commit();
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			context.closeConnection(connection);
		}
	}

}
