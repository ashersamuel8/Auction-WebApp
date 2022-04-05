<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336project.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
<%
 try { 
	

	 if(session.getAttribute("username") != null){
			
			session.setAttribute("username", null);
			/* response.sendRedirect("login.jsp"); */
	}
    sellUpdate.update();
    
    response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); 
 	response.setHeader("Pragma","no-cache"); 
  	response.setDateHeader ("Expires", 0); 
    session.invalidate(); 
    response.sendRedirect("login.jsp");
}
	catch(Exception ex) {
    out.println(ex);
	} 


%>
</html>	