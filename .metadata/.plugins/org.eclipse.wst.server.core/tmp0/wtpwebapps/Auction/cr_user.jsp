<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336project.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Customerrep User</title>
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
		<a href="cr_catg.jsp">CATEGORY</a> 
		<a class="active"  href = "cr_user.jsp">USERS</a>
		<a href="cr_inbox.jsp">INBOX</a>
		
		
	
		
		
		
		<form action="cr_user.jsp" method="post" style="display: inline;">
			<input type="text" style="vertical-align: top; width: 400px;" placeholder="Search.." name="search">
			<button type="submit" class="searchbutton">Search</button>
		</form>
		<a href="Logout.jsp" style="float: right;">LOGOUT</a>
	</div>

	<%
	try {

		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		String search = request.getParameter("search");
		ResultSet result;
		
		if(search != null){
			
			String str ="SELECT * FROM user WHERE username LIKE '%"+search+"%' OR firstname LIKE '%"+search+"%' OR lastname LIKE '%"+search+"%'";
			PreparedStatement ps3 = con.prepareStatement(str);
			result = ps3.executeQuery();
			//System.out.println(search + "3");
		}
		else{
			
			
			Statement stmt = con.createStatement();
			String str = "SELECT * FROM user";
			result = stmt.executeQuery(str);
			//System.out.println("4");
		
		}
		
		
	%>
	<br>
	<div style="background-color: black; opacity: 0.7; min-height: 650px; padding: 30px; position:relative; z-index: 1;">
	<table>
		<tr>
			<th>Username</th>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Remove User</th>
			
			
		</tr>

		<%
		//parse out the results
		while (result.next()) {
		%>
		<%
		String username = result.getString("username");
		%>
		<tr>
			<td><%=username%></td>
			<td><%=result.getString("firstname")%></td>
			<td><%=result.getString("lastname")%></td>
			<td>
				<form action="remove_item_catg_usr.jsp" method="post"
					style="display: inline;">

					<button class="remove" type="submit" name="username"
						value="<%=username%>">Remove</button>

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
