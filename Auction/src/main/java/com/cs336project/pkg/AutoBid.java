package com.cs336project.pkg;

import java.sql.*;

public class AutoBid {

	public static void insert(String item_id, String username) throws SQLException {

		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();

		PreparedStatement ps1 = con
				.prepareStatement("SELECT current_bid FROM item WHERE item_id = ? AND closing_date_time > now()");
		ps1.setString(1, item_id);
		ResultSet rs1 = ps1.executeQuery();
		rs1.next();
		int current_bid = Integer.parseInt(rs1.getString("current_bid"));

		PreparedStatement ps2 = con.prepareStatement(
				"SELECT a.min_bid, a.max_bid, a.increments FROM auto_bid a, item i WHERE a.item_id = ? AND a.username = ? AND i.item_id = a.item_id AND i.closing_date_time > now()");
		ps2.setString(1, item_id);
		ps2.setString(2, username);
		ResultSet rs2 = ps2.executeQuery();
		rs2.next();

		int min_bid = Integer.parseInt(rs2.getString("min_bid"));
		int max_bid = Integer.parseInt(rs2.getString("max_bid"));
		int increments = Integer.parseInt(rs2.getString("increments"));

		if (current_bid < max_bid && current_bid + increments <= max_bid) {

			if (min_bid <= current_bid) {

				PreparedStatement ps3 = con.prepareStatement("UPDATE item SET current_bid = ? WHERE item_id = ?");
				ps3.setString(1, String.valueOf(current_bid + increments));
				ps3.setString(2, item_id);
				ps3.executeUpdate();

				PreparedStatement ps4 = con.prepareStatement("INSERT INTO bids VALUES (?, ?, ?)");
				ps4.setString(1, item_id);
				ps4.setString(2, String.valueOf(current_bid + increments));
				ps4.setString(3, username);
				ps4.executeUpdate();

			} else if (min_bid > current_bid) {

				PreparedStatement ps5 = con.prepareStatement("UPDATE item SET current_bid = ? WHERE item_id = ?");
				ps5.setString(1, String.valueOf(min_bid));
				ps5.setString(2, item_id);
				ps5.executeUpdate();

				PreparedStatement ps6 = con.prepareStatement("INSERT INTO bids VALUES (?, ?, ?)");
				ps6.setString(1, item_id);
				ps6.setString(2, String.valueOf(min_bid));
				ps6.setString(3, username);
				ps6.executeUpdate();

			}

		} else if (current_bid + increments > max_bid) {

			PreparedStatement ps7 = con.prepareStatement("UPDATE item SET current_bid = ? WHERE item_id = ?");
			ps7.setString(1, String.valueOf(max_bid));
			ps7.setString(2, item_id);
			ps7.executeUpdate();

			PreparedStatement ps8 = con.prepareStatement("INSERT INTO bids VALUES (?, ?, ?)");
			ps8.setString(1, item_id);
			ps8.setString(2, String.valueOf(max_bid));
			ps8.setString(3, username);
			ps8.executeUpdate();

		}
		db.closeConnection(con);

		return;

	}

	public static void update(String item_id) throws SQLException {

		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();

		String str = "SELECT username FROM auto_bid ORDER BY 'index'";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(str);

		while (rs.next()) {

			String username = rs.getString("username");

			PreparedStatement ps1 = con.prepareStatement("SELECT current_bid FROM item WHERE item_id = ? AND closing_date_time > now()");
			ps1.setString(1, item_id);
			ResultSet rs1 = ps1.executeQuery();
			rs1.next();
			int current_bid = Integer.parseInt(rs1.getString("current_bid"));

			PreparedStatement ps2 = con.prepareStatement("SELECT a.min_bid, a.max_bid, a.increments FROM auto_bid a, item i WHERE a.item_id = ? AND a.username = ? AND i.item_id = a.item_id AND i.closing_date_time > now()");
			ps2.setString(1, item_id);
			ps2.setString(2, username);
			ResultSet rs2 = ps2.executeQuery();
			if (rs2.next() == true) {

				int min_bid = Integer.parseInt(rs2.getString("min_bid"));
				int max_bid = Integer.parseInt(rs2.getString("max_bid"));
				int increments = Integer.parseInt(rs2.getString("increments"));

				if (current_bid < max_bid && current_bid + increments <= max_bid) {

					if (min_bid <= current_bid) {

						PreparedStatement ps3 = con.prepareStatement("UPDATE item SET current_bid = ? WHERE item_id = ?");
						ps3.setString(1, String.valueOf(current_bid + increments));
						ps3.setString(2, item_id);
						ps3.executeUpdate();

						PreparedStatement ps4 = con.prepareStatement("INSERT INTO bids VALUES (?, ?, ?)");
						ps4.setString(1, item_id);
						ps4.setString(2, String.valueOf(current_bid + increments));
						ps4.setString(3, username);
						ps4.executeUpdate();

					} else if (min_bid > current_bid) {

						PreparedStatement ps5 = con
								.prepareStatement("UPDATE item SET current_bid = ? WHERE item_id = ?");
						ps5.setString(1, String.valueOf(min_bid));
						ps5.setString(2, item_id);
						ps5.executeUpdate();

						PreparedStatement ps6 = con.prepareStatement("INSERT INTO bids VALUES (?, ?, ?)");
						ps6.setString(1, item_id);
						ps6.setString(2, String.valueOf(min_bid));
						ps6.setString(3, username);
						ps6.executeUpdate();

					}

				} else if (current_bid + increments > max_bid) {

					PreparedStatement ps7 = con.prepareStatement("UPDATE item SET current_bid = ? WHERE item_id = ?");
					ps7.setString(1, String.valueOf(max_bid));
					ps7.setString(2, item_id);
					ps7.executeUpdate();

					PreparedStatement ps8 = con.prepareStatement("INSERT INTO bids VALUES (?, ?, ?)");
					ps8.setString(1, item_id);
					ps8.setString(2, String.valueOf(max_bid));
					ps8.setString(3, username);
					ps8.executeUpdate();

				}

			}
		}
		db.closeConnection(con);

		return;

	}

	public static void main(String args[]) throws SQLException {

	}
}