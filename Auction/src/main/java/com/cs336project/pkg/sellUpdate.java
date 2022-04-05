package com.cs336project.pkg;

import java.sql.*;


public class sellUpdate {
	
	
	
	public static void update() throws SQLException {
		
		
		
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		
		Statement stmt = con.createStatement();
		
		String str1 = "SELECT s.item_id, s.seller, i.category_name, i.minimum_price FROM sell_list s, item i WHERE i.closing_date_time < now() AND i.item_id = s.item_id AND s.item_id NOT IN (SELECT item_id FROM purchased)";
		
		ResultSet rs1 = stmt.executeQuery(str1);
		
		while(rs1.next()) {
			
			String item_id = rs1.getString("item_id");
			String category_name = rs1.getString("category_name");
			
			PreparedStatement ps1 = con.prepareStatement("SELECT reserve_value FROM reserve WHERE item_id = ?");
			ps1.setString(1, item_id);
			ResultSet reserve = ps1.executeQuery();
			
			if(reserve.next() == true) {
				
				int reserve_value = Integer.parseInt(reserve.getString("reserve_value")); 
				
				PreparedStatement ps2 = con.prepareStatement("SELECT max(bid) max_bid, username FROM bids WHERE item_id = ? GROUP BY username");
				ps2.setString(1, item_id);
				ResultSet bids = ps2.executeQuery();
				
				if(bids.next() == true) {
					
					int max_bid = Integer.parseInt(bids.getString("max_bid"));
					
					String buyer = bids.getString("username");
					
					if(max_bid > reserve_value) {
						
						PreparedStatement ps3 = con.prepareStatement("INSERT INTO purchased VALUES (?, ?, ?, ?)");
						ps3.setString(1, item_id);
						ps3.setString(2, String.valueOf(max_bid));
						ps3.setString(3, category_name);
						ps3.setString(4, buyer);
						ps3.executeUpdate();
					}
		
					
				}
				
			
			}
			else {
				
				PreparedStatement ps2 = con.prepareStatement("SELECT max(bid) max_bid, username FROM bids WHERE item_id = ? GROUP BY username");
				ps2.setString(1, item_id);
				ResultSet bids = ps2.executeQuery();
				
	 	 		
	 	 		
				if(bids.next() == true) {
					
					int max_bid = Integer.parseInt(bids.getString("max_bid"));
					int min_price = Integer.parseInt(rs1.getString("minimum_price"));
					String buyer = bids.getString("username");
					
					if(max_bid > min_price){
						
						PreparedStatement ps3 = con.prepareStatement("INSERT INTO purchased VALUES (?, ?, ?, ?)");
						ps3.setString(1, item_id);
						ps3.setString(2, String.valueOf(max_bid));
						ps3.setString(3, category_name);
						ps3.setString(4, buyer);
						ps3.executeUpdate();
			
					}
				
				}
		
			}
		}
		
		
		db.closeConnection(con);
		return;
	}
		
	
	
    public static void main( String args[] ) throws SQLException {
    
 
     
      
    }
}