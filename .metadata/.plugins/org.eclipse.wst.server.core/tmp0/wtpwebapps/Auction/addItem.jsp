<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336project.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="java.time.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<title>Add Item</title>
</head>
			<%

				if(session.getAttribute("username") == null){
					response.sendRedirect("login.jsp");
				}
			sellUpdate.update();

			%>
<body>
	<%
	
	try{
		
		String category_name = request.getParameter("category_name");
		
		if(category_name.equals("Select")){
			%>
			<script>
				alert("Please Select a Valid Category");
				window.location.href = "sell.jsp";
			</script>
			<%
		}
		else{
					
			String item_id =  String.valueOf(GetID.getItemID());
			String item_name = request.getParameter("item_name");
			String minimum_price = request.getParameter("minimum_price");
			String closing_date = request.getParameter("closing_date");
			String closing_time = request.getParameter("closing_time");
			String reserve = request.getParameter("reserve");
			
			LocalDateTime closing_date_time = LocalDateTime.parse(closing_date+"T"+closing_time);
			LocalDateTime current_time = LocalDateTime.now();
			
			if(closing_date_time.compareTo(current_time) < 0){
				%>
				<script>
					alert("Please Enter A Valid Date and Time");
					window.location.href = "sell.jsp";
				</script>
				<%
			}
			else{
					
				if(reserve.equals("true")){
				
						String reserve_value = String.valueOf(request.getParameter("reserve_value"));
						
						
						if(Integer.parseInt(minimum_price) >= Integer.parseInt(reserve_value) ){
							%>
							<script>
								alert("Please Enter A Reserve Value that is greater than the Minimum Price");
								window.location.href = "sell.jsp";
							</script>
							<%
							
							
						}
						else{
							
							ApplicationDB db = new ApplicationDB();
							Connection con = db.getConnection();
							
							PreparedStatement ps = con.prepareStatement("INSERT INTO item VALUES (?, ?, ?, ?, ?, ?)");
							ps.setString(1,item_id);
							ps.setString(2,item_name);
							ps.setString(3,category_name);
							ps.setString(4, String.valueOf(minimum_price));
							ps.setString(5, "-1");
							ps.setString(6,closing_date + " " + closing_time);
							ps.executeUpdate();
							
							PreparedStatement ps1 = con.prepareStatement("INSERT INTO reserve VALUES(?, ?)");
							ps1.setString(1, item_id);
							ps1.setString(2, reserve_value);
				
							ps1.executeUpdate();
						
							String username = String.valueOf(session.getAttribute("username"));
						
							PreparedStatement ps2 = con.prepareStatement("INSERT INTO sell_list VALUES (?, ?)");
							ps2.setString(1, item_id);
							ps2.setString(2, username);
							ps2.executeUpdate();
						
							db.closeConnection(con);
							response.sendRedirect("buy.jsp");
						
						
						}
						
				}
				else{
					
					ApplicationDB db = new ApplicationDB();
					Connection con = db.getConnection();
					
					PreparedStatement ps = con.prepareStatement("INSERT INTO item VALUES (?, ?, ?, ?, ?, ?)");
					ps.setString(1,item_id);
					ps.setString(2,item_name);
					ps.setString(3,category_name);
					ps.setString(4, String.valueOf(minimum_price));
					ps.setString(5, "-1");
					ps.setString(6,closing_date + " " + closing_time);
					
					
					ps.executeUpdate();
					
					String username = String.valueOf(session.getAttribute("username"));
					
					PreparedStatement ps2 = con.prepareStatement("INSERT INTO sell_list VALUES (?, ?)");
					ps2.setString(1, item_id);
					ps2.setString(2, username);
					ps2.executeUpdate();
					
					db.closeConnection(con);
					response.sendRedirect("buy.jsp");
					
					
					
				}
					
					
			}
					
		}

	} 
	catch (Exception e) {

		out.println(e);
	}
			%>
</body>
</html>