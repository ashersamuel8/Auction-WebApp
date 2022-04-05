<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336project.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>My Products</title>
</head>

			<%

				if(session.getAttribute("username") == null){
					response.sendRedirect("login.jsp");
				}
			sellUpdate.update();
			%>
<body>

<%

	try{
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		
		String item_id = request.getParameter("item_id");
		String username = String.valueOf(session.getAttribute("username"));
		
		PreparedStatement ps = con.prepareStatement("DELETE FROM auto_bid WHERE item_id = ? AND username = ?");
		ps.setString(1, item_id);
		ps.setString(2, username);
		ps.executeUpdate();
		
		db.closeConnection(con);
		
		response.sendRedirect("my_products.jsp");
		
	}
	catch(Exception e){
		System.out.println(e);
	}



%>

</body>
</html>
