<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336project.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>My Products</title>
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
	width: 500px;
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
	background: black;
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

.item-info{
	
	
		margin: 8px;
		padding: 20px;
		color: white;
		background-color: black;
		opacity: 0.8;
		border-style: solid;
		border-color: ivory;
	
	}

body {
	background-image:
		url('http://localhost:8080/Project_Group_91/Images/buy.jpg');
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: cover;
}
.viewbids {
	width: 100%;
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
.placebid {
	width: 100%;
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

.category {
	padding: 14px 14px;
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
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: grey;
	min-width: 200px;
	overflow: auto;
	max-height: 200px;
	font-size: 14px;
}

.dropdown-content a {
	color: white;
	padding: 10px;
	text-decoration: none;
	display: block;
}

.dropdown-content a:hover {
	background-color: cornsilk;
	color: black;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.category:hover, .dropdown:hover .category {
	background-color: moccasin;
	color: black;
}
</style>
<body>

	<div class="nav">
		<a href="userHomepage.jsp">HOME</a> <a href="buy.jsp">BUY</a>
		<a href="sell.jsp">SELL</a> 
		<a class="active" href = "my_products.jsp">MY PRODUCTS</a>
		<a href="userInbox.jsp">INBOX</a>
		<a href="Logout.jsp" style="float: right;">LOGOUT</a>
		<a href = "help.jsp" style="float:right;">HELP</a>
	</div>

	<%
	try {

		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		
		String username =  String.valueOf(session.getAttribute("username"));
		
		PreparedStatement ps1 = con.prepareStatement("SELECT i.item_id, i.item_name, i.category_name, i.closing_date_time, p.sale_price, u.lastname, u.firstname FROM purchased p, item i, sell_list s, user u WHERE p.purchased_by = ? AND i.item_id = p.item_id AND i.item_id = s.item_id AND u.username = s.seller");
		ps1.setString(1, username);
		ResultSet purchased = ps1.executeQuery();
		
		PreparedStatement ps2 = con.prepareStatement("SELECT i.item_id, i.item_name, i.category_name, i.closing_date_time, p.sale_price, u.firstname, u.lastname FROM sell_list s, purchased p, item i, user u WHERE s.seller = ? AND i.item_id = s.item_id AND s.item_id = p.item_id AND u.username = p.purchased_by");
		ps2.setString(1, username);
		ResultSet sold = ps2.executeQuery();
		
		PreparedStatement ps3 = con.prepareStatement("SELECT i.item_id, i.item_name, i.category_name, i.closing_date_time, i.current_bid FROM sell_list s, item i WHERE s.seller = ? AND i.item_id = s.item_id AND i.closing_date_time > now()");
		ps3.setString(1, username);
		ResultSet onsale = ps3.executeQuery();
		
		PreparedStatement ps4 = con.prepareStatement("SELECT i.item_id, i.item_name, i.category_name, i.closing_date_time, b.bid FROM bids b, item i WHERE b.username = ? AND b.item_id = i.item_id");
		ps4.setString(1, username);
		ResultSet mybids = ps4.executeQuery();
		
		PreparedStatement ps5 = con.prepareStatement("SELECT i.item_id, i.item_name, i.category_name, i.closing_date_time, a.min_bid, a.max_bid, a.increments FROM auto_bid a, item i WHERE a.username = ? AND a.item_id = i.item_id");
		ps5.setString(1, username);
		ResultSet autobids = ps5.executeQuery();
		
		PreparedStatement ps6 = con.prepareStatement("SELECT i.item_id, i.item_name, i.category_name, i.closing_date_time, i.current_bid FROM sell_list s, item i WHERE s.seller = ? AND i.item_id = s.item_id AND i.closing_date_time < now() AND i.item_id NOT IN (SELECT item_id FROM purchased)");
		ps6.setString(1, username);
		ResultSet notsold = ps6.executeQuery();
		
		PreparedStatement ps7 = con.prepareStatement("SELECT i.item_id, i.item_name, i.category_name, i.closing_date_time, i.current_bid, r.reserve_value FROM sell_list s, item i, reserve r WHERE s.seller = ? AND i.item_id = r.item_id AND i.item_id = s.item_id AND i.closing_date_time < now() AND i.item_id NOT IN (SELECT item_id FROM purchased)");
		ps7.setString(1, username);
		ResultSet reserved = ps7.executeQuery();
		
		
		
	%>
	<br>
	<br>
	<div class="item-info">
	<h2>Items Purchased</h2>
	<br>
	<table>
		<tr>
			<th>Item ID</th>
			<th>Item Name</th>
			<th>Category Name</th>
			<th>Sale Price</th>
			<th>Seller</th>
			<th>Date</th>
		</tr>

		<%
		
		while (purchased.next()) {
		%>
		
		<tr>
			<td><%=purchased.getString("item_id")%></td>
			<td><%=purchased.getString("item_name")%></td>
			<td><%=purchased.getString("category_name")%></td>
			<td><%=purchased.getString("sale_price")%>$</td>
			<td><%=purchased.getString("firstname")%>, <%=purchased.getString("lastname")%></td>
			<td><%=purchased.getString("closing_date_time")%></td>
			
		</tr>


		<%
		}
		%>
		</table>
		<br><br><br>
		<h2>Items Sold</h2>
		<br>
		
		<table>
		<tr>
			<th>Item ID</th>
			<th>Item Name</th>
			<th>Category Name</th>
			<th>Sale Price</th>
			<th>Buyer</th>
			<th>Date</th>
		</tr>
		
		<%
		//parse out the results
		while (sold.next()) {
		%>
		
		<tr>
			<td><%=sold.getString("item_id")%></td>
			<td><%=sold.getString("item_name")%></td>
			<td><%=sold.getString("category_name")%></td>
			<td><%=sold.getString("sale_price")%>$</td>
			<td><%=sold.getString("firstname")%>, <%=sold.getString("lastname")%></td>
			<td><%=sold.getString("closing_date_time")%></td>
			
		</tr>


		<%
		}
		
		%>
		
		</table>
		
		<br><br><br>
		<h2>Items Currently On Sale</h2>
		<br>
		
		<table>
		<tr>
			<th>Item ID</th>
			<th>Item Name</th>
			<th>Category Name</th>
			<th>Current Bid</th>
			<th>Closing Date and Time</th>
		</tr>
		
		<%
		//parse out the results
		while (onsale.next()) {
		%>
		
		<tr>
			<td><%=onsale.getString("item_id")%></td>
			<td><%=onsale.getString("item_name")%></td>
			<td><%=onsale.getString("category_name")%></td>
			<td><%=onsale.getString("current_bid")%>$</td>
			<td><%=onsale.getString("closing_date_time")%></td>
			
		</tr>


		<%
		}
		
		%>
		</table>
		
		<br><br><br>
		<h2>Items Not Sold</h2>
		<br>
		
		<table>
		<tr>
			<th>Item ID</th>
			<th>Item Name</th>
			<th>Category Name</th>
			<th>Final Bid</th>
			<th>Closed Date and Time</th>
		</tr>
		
		<%
		//parse out the results
		while (notsold.next()) {
		%>
		
		<tr>
			<td><%=notsold.getString("item_id")%></td>
			<td><%=notsold.getString("item_name")%></td>
			<td><%=notsold.getString("category_name")%></td>
			<td><%=notsold.getString("current_bid")%>$</td>
			<td><%=notsold.getString("closing_date_time")%></td>
			
		</tr>


		<%
		}
		
		%>
		</table>
		

		<br><br><br>
		<h2>My Bids</h2>
		<br>
		
		<table>
		<tr>
			<th>Item ID</th>
			<th>Item Name</th>
			<th>Category Name</th>
			<th>Bid</th>
			<th>Closing Date</th>
		</tr>
		
		<%
		//parse out the results
		while (mybids.next()) {
		%>
		
		<tr>
			<td><%=mybids.getString("item_id")%></td>
			<td><%=mybids.getString("item_name")%></td>
			<td><%=mybids.getString("category_name")%></td>
			<td><%=mybids.getString("bid")%>$</td>
			<td><%=mybids.getString("closing_date_time")%></td>
			
		</tr>


		<%
		}
		
		%>
		
		</table>
		
		
		<br><br><br>
		<h2>My Automatic Bid Details</h2>
		<br>
		
		<table>
		<tr>
			<th>Item ID</th>
			<th>Item Name</th>
			<th>Category Name</th>
			<th>Closing Date Time</th>
			<th> Minimum Bid</th>
			<th> Maximum Bid</th>
			<th> Increments</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
		
		<%
		//parse out the results
		while (autobids.next()) {
			
			String item_id = autobids.getString("item_id");
		%>
		
		<tr>
			<td><%=item_id%></td>
			<td><%=autobids.getString("item_name")%></td>
			<td><%=autobids.getString("category_name")%></td>
			<td><%=autobids.getString("closing_date_time")%></td>
			<td><%=autobids.getString("min_bid")%>$</td>
			<td><%=autobids.getString("max_bid")%>$</td>
			<td><%=autobids.getString("increments")%>$</td>
			<td><form action="autobid_edit.jsp" method="post"
					style="display: inline;">

					<button class="viewbids" type="submit" name="item_id"
						value="<%=item_id%>">Edit</button>

			</form>
			</td>
			<td><form action="delete_autobid.jsp" method="post"
					style="display: inline;">

					<button class="placebid" type="submit" name="item_id"
						value="<%=item_id%>">Delete</button>

			</form>
			</td>
		</tr>


		<%
		}
		
		%>
		
		</table>
		
		
		
		
		<br><br><br>
		<h2>Reserved Items</h2>
		<br>
		
		<table>
		<tr>
			<th>Item ID</th>
			<th>Item Name</th>
			<th>Category Name</th>
			<th>Closing Date Time</th>
			<th>Highest Bid</th>
			<th>Reserve Value</th>
		</tr>
		
		<%
		//parse out the results
		while (reserved.next()) {
			
			String item_id = reserved.getString("item_id");
		%>
		
		<tr>
			<td><%=item_id%></td>
			<td><%=reserved.getString("item_name")%></td>
			<td><%=reserved.getString("category_name")%></td>
			<td><%=reserved.getString("closing_date_time")%></td>
			<td><%=reserved.getString("current_bid")%>$</td>
			<td><%=reserved.getString("reserve_value")%>$</td>
		</tr>


		<%
		}
		
		%>
		
		</table>
		<%
		db.closeConnection(con);
		%>

		<%
		} catch (Exception e) {
		out.print(e);
		}
		%>

	
	</div>
	
	

</body>
</html>
