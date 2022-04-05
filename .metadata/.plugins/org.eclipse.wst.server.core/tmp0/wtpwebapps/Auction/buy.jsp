<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336project.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Buy</title>
</head>
			<%

				if(session.getAttribute("username") == null){
					response.sendRedirect("login.jsp");
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
	background-color: moccasin;
	color: black;
}

.nav a.active {
	background-color: lightsalmon;
	color: black;
}

.nav input {
	float: center;
	padding: 6px;
	margin-top: 8px;
	margin-right: 4px;
	margin-left: 16px;
	border-style: solid;
	font-size: 17px;
	width: auto;
	background-color: transparent;
	color: ivory;
	border-color: ivory;
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
	background-color: ivory;
	vertical-align: top;'
}

.searchbutton:hover {
	background: #ccc;
}

table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 100%;
	color: white;
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

.placebid {
	width: 75%;
	padding: 6px 6px;
	margin: 2px 0;
	box-sizing: border-box;
	border: none;
	background-color: indianred;
	color: white;
	font-size: 14px;
	transition-duration: 0.2s;
}

.placebid:hover {
	background-color: firebrick;
	cursor: pointer;
}

.viewbids {
	width: 75%;
	padding: 6px 6px;
	margin: 2px 0;
	box-sizing: border-box;
	border: none;
	background-color: lightseagreen;
	color: white;
	font-size: 14px;
	transition-duration: 0.2s;
}

.viewbids:hover {
	background-color: teal;
	cursor: pointer;
}

body {
	background-image:
		url('http://localhost:8080/Project_Group_91/Images/buy.jpg');
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: cover;
}

.category {
	padding: 14px 14px 12px 14px;
	font-size: 15px;
	border: none;
	cursor: pointer;
	background-color: black;
	color: white;
	transition-duration: 0.4s;
	vertical-align: bottom;
	margin-bottom: none;
	margin-top: -1px;
	
}

.dropdown {
	display: inline-block;
	background-color: black;
}

.dropdown_cnt {
	display: none;
	position: absolute;
	background-color: black;
	overflow: auto;
	max-height: 200px;
	font-size: 14px;
	width: 150px;

}

.dropdown_cnt button {
	color: white;
	padding: 10px;
	text-decoration: none;
	display: inline-block;
	width: 120px;
	overflow: auto;
	background-color: black;
	border: none;
	font-size: 14px;
	transition-duration: 0.4s;
}

.dropdown_cnt button:hover {
	background-color: cornsilk;
	color: black;
	

}

.dropdown:hover .dropdown_cnt {
	display: block;
}

.category:hover, .dropdown:hover .category {
	background-color: moccasin;
	color: black;
}
</style>
<body>

	<div class="nav">
		<a href="userHomepage.jsp">HOME</a> <a class="active" href="buy.jsp">BUY</a>
		<a href="sell.jsp">SELL</a> 
		<a href = "my_products.jsp">MY PRODUCTS</a>
		<a href="userInbox.jsp">INBOX</a>
		
		
		<form style="display: inline;">
		<div class="dropdown">
					<button type="button" class="category">CATEGORY</button>
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
				 				<button onclick="buy.jsp" name="catg_filter" value="<%=catg_name%>"><%=catg_name%></button>
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
		
		<form style="display: inline;">
		<div class="dropdown">
					<button class="category">SORT BY</button>
				<div class="dropdown_cnt">
				
					<button onclick="buy.jsp" name="sort_filter" value="item_name"> Item Name</button>
					<button onclick="buy.jsp" name="sort_filter" value="current_bid">Price</button>
					<button onclick="buy.jsp" name="sort_filter" value="category_name">Kind</button>
					<button onclick="buy.jsp" name="sort_filter" value="closing_date_time">Closing Date</button>
								
				</div>			
		</div>
		</form>
		
		
		
		<form action="buy.jsp" method="post" style="display: inline;">
			<input type="text" style="vertical-align: top; width: 400px;" placeholder="Search Product.." name="buy_search">
			<button type="submit" class="searchbutton">Search</button>
		</form>
		<a href="Logout.jsp" style="float: right;">LOGOUT</a>
	</div>

	<%
	try {

		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		
		String catg_filter =  request.getParameter("catg_filter");
		String sort_filter = request.getParameter("sort_filter");
		String search = request.getParameter("buy_search");
		ResultSet result;
		
		if(catg_filter != null){
			
			
			PreparedStatement ps1 = con.prepareStatement("SELECT i.item_id, i.item_name, i.category_name, i.current_bid, i.closing_date_time, u.firstname, u.lastname FROM item i, sell_list s, user u WHERE i.item_id = s.item_id AND s.seller = u.username AND i.category_name = ? AND i.closing_date_time > now()");
			ps1.setString(1, catg_filter);
			result = ps1.executeQuery();
			//System.out.println(catg_filter + "1");
			
		}
		else if(sort_filter != null){
			
			
			PreparedStatement ps2 = con.prepareStatement("SELECT i.item_id, i.item_name, i.category_name, i.current_bid, i.closing_date_time, u.firstname, u.lastname FROM item i, sell_list s, user u WHERE i.item_id = s.item_id AND s.seller = u.username AND i.closing_date_time > now() ORDER BY "+ sort_filter);
			result = ps2.executeQuery();
			//System.out.println(sort_filter + "2");
			
		}
		else if(search != null){
			
			String str ="SELECT i.item_id, i.item_name, i.category_name, i.current_bid, i.closing_date_time, u.firstname, u.lastname FROM item i, sell_list s, user u WHERE i.item_id = s.item_id AND s.seller = u.username AND i.closing_date_time > now() AND i.item_name LIKE '%"+search+"%'";
			PreparedStatement ps3 = con.prepareStatement(str);
			result = ps3.executeQuery();
			//System.out.println(search + "3");
		}
		else{
			
			
			Statement stmt = con.createStatement();
			String str = "SELECT i.item_id, i.item_name, i.category_name, i.current_bid, i.closing_date_time, u.firstname, u.lastname FROM item i, sell_list s, user u WHERE i.item_id = s.item_id AND s.seller = u.username AND i.closing_date_time > now()";
			result = stmt.executeQuery(str);
			//System.out.println("4");
		
		}
		
		
	%>
	<br>
	<br>
	<table>
		<tr>
			<th>Seller</th>
			<th>Item Name</th>
			<th>Category Name</th>
			<th>Current Bid</th>
			<th>Closing Date Time</th>
			<th>Place a Bid</th>
			<th>View All Bids</th>
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
			<td><%=result.getString("current_bid")%> $</td>
			<td><%=result.getString("closing_date_time")%></td>
			<td>
				<form action="place_bid.jsp" method="post"
					style="display: inline;">

					<button class="placebid" type="submit" name="item_id"
						value="<%=item_id%>">Place Bid</button>

				</form>
			</td>
			<td>
				<form action="view_bids.jsp" method="post"
					style="display: inline;">

					<button class="viewbids" type="submit" name="item_id"
						value="<%=item_id%>">View Bids</button>

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


</body>
</html>
