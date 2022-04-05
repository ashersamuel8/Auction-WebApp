<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336project.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Add Category</title>
</head>
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

input[type=text]{

   	font-size: 14px;
   	background-color: transparent;
   	color:white;
   	font-family: inherit;

}
body {
	background-image:
		url('http://localhost:8080/Project_Group_91/Images/buy.jpg');
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-size: cover;
	font-family: Verdana, Geneva, sans-serif;
}

.item-info {
	margin: 8px;
	padding: 20px;
	color: white;
	background-color: black;
	opacity: 0.8;
	border-style: solid;
	border-color: ivory;
	font-family: Helvetica, Arial, sans-serif;
	font-size: 16px;
	text-align: center;
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

			<%

				if(session.getAttribute("username") == null){
					response.sendRedirect("login.jsp");
				}
			sellUpdate.update();

			%>
<body>

	<div class="nav">
		<a href="userHomepage.jsp">HOME</a> 
		<a href="buy.jsp">BUY</a> 
		<a class="active" href="sell.jsp">SELL</a>
		<a href = "my_products.jsp">MY PRODUCTS</a>
		 <a href="userInbox.jsp">INBOX</a>
		
		
		<a href="Logout.jsp" style="float: right;">LOGOUT</a>
		<a href = "help.jsp" style="float:right;">HELP</a>
	</div>

	
	<%
	
		try{
			
			String category_name = request.getParameter("category_name");
			
			if(category_name != null){
				
				
				ApplicationDB db = new ApplicationDB();
				Connection con = db.getConnection();
				
				Statement stmt = con.createStatement();
				
				String str = "SELECT category_name FROM category";
				
				ResultSet rs =  stmt.executeQuery(str);
				
				while(rs.next()){
					
					String catg_name = rs.getString("category_name");
					if(catg_name.equals(category_name)){
						
						%>
						<script>
							alert("Category Already Exists");
							window.location.href = "sell.jsp";
						</script>
						<%
						break;
					}
					
				}
				
				int category_id = GetID.getCategoryID();
				
				String insert = "INSERT INTO category (category_id, category_name) VALUES (? ,?)";
				PreparedStatement p = con.prepareStatement(insert);
				p.setString(1, String.valueOf(category_id));
				p.setString(2, category_name);
				p.executeUpdate();
				
				db.closeConnection(con);
				
				response.sendRedirect("sell.jsp");
				
			}
			
			
			
		}
		catch(Exception e){
			
			out.println(e);
		}
	
	
	
	
	%>
	
	
	
	
	
	<div class="item-info">
	<form method="post" action = "add_category.jsp">
		<label for="catg_name">Category Name: &emsp;&emsp;</label>
		<input type="text" name="category_name" id="catg_name" required><br><br>
		<a href="sell.jsp"><button class="goback-button" type="button">Go Back</button></a>
		<button type="submit" class = "submit-button">Submit</button>
		
	</form>
	</div>



</body>
</html>