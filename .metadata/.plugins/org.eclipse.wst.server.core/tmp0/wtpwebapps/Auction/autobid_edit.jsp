<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336project.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Automatic Bidding Edit</title>
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
}

.nav a {
	float: left;
	display: block;
	padding: 10px;
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

.nav button {
	padding: 6px 10px;
	margin-top: 8px;
	margin-right: 16px;
	background: #ddd;
	font-size: 17px;
	border: none;
	cursor: pointer;
	background-color: ivory;
}

.nav button:hover {
	background: #ccc;
}

table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	color: white;
	width: auto;
}

td, th, tr {
	border: none;
	text-align: left;
	padding: 8px;
	background-color: black;
	color: white;
}

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
}

input[type=submit]:hover {
	background-color: firebrick;
	cursor: pointer;
}

.place-bid-bar {
	width: 120px;
	padding: 6px 6px;
	margin: 2px 0;
	box-sizing: border-box;
	border: 1px solid;
	border-color: lightseagreen;
	background-color: transparent;
	color: white;
	font-size: 14px;
	text-align: center;
}

.place-bid-bar:focus {
	outline: none;
}

body {
	background-image:
		url('http://localhost:8080/Project_Group_91/Images/buy.jpg');
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: cover;
}

.item-info {
	margin: 8px;
	padding: 20px;
	color: white;
	background-color: black;
	opacity: 0.8;
	border-style: solid;
	border-color: ivory;
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

input[type=number] {
	font-size: 14px;
	background-color: transparent;
	color: white;
	font-family: inherit;
}
</style>



<body>


	<div class="nav">
		<a href="userHomepage.jsp">HOME</a> <a href="buy.jsp">BUY</a> <a
			href="sell.jsp">SELL</a> <a class="active" href="my_products.jsp">MY
			PRODUCTS</a> <a href="userInbox.jsp">INBOX</a> <a href="Logout.jsp"
			style="float: right;">LOGOUT</a>
			<a href = "help.jsp" style="float:right;">HELP</a>
	</div>

	<br>
	<br>
	<br>

	<div class="item-info">

		<%
		try {

			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();

			String item_id = request.getParameter("item_id");
			String username = String.valueOf(session.getAttribute("username"));
			String min_bid = request.getParameter("min_bid");
			String max_bid = request.getParameter("max_bid");
			String increments = request.getParameter("increments");

			String str = "SELECT item_id, item_name, category_name, current_bid, closing_date_time FROM item WHERE item_id = ? AND closing_date_time > now()";
			PreparedStatement p1 = con.prepareStatement(str);
			p1.setString(1, item_id);
			ResultSet rs = p1.executeQuery();
			if (rs.next() == false) {
				%>
				<script>
						alert("Auction Closed");
						window.location.href = "my_products.jsp";
				</script>

				<%
		} 
		else {
			do {

				
				if(min_bid != null && max_bid != null && increments != null){
					PreparedStatement ps2 = con.prepareStatement("UPDATE auto_bid SET increments = ?, min_bid = ?, max_bid = ? WHERE item_id = ? AND username = ?");
					ps2.setString(1, increments);
					ps2.setString(2, min_bid);
					ps2.setString(3, max_bid);
					ps2.setString(4, item_id);
					ps2.setString(5, username);
					ps2.executeUpdate();
					AutoBid.insert(item_id, username);
					response.sendRedirect("my_products.jsp");
				}
				
				String current_bid = rs.getString("current_bid");
		%>

		<form action="autobid_edit.jsp" method="post">
			<h2 style="color: lightcyan;">Item Info</h2>
			<table>

				<tr>
					<td>Item ID:&emsp;&emsp;</td>
					<td><%=rs.getString("item_id")%></td>
				</tr>
				<tr>
					<td>Item Name:&emsp;&emsp;</td>
					<td><%=rs.getString("item_name")%></td>
				</tr>
				<tr>
					<td>Category Name:&emsp;&emsp;</td>
					<td><%=rs.getString("category_name")%></td>
				</tr>
				<tr>
					<td>Current Bid:&emsp;&emsp;</td>
					<td><%=current_bid%> $</td>
				</tr>
				<tr>
					<td>Closing Date and Time:&emsp;&emsp;</td>
					<td><%=rs.getString("closing_date_time")%></td>
				</tr>
			</table>
			<h2 style="color: lightcyan;">Enter New Automatic Bid Values</h2>
			<table>

				<tr>
					<td>Minimum Bid:&emsp;&emsp;</td>
					<td><input type="number" name="min_bid" min="<%=current_bid%>"
						required>$</td>
				</tr>
				<tr>
					<td>Maximum Bid:&emsp;&emsp;</td>
					<td><input type="number" name="max_bid"
						min="<%=Integer.parseInt(current_bid) + 1%>" required>$</td>
				</tr>
				<tr>
					<td>Increments:&emsp;&emsp;</td>
					<td><input type="number" name="increments" min="1" required>$</td>
				</tr>



			</table>
			<br>
			<div style="text-align: center;">
				<input type="hidden" name="item_id" value="<%=item_id%>">
				<button class="submit-button" type="submit">Submit</button>
			</div>

		</form>


		<%
		
		
		} while (rs.next());

		}

		db.closeConnection(con);

		} catch (Exception e) {
		out.println(e);
		}
		%>

	</div>



</body>
</html>