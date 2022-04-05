<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336project.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Create Customer Rep</title>
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
	width:50%;
	
}

td, th {
	border: none
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
		<a class="active" href = "create_cr.jsp">REGISTER EMPLOYEE</a>
		<a href = "view_cr.jsp">VIEW EMPLOYEES</a>
		<a href="Logout.jsp" style="float: right;">LOGOUT</a>
	


		<%
		
			try{
				
				String cr_username = request.getParameter("cr_username");
				String cr_firstname = request.getParameter("cr_firstname");
				String cr_lastname = request.getParameter("cr_lastname");
				String employee_id = request.getParameter("employee_id");
				
				
				if(cr_username != null){
					
					ApplicationDB db = new ApplicationDB();
					Connection con = db.getConnection();
					
					String str = "SELECT cr_username FROM customerRep WHERE cr_username = ?";
					PreparedStatement test_username = con.prepareStatement(str);
					test_username.setString(1, cr_username);
					ResultSet test = test_username.executeQuery();
					
					
					if(test.next()){
						
						%>
						<script>
							alert("Username Already Exists");
							window.location.href = "create_cr.jsp";
						</script>
						<% 
						
						
					}
					else{
						
						
						String insert = "INSERT INTO customerRep VALUES(?, ?, ?, ?, ?)";
						
						PreparedStatement ps1 = con.prepareStatement(insert);
						ps1.setString(1, cr_username);
						ps1.setString(2, cr_firstname);
						ps1.setString(3, cr_lastname);
						ps1.setString(4, "customerrep"+employee_id);
						ps1.setString(5, employee_id);
						
						ps1.executeUpdate();
						
						response.sendRedirect("view_cr.jsp");
						
						
						
						
					}
					
					
					db.closeConnection(con);
					
				}
					
				
				
			}
			catch(Exception e){
				
				out.println(e);
			}
		
		
		
		
		%>



	</div>
	<br>
	<div style="background-color: black; opacity: 0.8; min-height: 650px; padding: 30px; position:relative; z-index: 1; color:white; font-family: Verdana, sans-serif">
	<form action="create_cr.jsp" method="post">
	<table>
	<tr>
	<td><label for="username">USERNAME: &emsp;&emsp;</label></td>
	<td><input id="username" typle="text" name="cr_username" style="background-color:black; color: white; font-size:12px;" required placeholder="Username"></td>
	</tr>
	<tr>
	<td><label for="firstname">FIRST NAME: &emsp;&emsp;</label></td>
	<td><input id="firstname" typle="text" name="cr_firstname" style="background-color:black; color: white; font-size:12px;" required placeholder="First Name"></td>
	</tr>
	<tr>
	<td><label for="lastname">LAST NAME: &emsp;&emsp;</label></td>
	<td><input id="lastname" typle="text" name="cr_lastname" style="background-color:black; color: white; font-size:12px;" required placeholder="Last Name"></td>
	</tr>
	<tr>
	<td><label for="employee_id">EMPLOYEE ID: &emsp;&emsp;</label></td>
	<%
		String employee_id = String.valueOf(GetID.getEmployeeID());	
	%>
	<td><%=employee_id%></td>
	</tr>
	</table>
	<br><br>
	<input type="hidden" name="employee_id" value="<%=employee_id%>">
	<div align="center"><button type="submit" class="submit-button">Submit</button></div>
	
	
	</form>
	
	
	</div>

</body>
</html>
