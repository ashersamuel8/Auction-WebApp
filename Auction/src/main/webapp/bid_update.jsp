<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336project.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>Place Bid</title>
</head>
			<%

				if(session.getAttribute("username") == null){
					response.sendRedirect("login.jsp");
				}
			sellUpdate.update();
			%>
<style>

.nav{
	
		overflow: hidden;
		opacity: 1.0;
		
	}
	.nav a{
		
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
	.nav a:hover:not(.active){
		background-color: moccasin;
		color: black;
	}
	.nav a.active {
  		background-color: lightsalmon;
  		color: black;
	}
	.nav input{
	
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
  		transition-duration:0.2s;
	}
	input[type=submit]:hover{
		
		background-color: firebrick;
		cursor: pointer;
	
	}
	.place-bid-bar{
		 
		width: 120px;
  		padding: 6px 6px;
  		margin: 2px 0;
  		box-sizing: border-box;
  		border: 1px solid;
  		border-color: lightseagreen;
  		background-color: transparent;
  		color: white;
  		font-size: 14px;
  		text-align: center;
  		
  		
		
	
	}
	.place-bid-bar:focus{
		
		outline: none;
		
	}
	
	body{
	
		
		background-image: url('http://localhost:8080/Project_Group_91/Images/buy.jpg');
 		background-repeat: no-repeat;
  		background-attachment: fixed; 
  		background-size: cover;
  		
	}
	.item-info{
	
	
		margin: 8px;
		padding: 20px;
		color: white;
		background-color: black;
		opacity: 0.8;
		border-style: solid;
		border-color: ivory;
		
	
	
	}
	.submit-button{
	
		padding: 8px;
		background: none;
		color: white;
		border: none;
		font-size: 14px;
		transition-duration: 0.3s;
	
	
	}
	.submit-button:hover{
	
			background-color: limegreen;
			color: black;
			cursor: pointer;
	
	
	}
	.autobid-button{
	
		padding: 8px;
		background: none;
		color: white;
		border: none;
		font-size: 14px;
		transition-duration: 0.3s;
		float: right;
	
	
	}
	.autobid-button:hover{
	
			background-color: khaki;
			color: black;
			cursor: pointer;
	
	
	}




</style>



<body>


	<div class="nav">
		<a href = "userHomepage.jsp">HOME</a>
		<a class="active" href = "buy.jsp">BUY</a>
		<a href = "sell.jsp">SELL</a>
		<a href = "my_products.jsp">MY PRODUCTS</a>
		<a href = "userInbox.jsp">INBOX</a>
		
		<a href = "Logout.jsp" style="float:right;">LOGOUT</a>
		<a href = "help.jsp" style="float:right;">HELP</a>
	</div>
	
	<br><br><br>
	
	<div class="item-info">
		
		<%
		
	 	try{ 
		
		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		
		String username = String.valueOf(session.getAttribute("username"));
		
		String item_id = request.getParameter("item_id");
		int new_bid = Integer.parseInt(request.getParameter("new_bid"));
		String str = "SELECT item_id, item_name, category_name, current_bid, closing_date_time FROM item  WHERE item_id = ? AND closing_date_time > now()";
		PreparedStatement p1 = con.prepareStatement(str);
		p1.setString(1,item_id);
		ResultSet rs = p1.executeQuery(); 
		if (rs.next() == false){
			
			%>
			<script>
				alert("Aution Closed");
				window.location.href = "buy.jsp";
			</script>
		
			<% 
		
		}
		else{
		
		String str1 = "SELECT current_bid FROM item WHERE item_id = ?";
		PreparedStatement buff = con.prepareStatement(str1);
		buff.setString(1,item_id);
		ResultSet x = buff.executeQuery();
		
		
		
		while(x.next()){
			 int c_bid = Integer.parseInt(x.getString("current_bid"));
			 if(new_bid <= c_bid){
					
					%>
					<script>
						alert("Enter a bid greater than the current bid");
					</script>
					<% 
					
				}
				else{
					
					PreparedStatement ps = con.prepareStatement("SELECT username FROM auto_bid WHERE item_id = ? and username = ?");
					ps.setString(1, item_id);
					ps.setString(2, username);
					ResultSet check_rs = ps.executeQuery();
					if (check_rs.next() != false){
						
							%>
							<script>
								alert("Automatic Bidding Already Exists");
								window.location.href = "buy.jsp";
							</script>
						
							<% 
							AutoBid.insert(item_id, username);
					}
					else{
						
						String update = "UPDATE item SET current_bid = ? WHERE item_id = ?";
						PreparedStatement p2 = con.prepareStatement(update);
						p2.setString(1,String.valueOf(new_bid));
						p2.setString(2,item_id);
						p2.executeUpdate();
					
						
					
						PreparedStatement p3 = con.prepareStatement("INSERT INTO bids VALUES(?, ?, ?)");
						p3.setString(1,item_id);
						p3.setString(2,String.valueOf(new_bid));
						p3.setString(3, username);
						p3.executeUpdate();
					
						AutoBid.update(item_id);
						response.sendRedirect("buy.jsp");
					
					}
					
				} 
		}
		
		do{
			
			%>
				<form action="auto_bid.jsp" method="post">
					<div style="text-align:center;">
						<input type="hidden" name="item_id" value="<%=item_id%>">
						<button class="autobid-button" type="submit">Set-up Automatic Bidding</button>
					</div>
				</form>
				
				
				<form action="bid_update.jsp" method="post">
				<h2 style="color: lightcyan;">Item Info</h2>
				<table>
				
				<tr><td>Item ID:&emsp;&emsp;</td><td> <%= rs.getString("item_id") %> </td></tr>
				<tr><td>Item Name:&emsp;&emsp;</td><td> <%= rs.getString("item_name") %> </td></tr>
				<tr><td>Category Name:&emsp;&emsp;</td><td> <%= rs.getString("category_name") %> </td></tr>
				<tr><td>Current Bid:&emsp;&emsp;</td><td> <%= rs.getString("current_bid") %> $</td></tr>
				<tr><td>Closing Date and Time:&emsp;&emsp;</td><td> <%= rs.getString("closing_date_time") %> </td></tr>
				

				</table>
				<br>
				<div style="text-align:center;">
				<input class="place-bid-bar" type="text" name="new_bid" placeholder="Enter New Bid">
				<input type="hidden" name="item_id" value="<%=item_id%>">
				<button class="submit-button" type="submit">Submit</button>
				</div>
				
				</form>		
			
			
			<% 
		
		
		}while(rs.next());
		
		}
			db.closeConnection(con);
		
		}
		catch(Exception e){
			System.out.print(e);
		} 
		
		
		%>
	
	</div>
	
</body>
</html>