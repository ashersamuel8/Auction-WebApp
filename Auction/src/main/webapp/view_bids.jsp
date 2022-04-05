<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336project.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>View Bid</title>
</head>
			<%

				if(session.getAttribute("username") == null){
					response.sendRedirect("login.jsp");
				}
			sellUpdate.update();
			%>
<style>

.nav{
	
		overflow: hidden;
		opacity: 0.8;
		
	}
	.nav a{
		
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
	.nav a:hover:not(.active){
		background-color: moccasin;
		color: black;
	}
	.nav a.active {
  		background-color: lightsalmon;
  		color: black;
	}
	.nav input{
	
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
	.nav input:focus{
		
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
  		transition-duration:0.2s;
	}
	input[type=submit]:hover{
		
		background-color: firebrick;
		cursor: pointer;
	
	}
	.place-bid-bar{
		 
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
	.place-bid-bar:focus{
		
		outline: none;
		
	}
	
	body{
	
		
		background-image: url('http://localhost:8080/Project_Group_91/Images/buy.jpg');
 		background-repeat: no-repeat;
  		background-attachment: fixed; 
  		background-size: cover;
  		
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
	.goback-button{
	
		padding: 8px;
		background: none;
		color: white;
		border: none;
		font-size: 14px;
		transition-duration: 0.3s;
	
	
	}
	.goback-button:hover{
	
			background-color: silver;
			color: black;
			cursor: pointer;
	
	
	}




</style>



<body>


	<div class="nav">
		<a href = "userHomepage.jsp">HOME</a>
		<a class="active" href = "buy.jsp">BUY</a>
		<a href = "sell.jsp">SELL</a>
		<a href = "my_products.jsp">MY PRODUCTS</a>
		<a href = "userInbox.jsp">INBOX</a>
		
		<a href = "Logout.jsp" style="float:right;">LOGOUT</a>
		<a href = "help.jsp" style="float:right;">HELP</a>
	</div>
	
	<br><br><br>
	
	<div class="item-info">
		
		<%
		
		try{
		
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		
		String item_id = request.getParameter("item_id");
		String str = "SELECT i.item_id, i.item_name, u.firstname, u.lastname, b.bid FROM item i, bids b, user u WHERE b.item_id = ? AND i.item_id = b.item_id AND b.username = u.username";
		PreparedStatement p1 = con.prepareStatement(str);
		p1.setString(1,item_id);
		ResultSet rs = p1.executeQuery(); 
		
		%>
			<table>
					<tr>
						<th>Item ID</th>
						<th>Item Name</th>
						<th>Name of Bidder</th>
						<th>Bid</th>
					</tr>
		
		<% 
		while(rs.next()){
			
				%>
					
					
					<tr>
						<td><%= rs.getString("item_id") %></td>
						<td><%= rs.getString("item_name") %></td>
						<td><%= rs.getString("firstname") %>, <%=rs.getString("lastname") %></td>
						<td><%= rs.getString("bid") %> $</td>					
					</tr>
					
				<% 
			
			
		}
		
			db.closeConnection(con);
		
		}
		catch(Exception e){
			
		}
		
		%>	
		
			</table>
					<br>
					<div style="text-align:center">
					<a href="buy.jsp"><button class="goback-button" type="submit">Go Back</button></a>
					</div>

	</div>
	


</body>
</html>