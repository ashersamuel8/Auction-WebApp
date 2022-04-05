<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336project.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>View Customer Rep</title>
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
	width:100%;
	
}

td, th {
	border: 1px solid grey;
	text-align: center;
	padding: 10px;
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
.submit-button{
	
		padding: 8px;
		background: none;
		color: white;
		border: none;
		font-size: 14px;
		transition-duration: 0.3s;
	
	
}
.submit-button:hover{
	
		background-color: limegreen;
		color: black;
		cursor: pointer;

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
		<a href="adminHomepage.jsp">SALES REPORT</a> 
		<a href = "create_cr.jsp">REGISTER EMPLOYEE</a>
		<a class="active" href = "view_cr.jsp">VIEW EMPLOYEES</a>
		<a href="Logout.jsp" style="float: right;">LOGOUT</a>
	


		



	</div>
	<br>
	<div style="background-color: black; opacity: 0.8; min-height: 650px; padding: 30px; position:relative; z-index: 1; color:white; font-family: Verdana, sans-serif">
		<table>
		
			<th>Employee Username</th>
			<th>Employee First Name</th>
			<th>Employee Last Name</th>
			<th>Employee ID</th>
		
		<%
		
			try{
				
				ApplicationDB db = new ApplicationDB();
				Connection con = db.getConnection();
				
				String str = "SELECT cr_username, cr_firstname, cr_lastname, employee_id FROM customerRep";
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery(str);
				
				while(rs.next()){
					
				%>
					
				<tr>
					
					<td><%=rs.getString("cr_username")%></td>
					<td><%=rs.getString("cr_firstname")%></td>
					<td><%=rs.getString("cr_lastname")%></td>
					<td><%=rs.getString("employee_id")%></td>
				
			
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
	
	</div>

</body>
</html>
