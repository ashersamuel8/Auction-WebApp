<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336project.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>HELP</title>
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
	width: 70px;
	padding: 6px 6px;
	margin: 2px 0;
	box-sizing: border-box;
	border: none;
	background-color: bisque;
	color: black;
	font-size: 14px;
	transition-duration: 0.2s;
	align: center;
}

input[type=submit]:hover {
	background-color: burlywood;
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
		<a href="userHomepage.jsp">HOME</a> <a href="buy.jsp">BUY</a>
		<a href="sell.jsp">SELL</a> 
		<a href = "my_products.jsp">MY PRODUCTS</a>
		<a  href="userInbox.jsp">INBOX</a>
	
		<a href="Logout.jsp" style="float: right;">LOGOUT</a>
		<a class="active" href = "help.jsp" style="float:right;">HELP</a>
		
	</div>
	<br><br>
	<%
	
		try{
					
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();
			
			String question = request.getParameter("question");
			String username = String.valueOf(session.getAttribute("username"));
			
			if(question != null){
				
				PreparedStatement ps = con.prepareStatement("INSERT INTO questions(q_id, question, username) VALUES (?, ?, ?)");
				ps.setString(1, String.valueOf(GetID.getQ_ID()));
				ps.setString(2, question);
				ps.setString(3, username);
				ps.executeUpdate();
				%>
				<div style="padding: 10px; min-height: 400px; background-color: black; opacity:0.7; font-family: Lucida Console, Courier New, monospace; color: white;">
					
					<h2 align="center">Your question has been submitted. We'll get back to you soon. Thank you!</h2>
				
				</div>
				<%
				
			}
			else{
				
				%>
				
					<div style="padding: 10px; min-height: 400px; background-color: black; opacity:0.7; font-family: Lucida Console, Courier New, monospace;color: white;">
	
					<h2 align="center">Got a Question? Ask Us:</h2>
					<br>
					<br>
					<form action="help.jsp" method="post" align="center">
					<textarea name="question" rows="1" cols="1" style="width: 400px; height: 100px; resize:none; font-size:14px; background-color: black; color: white;" required></textarea>
					<br>
					<br>
					<input type="submit">
					</form>
					</div>
								
				
				<%
				
			}
			
			
			
			
			
			db.closeConnection(con);
			
			
			
			
			
			
		}
		catch(Exception e){
			out.println(e);
		}
	
	
	
	
	
	%>
	
	


</body>
</html>
