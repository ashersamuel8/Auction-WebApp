<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336project.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Customerrep Category</title>
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
		<a href="customerrepHomepage.jsp">AUCTIONS</a> 
		<a class="active" href="cr_catg.jsp">CATEGORY</a> 
		<a href = "cr_user.jsp">USERS</a>
		<a href="cr_inbox.jsp">INBOX</a>
		<form style="display: inline;">
		<div class="dropdown">
					<button class="category">FILTER</button>
				<div class="dropdown_cnt">
				
					<button onclick="cr_catg.jsp" name="sort_filter" value="with">Categories with Items</button>
					<button onclick="cr_catg.jsp" name="sort_filter" value="without">Categories Without Items</button>

	
								
				</div>			
		</div>
		</form>
		
		
		
		
		<form action="cr_catg.jsp" method="post" style="display: inline;">
			<input type="text" style="vertical-align: top; width: 400px;" placeholder="Search Category.." name="search">
			<button type="submit" class="searchbutton">Search</button>
		</form>
		<a href="Logout.jsp" style="float: right;">LOGOUT</a>
	</div>

	<%
	try {

		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		String sort_filter = request.getParameter("sort_filter");
		String search = request.getParameter("search");
		ResultSet result;
		
	
		if(search != null){
			
			String str ="SELECT * FROM category WHERE category_name LIKE '%"+search+"%'";
			PreparedStatement ps3 = con.prepareStatement(str);
			result = ps3.executeQuery();
			//System.out.println(search + "3");
		}
		else if(sort_filter != null){
			
			if(sort_filter.equals("with")){
				
				String str ="SELECT c.category_id, c.category_name, count(i.item_id) 'Number_of_Products' FROM category c, item i WHERE c.category_name = i.category_name GROUP BY c.category_name";
				PreparedStatement ps3 = con.prepareStatement(str);
				result = ps3.executeQuery();

			}
			else{
				
				String str ="SELECT DISTINCT c.category_id, c.category_name FROM category c, item i WHERE c.category_name != i.category_name";
				PreparedStatement ps3 = con.prepareStatement(str);
				result = ps3.executeQuery();
				
				
			}
			
			
		}
		else{
			
			
			Statement stmt = con.createStatement();
			String str = "SELECT * FROM category";
			result = stmt.executeQuery(str);
			//System.out.println("4");
		
		}
		
		
	%>
	<br>
	<div style="background-color: black; opacity: 0.7; min-height: 650px; padding: 30px; position:relative; z-index: 1;">
	<table>
		<tr>
			
			<th>Category ID</th>
			<th>Category Name</th>
			<% 
		
		if(sort_filter != null && sort_filter.equals("with")){
			%>
			
			<th>Number of Products</th>
			
			<%
		}
		
		%>	
			
			<th>Remove Category</th>
			
		</tr>

		<%
		//parse out the results
		while (result.next()) {

		String category_id = result.getString("category_id");
		%>
		<tr>
			
			<td><%=category_id%></td>
			<td><%=result.getString("category_name")%></td>
		<% 
		
		if(sort_filter != null && sort_filter.equals("with")){
			%>
			
			<td><%=result.getString("Number_of_Products") %></td>
			
			<%
		}
		
		%>	
			
			<td>
				<form action="remove_item_catg_usr.jsp" method="post"
					style="display: inline;">

					<button class="remove" type="submit" name="catg_id"
						value="<%=category_id%>">Remove</button>

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
