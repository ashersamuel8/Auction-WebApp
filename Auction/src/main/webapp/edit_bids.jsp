<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336project.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Edit Bids</title>
</head>
			<%

				if(session.getAttribute("cr_username") == null){
					response.sendRedirect("employee_login.jsp");
				}
			sellUpdate.update();

			%>
<style>
.nav {
	overflow: hidden;
	opacity: 1.0;
	vertical-align:bottom;
}

.nav a {
	float: left;
	display: block;
	background-color: black;
	font-family: verdana;
	font-size: 14px;
	transition-duration: 0.4s;
	color: white;
	text-align: center;
	padding: 14px 14px;
	text-decoration: none;
}

.nav a:hover:not(.active) {
	background-color: forestgreen;
	color: white;
}

.nav a.active {
	background-color: forestgreen;
	color: white;
}

.nav input {
	float: center;
	padding: 10px;
	margin-top: 4px;
	margin-right: 4px;
	margin-left: 16px;
	border-style: solid;
	font-size: 17px;
	width: auto;
	background-color: black;
	color: ivory;
	border-color: ivory;
	opacity: 0.7;
}

.nav input:focus {
	outline: none;
}

.searchbutton {
	padding: 8px 8px;
	margin-top: 8px;
	margin-right: 16px;
	font-size: 17px;
	border: none;
	cursor: pointer;
	background-color: black;
	vertical-align: top;
	color: white;
}

.searchbutton:hover {
	background: grey;
}

table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	color: white;
	background-color: black;
	margin-right: auto;
	margin-right:auto;
	width: 100%;
	
	
}

td, th {
	border: 1px solid white;
	text-align: center;
	padding: 8px;
	background-color: black;
	color: white;
}

tr:nth-child(even) {
	background-color: black;
	color: white;
}

input[type=submit] {
	width: 75%;
	padding: 6px 6px;
	margin: 2px 0;
	box-sizing: border-box;
	border: none;
	background-color: indianred;
	color: white;
	font-size: 14px;
	transition-duration: 0.2s;
	verticle-align: bottom;
}

input[type=submit]:hover {
	background-color: firebrick;
	cursor: pointer;
}
input[type=text]{

   	font-size: 14px;
   	background-color: transparent;
   	color:white;
   	font-family: inherit;

}
input[type=number]{

   	font-size: 14px;
   	background-color: transparent;
   	color:white;
   	font-family: inherit;

}

.remove {
	width: 75%;
	padding: 6px 6px;
	margin: 2px 0;
	box-sizing: border-box;
	border: none;
	background-color: firebrick;
	color: white;
	font-size: 14px;
	transition-duration: 0.2s;
}

.remove:hover {
	background-color: indianred;
	cursor: pointer;
}
.submit-button {
	padding: 8px;
	background: none;
	color: white;
	border: none;
	font-size: 14px;
	transition-duration: 0.3s;
}

.submit-button:hover {
	background-color: limegreen;
	color: black;
	cursor: pointer;
}

.viewbids {
	width: 75%;
	padding: 6px 6px;
	margin: 2px 0;
	box-sizing: border-box;
	border: none;
	background-color: teal;
	color: white;
	font-size: 14px;
	transition-duration: 0.2s;
}

.viewbids:hover {
	background-color: lightseagreen;
	cursor: pointer;
}
.goback-button{
	
		padding: 8px;
		background: none;
		color: white;
		border: none;
		font-size: 14px;
		transition-duration: 0.3s;
	
	
}
.goback-button:hover{
	
		background-color: silver;
		color: black;
		cursor: pointer;
		
}
body {
	background-image:
		url('http://localhost:8080/Project_Group_91/Images/customerrepHomepage.jpg');
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: cover;
}

.category {
	padding: 12px 12px 11px 12px;
	font-size: 15px;
	border: none;
	cursor: pointer;
	background-color: black;
	color: white;
	transition-duration: 0.4s;
	vertical-align: bottom;
	margin-bottom: none;
	
	
}

.dropdown {
	display: inline-block;
	background-color: black;
	border: none;
}

.dropdown_cnt {
	display: none;
	position: absolute;
	background-color: black;
	overflow: auto;
	max-height: 200px;
	font-size: 14px;
	width: 150px;
	border: none;
	cursor: pointer;
	z-index: 2;

}

