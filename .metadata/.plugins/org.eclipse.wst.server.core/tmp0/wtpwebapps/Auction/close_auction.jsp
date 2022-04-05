<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336project.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Close Auction</title>
</head>
			<%

				if(session.getAttribute("cr_username") == null){
					response.sendRedirect("login.jsp");
				}
			sellUpdate.update();
			
			
			
			try{
				ApplicationDB db = new ApplicationDB();
				Connection con = db.getConnection();
			
			
				String item_id = request.getParameter("item_id");
	
;			
			
				
				PreparedStatement ps = con.prepareStatement("UPDATE item SET closing_date_time = now() WHERE item_id = ?");
				ps.setString(1, item_id);
				ps.executeUpdate();
				db.closeConnection(con);
				response.sendRedirect("customerrepHomepage.jsp");
				
			}
			catch(Exception e){
				out.println(e);
			}

			
			
			
		
			
			
			%>


<body>

</body>
</html>
