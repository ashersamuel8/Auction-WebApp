<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336project.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<style>
	 
 	h1{
  		font-family: "Lucida Console", Monaco, monospace;
	}
	
	table{
	
		font-family: "Courier New", monospace;
		color: white;
	
	}	
	
	body{
		background-image: url('http://localhost:8080/Project_Group_91/Images/login.jpg');
 		background-repeat: no-repeat;
  		background-attachment: fixed; 
  		background-size: cover;
  		opacity: 0.6;
  		
	}
	input{
		
		background-color: black;
		color: white;
		box-sizing: border-box;
		padding: 10px;
		font-size: 14px;
		
	}
	
	
	.button{
	
		
		padding: 10px;
		font-size: 14px;
		background-color: black;
		color: white;
	
	
	
	}



</style>





<body>
	
	<div align="right">
		
		<a href="employee_login.jsp"><button style="padding: 10px; font-size: 14px; margin: 10px; cursor: pointer;">Not a User?</button></a>
	
	</div>

	<div align="center">
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
		<h1 style="background-color: Transparent; color: white;"> User Login</h1>
		<form action="loginSuccess.jsp" method="post">
			<table>
				<tr>
					<td>Username:</td>
					<td><input type="text" name="username" placeholder="Enter Unsername"></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><input type="password" name="password" placeholder="Password"></td>
				</tr>
				<tr>
					<td></td>
					<td><input class="button" type="submit" value="Login"></button></td>
					<td><a href="register.jsp"><button style="font-size:14px; padding: 8px; background-color: black; color: white;" type="button">Sign Up</button></a></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>