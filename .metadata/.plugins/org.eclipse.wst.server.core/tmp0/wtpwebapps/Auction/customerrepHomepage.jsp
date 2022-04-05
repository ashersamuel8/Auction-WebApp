<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336project.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Customerrep Homepage</title>
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
	margin-left: auto;
	margin-right:auto;
	width:100%;
	
}

td, th {
	border: 1px solid #dddddd;
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
		
		
		
		<form style="display: inline;">
		<div class="dropdown">
					<button class="category">FILTER</button>
				<div class="dropdown_cnt">
				
					<button onclick="customerrepHomepage.jsp" name="sort_filter" value="closed"> Closed Auctions</button>
					<button onclick="customerrepHomepage.jsp" name="sort_filter" value="open">Open Auctions</button>
					<button onclick="customerrepHomepage.jsp" name="sort_filter" value="all">All Auctions</button>
					<button onclick="customerrepHomepage.jsp" name="sort_filter" value="purchased">Purchased</button>
								
				</div>			
		</div>
		</form>
		<form style="display: inline;">
		<div class="dropdown">
					<button type="button" class="category">ITEMS IN</button>
				<div class="dropdown_cnt">
					<% 
					try{
				 			
				 			ApplicationDB db = new ApplicationDB();
				 			Connection con = db.getConnection();
				 			
				 			String str = "SELECT DISTINCT category_name FROM category";
				 			Statement stmt = con.createStatement();
				 			ResultSet rs = stmt.executeQuery(str);
				 			
				 			while(rs.next()){
				 				
				 			String catg_name = rs.getString("category_name");
				 				%>
				 				<button onclick="customerrepHomepage.jsp" name="catg_filter" value="<%=catg_name%>"><%=catg_name%></button>
				 				<%
				 			}
				 			
				 			db.closeConnection(con);
				 			
				 		}
				 		catch(Exception e){
				 			out.print(e);
				 		}
					
					%>	
					
				</div>
			</div>
		</form>
		
		
		
		<form action="customerrepHomepage.jsp" method="post" style="display: inline;">
			<input type="text" style="vertical-align: top; width: 400px;" placeholder="Search Product.." name="search">
			<button type="submit" class="searchbutton">Search</button>
		</form>
		<a href="Logout.jsp" style="float: right;">LOGOUT</a>
	</div>

	<%
	try {

		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		String catg_filter = request.getParameter("catg_filter");
		String sort_filter = request.getParameter("sort_filter");
		String search = request.getParameter("search");
		ResultSet result;
		
		if(sort_filter != null){
			
			if (sort_filter.equals("open")){
				PreparedStatement ps2 = con.prepareStatement("SELECT i.item_id, i.item_name, i.category_name, i.current_bid, i.closing_date_time, u.firstname, u.lastname FROM item i, sell_list s, user u WHERE i.item_id = s.item_id AND s.seller = u.username AND closing_date_time > now()");
				result = ps2.executeQuery();
				//System.out.println(sort_filter + "2");
			}
			else if (sort_filter.equals("closed")){
				PreparedStatement ps2 = con.prepareStatement("SELECT i.item_id, i.item_name, i.category_name, i.current_bid, i.closing_date_time, u.firstname, u.lastname FROM item i, sell_list s, user u WHERE i.item_id = s.item_id AND s.seller = u.username AND closing_date_time < now()");
				result = ps2.executeQuery();
				//System.out.println(sort_filter + "2");
			}
			else if (sort_filter.equals("purchased")){
				
				PreparedStatement ps2 = con.prepareStatement("SELECT i.item_id, i.item_name, i.category_name, i.current_bid, i.closing_date_time, u.firstname, u.lastname FROM item i, purchased p, user u WHERE i.item_id = p.item_id AND p.purchased_by = u.username");
				result = ps2.executeQuery();
				
			}
			else {
				PreparedStatement ps2 = con.prepareStatement("SELECT i.item_id, i.item_name, i.category_name, i.current_bid, i.closing_date_time, u.firstname, u.lastname FROM item i, sell_list s, user u WHERE i.item_id = s.item_id AND s.seller = u.username");
				result = ps2.executeQuery();
				//System.out.println(sort_filter + "2");
			}
		}
		else if(catg_filter != null){
			
			
			PreparedStatement ps1 = con.prepareStatement("SELECT i.item_id, i.item_name, i.category_name, i.current_bid, i.closing_date_time, u.firstname, u.lastname FROM item i, sell_list s, user u WHERE i.item_id = s.item_id AND s.seller = u.username AND i.category_name = ? AND i.closing_date_time > now()");
			ps1.setString(1, catg_filter);
			result = ps1.executeQuery();
			//System.out.println(catg_filter + "1");
			
		}
		else if(search != null){
			
			String str ="SELECT i.item_id, i.item_name, i.category_name, i.current_bid, i.closing_date_time, u.firstname, u.lastname FROM item i, sell_list s, user u WHERE i.item_id = s.item_id AND s.seller = u.username AND i.item_name LIKE '%"+search+"%'";
			PreparedStatement ps3 = con.prepareStatement(str);
			result = ps3.executeQuery();
			//System.out.println(search + "3");
		}
		else{
			
			
			Statement stmt = con.createStatement();
			String str = "SELECT i.item_id, i.item_name, i.category_name, i.current_bid, i.closing_date_time, u.firstname, u.lastname FROM item i, sell_list s, user u WHERE i.item_id = s.item_id AND s.seller = u.username";
			result = stmt.executeQuery(str);
			//System.out.println("4");
		
		}
		
		
	%>
	<br>
	<div style="background-color: black; opacity: 0.7; min-height: 650px; padding: 30px; position:relative; z-index: 1;">
	<table>
		<tr>
			<th>Seller</th>
			<th>Item Name</th>
			<th>Category Name</th>
			<th>Current Bid</th>
			<th>Closing Date Time</th>
			<th>Edit Info</th>
			<th>Edit Bids</th>
			<th>Close Auction</th>
			<th>Remove Item</th>
			
		</tr>

		<%
		//parse out the results
		while (result.next()) {
		%>
		<%
		String item_id = result.getString("item_id");
		%>
		<tr>
			<td><%=result.getString("firstname")%>, <%=result.getString("lastname")%></td>
			<td><%=result.getString("item_name")%></td>
			<td><%=result.getString("category_name")%></td>
			<td><%=result.getString("current_bid")%>$</td>
			<td><%=result.getString("closing_date_time")%></td>
			<td>
				<form action="edit_item_info.jsp" method="post"
					style="display: inline;">

					<button class="viewbids" type="submit" name="item_id"
						value="<%=item_id%>">Edit Info</button>

				</form>
			</td>
			<td>
				<form action="edit_bids.jsp" method="post"
					style="display: inline;">

					<button class="viewbids" type="submit" name="item_id"
						value="<%=item_id%>">Edit Bids</button>

				</form>
			</td>
			<td>
				<form action="close_auction.jsp" method="post"
					style="display: inline;">

					<button class="remove" type="submit" name="item_id"
						value="<%=item_id%>">Close Auction</button>

				</form>
			</td>
			<td>
				<form action="remove_item_catg_usr.jsp" method="post"
					style="display: inline;">

					<button class="remove" type="submit" name="item_id"
						value="<%=item_id%>">Remove</button>

				</form>
			</td>
			

		</tr>


		<%
		}

		db.closeConnection(con);
		%>

		<%
		} catch (Exception e) {
			System.out.print(e);
		}
		%>








	</table>
</div>

</body>
</html>
