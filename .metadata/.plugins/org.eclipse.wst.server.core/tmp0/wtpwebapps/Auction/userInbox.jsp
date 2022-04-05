<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336project.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>INBOX</title>
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
		<a href="userHomepage.jsp">HOME</a> <a href="buy.jsp">BUY</a>
		<a href="sell.jsp">SELL</a> 
		<a href = "my_products.jsp">MY PRODUCTS</a>
		<a class="active" href="userInbox.jsp">INBOX</a>
	
		<a href="Logout.jsp" style="float: right;">LOGOUT</a>
		<a href = "help.jsp" style="float:right;">HELP</a>
		
	</div>
	<br><br>
	
	<%
			try{
				
				ApplicationDB db = new ApplicationDB();
				Connection con = db.getConnection();
				
				String username =  String.valueOf(session.getAttribute("username"));
				
				PreparedStatement ps1 = con.prepareStatement("SELECT i.item_id, i.item_name, i.category_name, i.closing_date_time, p.sale_price, u.lastname, u.firstname FROM purchased p, item i, sell_list s, user u WHERE p.purchased_by = ? AND i.item_id = p.item_id AND i.item_id = s.item_id AND u.username = s.seller ORDER BY i.closing_date_time DESC");
				ps1.setString(1, username);
				ResultSet purchased = ps1.executeQuery();
								
				
				PreparedStatement ps2 = con.prepareStatement("SELECT q.question, a.answer, c.cr_firstname, c.cr_lastname FROM questions q, answers a, customerRep c WHERE q.q_id = a.q_id AND q.username = ? AND c.cr_username = a.answered_by");
				ps2.setString(1, username);
				ResultSet inbox = ps2.executeQuery();
				
				%>
					
			<div style="padding: 10px; background-color: black; opacity:0.7; font-family: Lucida Console, Courier New, monospace;color: white;">
	
				<h2>Recently Won Bids</h2>
				<div style="padding:10px; border: 1px solid white;">
				<%
				
				while(purchased.next()){
				%>
					<p> Congratulations! You just won the auction for item "<%=purchased.getString("item_name")%>" which belongs to the category <%=purchased.getString("category_name")%> on <%=purchased.getString("closing_date_time")%>. This Item was sold to you for <%=purchased.getString("sale_price")%> $ by <%=purchased.getString("firstname")%> <%=purchased.getString("lastname")%>. For more info, go to "My Products"</p>	
					<br>
				<%
				}
				%>
				</div>
				<br>
				<h2>INBOX</h2>
				<div style="padding:10px; border: 1px solid white;">
				<%
				
				while(inbox.next()){
				%>
						QUESTION: <br><div><%=inbox.getString("question")%></div>
						<br>
						ANSWER: <div><%=inbox.getString("answer")%></div>
						<br>
						ANSWERED BY: <div><%=inbox.getString("cr_firstname")%>, <%=inbox.getString("cr_lastname")%></div>
						<hr>
				<%
				}
				%>
				</div>
	
	
			</div>
	
				
				
				
				
				<% 
				db.closeConnection(con);
				
			}
			catch(Exception e){
				
				out.println(e);
			}
	
	
	
	
	%>



</body>
</html>
