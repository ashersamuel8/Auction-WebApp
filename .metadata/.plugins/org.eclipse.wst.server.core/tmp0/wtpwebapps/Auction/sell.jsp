<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336project.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<title>Sell</title>
</head>
			<%

				if(session.getAttribute("username") == null){
					response.sendRedirect("login.jsp");
				}
			sellUpdate.update();

			%>
<style>
.nav {
	overflow: hidden;
	opacity: 0.8;
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

table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	color: white;
	width: auto;
}

td, th, tr {
	border: none;
	text-align: left;
	padding: 8px;
	background-color: black;
	color: white;
}

}
input[type=submit] {
	width: 75%;
	padding: 6px 6px;
	margin: 2px 0;
	box-sizing: border-box;
	border: none;
	background-color: indianred;
	color: white;
	font-size: 14px;
	transition-duration: 0.2s;
}

input[type=submit]:hover {
	background-color: firebrick;
	cursor: pointer;
}
input[type=text]{

   	font-size: 14px;
   	background-color: transparent;
   	color:white;
   	font-family: inherit;

}
input[type=number]{

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
.dropdown{

	background-color: transparent;
	color: white;
	font-size: 14px;
	width: 200px;

}
.dropdown:focus{

	outline: none;
}
input:focus { 
    outline: none;
   
}


</style>



<body>


	<div class="nav">
		<a href="userHomepage.jsp">HOME</a> <a href="buy.jsp">BUY</a> <a
			class="active" href="sell.jsp">SELL</a><a href = "my_products.jsp">MY PRODUCTS</a>
			 <a href="userInbox.jsp">INBOX</a>
		
		<a href="Logout.jsp" style="float: right;">LOGOUT</a>
		<a href = "help.jsp" style="float:right;">HELP</a>
	</div>

	<br>
	<br>
	<br>

	<div class="item-info">
	<form method="post" action = "addItem.jsp">
		<table>
			
			<td><label for="category">Pick a Category: &emsp;&emsp;</label></td>
			<td> <select class="dropdown" name="category_name" id="category" required>
				 <option value="Select">Select</option>
				 
				 <%
				 
				 		try{
				 			
				 			ApplicationDB db = new ApplicationDB();
				 			Connection con = db.getConnection();
				 			
				 			String str = "SELECT DISTINCT category_name FROM category";
				 			Statement stmt = con.createStatement();
				 			ResultSet rs = stmt.executeQuery(str);
				 			
				 			while(rs.next()){
				 				
				 			String catg_name = rs.getString("category_name");
				 				%>
				 				<option value="<%=catg_name%>"><%=catg_name%></option>
				 				<%
				 			}
				 			
				 			db.closeConnection(con);
				 			
				 		}
				 		catch(Exception e){
				 			out.print(e);
				 		}
				 
				 %>
 				 </select>
 			</td>
 			<td>
 			<a href = "add_category.jsp"><button style="font-size: 14px; background: transparent; color: white; border: none; cursor: pointer;" type="button">Add Category</button></a>
 			</td>
 			<tr>
 			<td>Item Name:</td> 
 			<td><input type="text" name = "item_name" required></td>
 			</tr>
 			<tr>
 			<td>Minimum Price:</td> 
 			<td><input type="number" name = "minimum_price" min="1" required>&emsp;$</td> 
 			</tr>
 			<tr>
 			<td>Closing Date:</td> 
 			<td><input type="text" name = "closing_date" placeholder="YYYY-MM-DD" required></td>
 			</tr>
 			<tr>
 			<td>Closing Time:</td> 
 			<td><input type="text" name = "closing_time" placeholder="hh:mm:ss" required></td>
 			</tr>
 			<tr>
 			<td>Reserve:</td>
 			<td>
 				<input type="radio" id="yes" value="true" name="reserve">
 				<label for="yes">Yes&emsp;&emsp;</label>
 				<input type="radio" id="no" value="false" name="reserve">
 				<label for="no">No&emsp;&emsp;</label>
				<input type="number" name="reserve_value" id="reserve_value" disabled="true" placeholder="Enter Reserve Price" min = "1" required> $
				<script>
				
				document.getElementById('no').onchange = function() {
					
    				document.getElementById('reserve_value').disabled = this.checked;
    				
				}
				document.getElementById('yes').onchange = function() {
					
					document.getElementById('reserve_value').disabled = !(this.checked);	
					
				}
				</script>
 			</td>
 			</tr>
		</table><br><br><br>
		<div align="center">
		<button type="submit" class="submit-button">Submit</button>
		</div>
		
	
	</form>	
	</div>



</body>
</html>