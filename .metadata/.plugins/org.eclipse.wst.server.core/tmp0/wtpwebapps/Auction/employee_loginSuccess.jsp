<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336project.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%


	try{



      		ApplicationDB db = new ApplicationDB();
      		Connection con = db.getConnection();


      		 String username_target = request.getParameter("username");
       		 String password_target = request.getParameter("password");
       		 ResultSet rs;
      			
       		 if(username_target.equals("admin") && password_target.equals("admin")){
       			 
       			session = request.getSession();
      			session.setAttribute("admin",username_target);
      			sellUpdate.update();
      			
                
                response.sendRedirect("adminHomepage.jsp");
       			 
       			 
       		 }
       		 else{
       		 
       		 
      		 	PreparedStatement ps = con.prepareStatement("Select cr_username, cr_password from customerRep where cr_username = ? and cr_password= ?");
      	   	 	ps.setString(1, username_target);
      		 	ps.setString(2, password_target);
      		 	rs = ps.executeQuery();
      		
       		 
      			if(rs.next()){
                
      				session = request.getSession();
      				session.setAttribute("cr_username",username_target);
      				sellUpdate.update();
              	    response.sendRedirect("customerrepHomepage.jsp");

						
      			}
           	 	else{
                	out.println("Invalid Credentials");
            	}
      			
       		}

      		db.closeConnection(con);

   		}
   		catch(Exception e){
      		 out.println(e);
  		 }
	%>



</body>
</html>
