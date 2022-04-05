<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336project.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
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
	<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Get parameters from the HTML form at the index.jsp
		String newUsername = request.getParameter("username");
		String newPassword1 = request.getParameter("password1");
		String newPassword2 = request.getParameter("password2");
		String first_name = request.getParameter("firstname");
		String last_name = request.getParameter("lastname"); 
		
		if(newUsername.startsWith("customerrep") || newUsername.startsWith("admin")){
			
			%>
			<script>
			alert("Username Not Allowed");
			window.location.href = "login.jsp";
			</script>
			<% 
		}
		else{
			
		
		
		PreparedStatement ps1 = con.prepareStatement("Select username from user where username = ?");
  		ps1.setString(1, newUsername);
  		ResultSet rs = ps1.executeQuery(); 
  		if(rs.next()){           
  			%>
			<script>
				alert("Username Already Exists");
				window.location.href = "register.jsp";
			</script>
			<%  
  		}
  		else{
         
	

			if(newPassword1.equals(newPassword2)){
	
				String insert = "INSERT INTO user(username, password, firstname,lastname)"
						+ "VALUES (?,?,?,?)";

				PreparedStatement ps2 = con.prepareStatement(insert);


				ps2.setString(1, newUsername);
				ps2.setString(2, newPassword1);
				ps2.setString(3, first_name);
				ps2.setString(4, last_name);
				ps2.executeUpdate();
				
				response.sendRedirect("login.jsp");
			}
			else{
				%>
				<script>
				alert("Passwords Dont Match");
				window.location.href = "register.jsp";
				</script>
				<% 
			}
	
  		}
		
		
		
  		
	}	
		db.closeConnection(con);
		
	} catch (Exception ex) {
		out.print(ex);
		out.print("insert failed");
	}
	

%>
