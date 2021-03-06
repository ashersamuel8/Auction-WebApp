package com.cs336project.pkg;

import java.sql.*;


public class GetID {
	
	
	
	public static int getCategoryID() throws SQLException {
		
		
		
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		
		String catg = "SELECT category_id FROM category";
		
		Statement stmt = con.createStatement();
		
		
		int min = 10;
		int max = 99;
		int catg_id = (int) Math.floor(Math.random()*(max-min+1)+min);
		int target = -1;
		
		
		for(;;) {
			
			ResultSet rs = stmt.executeQuery(catg);
			catg_id = (int) Math.floor(Math.random()*(max-min+1)+min);
			
			while(rs.next()) {
				
				target = Integer.parseInt(rs.getString("category_id"));
				if(catg_id == target) break;
			}
			
			if(catg_id != target) break;
			
		}
		
		db.closeConnection(con);
		
		return catg_id;
	}
	
	public static int getItemID() throws SQLException {
		
		
		
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		
		String str = "SELECT category_id FROM category";
		
		Statement stmt = con.createStatement();
		
		
		int min = 1000;
		int max = 9999;
		int item_id = (int) Math.floor(Math.random()*(max-min+1)+min);
		int target = -1;
		
		
		for(;;) {
			
			ResultSet rs = stmt.executeQuery(str);
			item_id = (int) Math.floor(Math.random()*(max-min+1)+min);
			
			while(rs.next()) {
				
				target = Integer.parseInt(rs.getString("category_id"));
				if(item_id == target) break;
			}
			
			if(item_id != target) break;
			
		}
		
		db.closeConnection(con);
		return item_id;
	}
	public static int getEmployeeID() throws SQLException {
		
		
		
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		
		String str = "SELECT employee_id FROM customerRep";
		
		Statement stmt = con.createStatement();
		
		
		int min = 100000;
		int max = 999999;
		int employee_id = (int) Math.floor(Math.random()*(max-min+1)+min);
		int target = -1;
		
		
		for(;;) {
			
			ResultSet rs = stmt.executeQuery(str);
			employee_id = (int) Math.floor(Math.random()*(max-min+1)+min);
			
			while(rs.next()) {
				
				target = Integer.parseInt(rs.getString("employee_id"));
				if(employee_id == target) break;
			}
			
			if(employee_id != target) break;
			
		}
		
		db.closeConnection(con);
		return employee_id;
	}
	
public static int getQ_ID() throws SQLException {
		
		
		
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		
		String str = "SELECT q_id FROM questions";
		
		Statement stmt = con.createStatement();
		
		
		int min = 100;
		int max = 999;
		int q_id = (int) Math.floor(Math.random()*(max-min+1)+min);
		int target = -1;
		
		
		for(;;) {
			
			ResultSet rs = stmt.executeQuery(str);
			q_id = (int) Math.floor(Math.random()*(max-min+1)+min);
			
			while(rs.next()) {
				
				target = Integer.parseInt(rs.getString("q_id"));
				if(q_id == target) break;
			}
			
			if(q_id != target) break;
			
		}
		
		db.closeConnection(con);
		return q_id;
	}
	
    public static void main( String args[] ) throws SQLException {
    
    		int item_id = getItemID();
    		int catg_id = getCategoryID();
    		int employee_id = getEmployeeID();
    		int q_id = getQ_ID();

      System.out.println(item_id);
      System.out.println(catg_id);
      System.out.println(employee_id);
      System.out.println(q_id);
      
      
    }
}