.dropdown_cnt button {
	color: white;
	padding: 10px;
	text-decoration: none;
	display: inline-block;
	width: 150px;
	overflow: auto;
	background-color: black;
	border: none;
	font-size: 14px;
	cursor: pointer;
	transition-duration: 0.4s;
	
}

.dropdown_cnt button:hover {
	background-color: forestgreen;
	color: white;
	background: fill;
	

}

.dropdown:hover .dropdown_cnt {
	display: block;
}

.category:hover, .dropdown:hover .category {
	background-color: forestgreen;
	color: white;
}
</style>
<body>

	<div class="nav">
		<a class="active" href="customerrepHomepage.jsp">AUCTIONS</a> 
		<a href="cr_catg.jsp">CATEGORY</a> 
		<a href = "cr_user.jsp">USERS</a>
		<a href="cr_inbox.jsp">INBOX</a>
		
		
		
	
		
		
		
		
		<a href="Logout.jsp" style="float: right;">LOGOUT</a>
	</div>
	<br><br>
	<div style="background-color: black; opacity: 0.7; min-height: 650px; padding: 30px; position:relative; z-index: 1;">
	
	
	<br>

	<%
	
	
			try{
				
				ApplicationDB db = new ApplicationDB();
				Connection con = db.getConnection();
				
				String item_id = request.getParameter("item_id");
				String remove_bid_username = request.getParameter("remove_bid_username");
				String remove_bid = request.getParameter("remove_bid");
				
				
				if(remove_bid != null){
					
					
					PreparedStatement ps = con.prepareStatement("DELETE FROM bids WHERE bid = ? AND username = ? AND item_id = ?");
					ps.setString(1, remove_bid);
					ps.setString(2, remove_bid_username);
					ps.setString(3, item_id);
					ps.executeUpdate();
					
					PreparedStatement ps2 = con.prepareStatement("SELECT MAX(bid) max_bid, item_id FROM bids WHERE item_id = ? GROUP BY item_id");
					ps2.setString(1, item_id);
					ResultSet rs2 = ps2.executeQuery();
					
					if(rs2.next() == true){
						
						String current_bid = rs2.getString("max_bid");
						PreparedStatement ps3 = con.prepareStatement("UPDATE item SET current_bid = ? WHERE item_id = ?");
						ps3.setString(1, current_bid);
						ps3.setString(2, item_id);
						ps3.executeUpdate();
						
						
					}
					
					
				}
				
				
				
				
				String str = "SELECT i.item_id, i.item_name, u.firstname, u.lastname, b.bid, u.username FROM item i, bids b, user u WHERE b.item_id = ? AND i.item_id = b.item_id AND b.username = u.username";
				PreparedStatement p1 = con.prepareStatement(str);
				p1.setString(1,item_id);
				ResultSet rs = p1.executeQuery(); 

				%>
					<table>
							<tr>
								<th>Item ID</th>
								<th>Item Name</th>
								<th>Name of Bidder</th>
								<th>Bid</th>
								<th>Remove Bid</th>
							</tr>
				
				<% 
				while(rs.next()){
					
					String bid = rs.getString("bid");
					String username = rs.getString("username");
						
						%>
							
							
							<tr>
								<td><%= rs.getString("item_id") %></td>
								<td><%= rs.getString("item_name") %></td>
								<td><%= rs.getString("firstname") %>, <%=rs.getString("lastname") %></td>
								<td><%= bid %> $</td>
								<td>
								<form action="edit_bids.jsp" method="post" style="display: inline;">
										
										<input type="hidden" name="remove_bid" value="<%=bid %>">
										<input type="hidden" name="remove_bid_username" value="<%=username %>">
										<button class="remove" type="submit" name="item_id"
										value="<%=item_id%>">Remove Bid</button>

								</form>
								</td>					
							</tr>
							
						<% 
					
					
				}
				
				db.closeConnection(con);
				
			}
			catch(Exception e){
				
				out.println(e);
				
				
			}

	
	
	
	
	
	
	
	
	%>
	</table>
	<br><br>
				<div style="text-align:center">
					<a href="customerrepHomepage.jsp"><button class="goback-button" type="submit">Go Back</button></a>
					</div>
	
	
	
	</div>






</body>
</html>

