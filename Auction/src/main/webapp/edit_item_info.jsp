<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336project.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Edit Item Info</title>
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
	
	margin-right:auto;
	width:400px;
	
}

td, th {
	border: none;
	text-align: left;
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
	
	<h3 style="color: white; font-family: Arial, Helvetica, sans-serif;">Old Item Info:</h3>
	<br>
	<table>
	<%
	
	
			try{
				
				ApplicationDB db = new ApplicationDB();
				Connection con = db.getConnection();
				
				String new_category_name = request.getParameter("new_category_name");
				
				
				String item_id = request.getParameter("item_id");
				String new_item_name = request.getParameter("new_item_name");
				String new_minimum_price = request.getParameter("new_minimum_price");
				String new_closing_date = request.getParameter("new_closing_date");
				String new_closing_time = request.getParameter("new_closing_time");
				
				
				if(new_item_name != null){
					
					
					if(new_category_name.equals("Select")){
						
						new_category_name = "null";
						
					}
					
					PreparedStatement ps0 = con.prepareStatement("UPDATE item SET item_name = ?, category_name = ?, minimum_price = ?, closing_date_time = ? WHERE item_id = ?");
					
					ps0.setString(1,new_item_name);
					ps0.setString(2,new_category_name);
					ps0.setString(3, String.valueOf(new_minimum_price));
					ps0.setString(4,new_closing_date + " " + new_closing_time);
					ps0.setString(5,item_id);
					ps0.executeUpdate();
					response.sendRedirect("customerrepHomepage.jsp");
					
					
				}
				else{
				
				
				
				PreparedStatement ps = con.prepareStatement("SELECT * from item WHERE item_id = ?");
				ps.setString(1, item_id);
				ResultSet rs = ps.executeQuery();
				
				while(rs.next()){
					%>
				
					<tr>
						<td>Item ID:</td>
						<td><%=rs.getString("item_id")%></td>
					</tr>
					<tr>
						<td>Item Name:</td>
						<td><%=rs.getString("item_name")%></td>
					</tr>
					<tr>
						<td>Category Name:</td>
						<td><%=rs.getString("category_name")%></td>
					</tr>
					<tr>
						<td>Minimum_price:</td>
						<td><%=rs.getString("minimum_price")%> $</td>
					</tr>
					<tr>
						<td>Current Bid:</td>
						<td><%=rs.getString("current_bid")%></td>
					</tr>
					<tr>
						<td>Closing Date and Time:</td>
						<td><%=rs.getString("closing_date_time")%></td>
					</tr>
					
					</table>
					
					
					<% 
				}
				 %>
				 <br>
				 <h3 style="color: white; font-family: Arial, Helvetica, sans-serif;">Enter New Item Info:</h3>
				<form action="edit_item_info.jsp" method="post">
				 <table>
				 	
				 	<tr>
				 	<td>Item Name:</td> 
 					<td><input type="text" name = "new_item_name" required placeholder="New Item Name"></td>
 					</tr>
 					<tr>
				 	<td>Category</td> 
 					<td> <select class="dropdown" name="new_category_name" required style="width: 150px; color: white; font-size:12px;">
				 <option value="Select">Select</option>
				 
				 <%
				 
				 		try{
				 			
				 			ApplicationDB dbx = new ApplicationDB();
				 			Connection conx = dbx.getConnection();
				 			
				 			String str = "SELECT DISTINCT category_name FROM category";
				 			Statement stmt = con.createStatement();
				 			ResultSet rsx = stmt.executeQuery(str);
				 			
				 			while(rsx.next()){
				 				
				 			String catg_name = rsx.getString("category_name");
				 				%>
				 				<option value="<%=catg_name%>"><%=catg_name%></option>
				 				<%
				 			}
				 			
				 			dbx.closeConnection(con);
				 			
				 		}
				 		catch(Exception e){
				 			out.print(e);
				 		}
				 
				 %>
 				 </select>
 				</td>
 					</tr>
 					<tr>
 					<td>Minimum Price:</td> 
 					<td><input type="number" name = "new_minimum_price" min="1" required>&emsp;$</td> 
 					</tr>
 					<tr>
 					<td>Closing Date:</td> 
 					<td><input type="text" name = "new_closing_date" placeholder="YYYY-MM-DD" required></td>
 					</tr>
 					<tr>
 					<td>Closing Time:</td> 
 					<td><input type="text" name = "new_closing_time" placeholder="hh:mm:ss" required></td>
 					</tr>
				 
				 </table>
				 <input type="hidden" name="item_id" value="<%=item_id %>">
				 <div align="center">
				 <button type="submit" class = "submit-button">Submit</button>
				 </div>
				 </form> 
				 <%
				
				 db.closeConnection(con);
				 
				}
				 
				 
				 
				 
				
				
			}
			catch(Exception e){
				
				out.println(e);
				
				
			}

	
	
	
	
	
	
	
	
	%>
	
	
	
	
	
	</div>






</body>
</html>
