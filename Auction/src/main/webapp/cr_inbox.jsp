<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336project.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>CustomerRep Inbox</title>
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
	width: 100px;
	padding: 6px 6px;
	margin: 2px 0;
	box-sizing: border-box;
	border: none;
	background-color: floralwhite;
	color: black;
	font-size: 14px;
	transition-duration: 0.2s;
	verticle-align: bottom;
}

input[type=submit]:hover {
	background-color: lawngreen;
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
		<a href = "cr_user.jsp">USERS</a>
		<a  class="active" href="cr_inbox.jsp">INBOX</a>
		<a href="Logout.jsp" style="float: right;">LOGOUT</a>
	</div>
	<br>
	<br>
	
	<div style="background-color: black; opacity: 0.7; min-height: 650px; overflow-x:visible; padding: 20px; position:relative; z-index: 1; color: white; font-family: Lucida Console, Courier New, monospace;">
	<%

		try {

		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		String cr_username = String.valueOf(session.getAttribute("cr_username"));
		String answer = request.getParameter("answer");
		String q_id = request.getParameter("q_id");
		
		
		if(answer != null){
			
			
			PreparedStatement insert = con.prepareStatement("INSERT INTO answers(q_id, answer, answered_by) VALUES (?, ?, ?)");
			insert.setString(1, q_id );
			insert.setString(2, answer);
			insert.setString(3, cr_username);
			insert.executeUpdate();
			
		}
		
		PreparedStatement ps1 = con.prepareStatement("SELECT q.question, q.q_id, q.username FROM questions q WHERE q.q_id NOT IN ( SELECT q_id FROM answers)");
		ResultSet rs1 = ps1.executeQuery();
		
		PreparedStatement ps2 = con.prepareStatement("SELECT q.question, a.answer, q.username FROM questions q, answers a WHERE q.q_id = a.q_id AND a.answered_by = ?");
		ps2.setString(1, cr_username);
		ResultSet rs2 = ps2.executeQuery();
		
		%>
		
		<h2>QUESTIONS</h2>
		<div style="overflow-y: scroll; overflow-x: visible; max-height: 450px; border: 1px solid white; padding: 10px;">
		<%
		
		while(rs1.next()){
		%>
				QUESTION BY: <%=rs1.getString("username")%><br><br>
				QUESTION:   <div> <%=rs1.getString("question")%></div>	
				<br>
				ANSWER:<br> 
				<form action="cr_inbox.jsp" method="post" align="left">
					<textarea name="answer" rows="1" cols="1" style="width: 400px; height: 100px; resize:none; font-size:14px; background-color: black; color: white;" required></textarea>
					<br>
					<br>
					<input type="hidden" name="q_id" value="<%=rs1.getString("q_id")%>">
					<input type="submit">
					</form>
			
			
			<br>
			<hr>
		<%
		}
		%>
		</div>
	
		<br><br>
		<h2>QUESTIONS ANSWERED BY ME</h2>
		<div style="overflow-y: scroll; overflow-x: visible; max-height: 450px; border: 1px solid white; padding: 10px;">
		<%
		
		while(rs2.next()){
		%>
				QUESTION: <div><%=rs2.getString("question")%></div>
				<br>
				ANSWER: <div><%=rs2.getString("answer")%></div>
				<br>
				ASKED BY: <%=rs2.getString("username") %>
				<br>
				<hr>
		<%
		}
		%>
		</div>
		<%
		
		
		
	

		db.closeConnection(con);
		
		} catch (Exception e) {
			System.out.print(e);
		}
	
	
	%>




</div>

</body>
</html>
