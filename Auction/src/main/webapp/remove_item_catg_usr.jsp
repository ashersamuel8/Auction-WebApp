<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336project.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Remove</title>
</head>
			<%

				if(session.getAttribute("cr_username") == null){
					response.sendRedirect("login.jsp");
				}
			sellUpdate.update();
			
			
			
			
			ApplicationDB db = new ApplicationDB();
			Connection con = db.getConnection();
			
			
			String item_id = request.getParameter("item_id");
			String catg_id = request.getParameter("catg_id");
			String username = request.getParameter("username");
			
			if(item_id != null){
				
				PreparedStatement ps = con.prepareStatement("DELETE FROM item WHERE item_id = ?");
				ps.setString(1, item_id);
				ps.executeUpdate();
				db.closeConnection(con);
				response.sendRedirect("customerrepHomepage.jsp");
				
			}
			else if(catg_id != null){
				
				PreparedStatement ps = con.prepareStatement("DELETE FROM category WHERE category_id = ?");
				ps.setString(1, catg_id);
				ps.executeUpdate();
				db.closeConnection(con);
				response.sendRedirect("cr_catg.jsp");
			}
			else if(username != null){
				
				PreparedStatement ps = con.prepareStatement("DELETE FROM user WHERE username = ?");
				ps.setString(1, username);
				ps.executeUpdate();
				db.closeConnection(con);
				response.sendRedirect("cr_user.jsp");
				
				
			}
			
			
			
			
			
			
			
			
			
			
			
			
			%>


<body>

</body>
</html>
