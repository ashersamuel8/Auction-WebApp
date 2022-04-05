<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336project.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title> Employee Login</title>
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
		background-image: url('http://localhost:8080/Project_Group_91/Images/employee_login.JPG');
 		background-repeat: no-repeat;
  		background-attachment: fixed; 
  		background-size: cover;
  	
  		
	}
	input{
		
		background-color: black;
		color: white;
		box-sizing: border-box;
		padding: 10px;
		font-size: 14px;
		
	}
	
	
	.button{
	
		
		padding: 8px;
		font-size: 14px;
		background-color: black;
		color: white;
		width: 80px;
	
	
	
	}



</style>





<body>
<div align="right">
		
		<a href="login.jsp"><button style="padding: 10px; font-size: 14px; margin: 10px; cursor: pointer; background-color: black; opacity: 0.7; color: white; border:none;">Not an Employee?</button></a>
	
</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<div align="center" style="background-color: black; opacity: 0.7; height: 400px; width: 500px; padding: 20px; margin-left: auto; margin-right: auto;">
	
		<h1 style="color: white;"> Employee Login</h1>
		<form action="employee_loginSuccess.jsp" method="post">
			<table>
				<tr>
					<td>Username:</td>
					<td><input type="text" name="username" placeholder="Enter Unsername"></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><input type="password" name="password" placeholder="Password"></td>
				</tr>
				<tr></tr>
				<tr>
					<td></td>
					<td><input class="button" type="submit" value="Login"></button></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>