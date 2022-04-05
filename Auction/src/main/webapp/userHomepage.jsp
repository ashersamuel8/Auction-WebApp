<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336project.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>User Homepage</title>
</head>
<!-- <style>

.button{

  border: 2px solid black;
  color: black;
  padding: 16px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
  background-color: white;

 }
 .buttonHover:hover{

   background-color: #4CAF50;
   color: white;
   border-color: #4CAF50;

 }




</style>
<body>

	<div align = "right">
	<a href = "Logout.jsp"><button type="submit">Logout</button></a>
	</div>

	<div align = "center">

	<h2 style = "padding:50px;">Welcome! Please select an option:</h2>


	<a href="buy.jsp"><button class="button buttonHover">Buy</button></a>
	<a href="sell.jsp"><button class="button buttonHover">Sell</button></a>


	</div> */



</body> --><%

				if(session.getAttribute("username") == null){
					response.sendRedirect("login.jsp");
				}
			sellUpdate.update();
			%>
<style>

	.nav{
	
		overflow: hidden;
		background-color: transparent;
		
	}
	.nav a{
		
		float: left;
		display: block;
  		padding: 10px;
  		background-color: transparent;
  		font-family: verdana;
  		font-size: 14px;
  		transition-duration: 0.4s;
  		color: white;
  		text-align: center;
  		padding: 14px 16px;
  		text-decoration: none;


	}
	.nav a:hover:not(.active){
		background-color: #dddddd;
		color: midnightblue;
	}
	.nav a.active {
  		background-color: lightcoral;
  		color: black;
	}
	.nav input{
	
		float: center;
  		padding: 6px;
  		margin-top: 8px;
  		margin-right: 4px;
  		margin-left: 16px;
  		border: none;
  		font-size: 17px;
		width: 500px;
	
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
	}

	.nav button:hover {
  		background: white;
	}
	body{
	
		
		background-image: url('http://localhost:8080/Project_Group_91/Images/userHomepage.jpg');
 		background-repeat: no-repeat;
  		background-attachment: fixed; 
  		background-size: cover;
  		opacity: 0.6;
  		
	
	}
	
	
	
	

</style>
<body>
	
	<div class="nav">
	


		<a class="active" href = "userHomepage.jsp">HOME</a>
		<a href = "buy.jsp">BUY</a>
		<a href = "sell.jsp">SELL</a>
		<a href = "my_products.jsp">MY PRODUCTS</a>
		<a href = "userInbox.jsp">INBOX</a>
		
		
		<a href = "Logout.jsp" style="float:right;">LOGOUT</a>
		<a href = "help.jsp" style="float:right;">HELP</a>



	
	</div>
	
	<p align="center" style="color:white; font-size: 30px; font-family: 'Courier New', monospace;"><br><br><br><br><br><br><br>
	<i><b>Welcome</i></b></p>



</body>
</html>
