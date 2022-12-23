package funix.nam.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import funix.nam.context.DBContext;
import funix.nam.model.HistoryDetailOrderDTO;

public class HistoryDetailOrderDao {

	public List<HistoryDetailOrderDTO> getHistoryOder(String email) {
		DBContext context = new DBContext();
		Connection connection = context.getConnection();
		String sql = "{call history_orders(?)}";
		List<HistoryDetailOrderDTO> listDetailOrderDTOs = new ArrayList<>();
		try {connection.setAutoCommit(false);
			CallableStatement cs = connection.prepareCall(sql);
			cs.setString(1, email);
			ResultSet rs = cs.executeQuery();
			while (rs.next()) {
				String imgSource = rs.getString(1);
				String name = rs.getString(2);
				String type = rs.getString(3);
				int amount = rs.getInt(4);
				float price = rs.getFloat(5);
				Timestamp date = rs.getTimestamp(6);

				HistoryDetailOrderDTO detailOrderDTO = 
						new HistoryDetailOrderDTO(imgSource, name, type, amount, price, date);
				listDetailOrderDTOs.add(detailOrderDTO);
			}
			connection.commit();

		} catch (SQLException e) {
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}

		return listDetailOrderDTOs;
	}

}
