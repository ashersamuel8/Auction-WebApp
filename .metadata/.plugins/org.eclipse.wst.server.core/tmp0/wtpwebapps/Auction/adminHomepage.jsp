<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336project.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Admin Homepage</title>
</head>
			<%

				if(session.getAttribute("admin") == null){
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
		url('http://localhost:8080/Project_Group_91/Images/adminHomepage.jpg');
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
		<a class="active" href="adminHomepage.jsp">SALES REPORT</a> 
		<a href = "create_cr.jsp">REGISTER EMPLOYEE</a>
		<a href = "view_cr.jsp">VIEW EMPLOYEES</a>
		<a href="Logout.jsp" style="float: right;">LOGOUT</a>
	

	</div>


	<%
	try {

		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		
		Statement st1 = con.createStatement();
		Statement st2 = con.createStatement();
		Statement st3 = con.createStatement();
		Statement st4 = con.createStatement();
		Statement st5 = con.createStatement();
		Statement st6 = con.createStatement();
		Statement st7 = con.createStatement();
		
		String str1 = "SELECT SUM(sale_price) total_sales FROM purchased";
		String str2 = "SELECT SUM(sale_price)/COUNT(item_id) avg_sales FROM purchased;";
		String str3 = "SELECT SUM(p.sale_price)/COUNT(p.item_id) avg_sales_per_item, i.item_name FROM purchased p, item i WHERE i.item_id = p.item_id GROUP BY i.item_name";
		String str4 = "SELECT SUM(p.sale_price)/COUNT(p.item_id) avg_sales_per_catg, i.category_name FROM purchased p, item i WHERE i.item_id = p.item_id GROUP BY i.category_name";
		String str5 = "SELECT SUM(sale_price)/COUNT(item_id) avg_sales_per_user, purchased_by FROM purchased GROUP BY purchased_by";
		String str6 = "SELECT COUNT(i.item_name) best_selling, i.item_name, i.category_name FROM item i, purchased p WHERE i.item_id = p.item_id GROUP BY i.item_name, i.category_name ORDER BY best_selling DESC";
		String str7 = "SELECT COUNT(item_id) best_buyers, purchased_by FROM purchased GROUP BY purchased_by ORDER BY best_buyers;";
		
		
		ResultSet total_sales = st1.executeQuery(str1);
		ResultSet avg_sales = st2.executeQuery(str2);
		ResultSet avg_sales_per_item = st3.executeQuery(str3);
		ResultSet avg_sales_per_catg = st4.executeQuery(str4);
		ResultSet avg_sales_per_user = st5.executeQuery(str5);
		ResultSet best_selling = st6.executeQuery(str6);
		ResultSet best_buyers = st7.executeQuery(str7);
		
		
		%>
		
	<br>
	<div style="background-color: black; opacity: 0.8; min-height: 650px; padding: 30px; position:relative; z-index: 1; color:white; font-family: Verdana, sans-serif">
	
	<label for="total_earnings">TOTAL SALES: &emsp;&emsp;</label>
	<%
		if(total_sales.next()){
		%>
			<%=total_sales.getString("total_sales")%> $
		<%	
		}
	
	%>	
	<br>
	<br>	
	<label for="avg_sales">AVERAGE SALES: &emsp;&emsp;</label>
	<%
		if(avg_sales.next()){
		%>
			<%=avg_sales.getString("avg_sales")%> $
		<%	
		}
	
	%>	
	<br>
	<br>
	<label for="avg_sales_per_item">AVERAGE SALES PER ITEM: &emsp;&emsp;</label>
	<br><br>
	<table id="avg_sales_per_item">
		
		<th>Item Name</th>
		<th>Average Sales</th>
		
	<%
	
		while(avg_sales_per_item.next()){
			
		%>	
			
			<tr>
				<td><%=avg_sales_per_item.getString("item_name")%></td>
				<td><%=avg_sales_per_item.getString("avg_sales_per_item")%> $</td>			
			
			</tr>			
			
		<% 	
		}
	
	%>
	</table>
	<br><br>
	<label for="avg_sales_per_catg">AVERAGE SALES PER CATEGORY: &emsp;&emsp;</label>
	<br><br>
	<table id="avg_sales_per_catg">
		
		<th>Category Name</th>
		<th>Average Sales</th>
		
	<%
	
		while(avg_sales_per_catg.next()){
			
		%>	
			
			<tr>
				<td><%=avg_sales_per_catg.getString("category_name")%></td>
				<td><%=avg_sales_per_catg.getString("avg_sales_per_catg")%> $</td>			
			
			</tr>			
			
		<% 	
		}
	
	%>
	</table>
	<br><br>
	<label for="avg_sales_per_user">AVERAGE SALES PER USER: &emsp;&emsp;</label>
	<br><br>
	<table id="avg_sales_per_user">
		
		<th>Username</th>
		<th>Average Sales</th>
		
	<%
	
		while(avg_sales_per_user.next()){
			
		%>	
			
			<tr>
				<td><%=avg_sales_per_user.getString("purchased_by")%></td>
				<td><%=avg_sales_per_user.getString("avg_sales_per_user")%> $</td>			
			
			</tr>			
			
		<% 	
		}
	
	%>
	</table>
	<br><br>
	<label for="best_selling">BEST SELLING PRODUCTS: &emsp;&emsp;</label>
	<br><br>
	<table id="best_selling">
		
		<th>Item Name</th>
		<th>Category</th>
		<th>Number of Sales</th> 
		
	<%
		int x = 0;
		while(best_selling.next() && x < 5){
			
		%>	
			
			<tr>
				<td><%=best_selling.getString("item_name")%></td>
				<td><%=best_selling.getString("category_name")%></td>	
				<td><%=best_selling.getString("best_selling")%></td>		
			
			</tr>			
			
		<% 	
		
		x++;
		}
	
	%>
	</table>
	<br><br>
	<label for="best_buyers">BEST BUYERS: &emsp;&emsp;</label>
	<br><br>
	<table id="best_selling">
		
		<th>Buyer Name</th>
		<th>Number of Items Purchased</th> 
		
	<%
		int y = 0;
		while(best_buyers.next() && y < 5){
			
		%>	
			
			<tr>
				<td><%=best_buyers.getString("purchased_by")%></td>	
				<td><%=best_buyers.getString("best_buyers")%></td>		
			
			</tr>			
			
		<% 	
		
		y++;
		}
	
	%>
	</table>
	<br><br>
	

	</div>
		
		
		<%
				
		
		db.closeConnection(con);
		
		
		}catch(Exception e){
			
			System.out.println(e);
			
			
		}
		
		
	%>


</body>
</html>
