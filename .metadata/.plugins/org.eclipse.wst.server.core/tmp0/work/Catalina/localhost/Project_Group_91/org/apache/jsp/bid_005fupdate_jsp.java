/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2022-03-26 16:18:37 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.cs336project.pkg.*;
import java.io.*;
import java.util.*;
import java.sql.*;
import javax.servlet.http.*;
import javax.servlet.*;

public final class bid_005fupdate_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=ISO-8859-1");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("<!--Import some libraries that have classes that we need -->\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<title>Place Bid</title>\n");
      out.write("</head>\n");
      out.write("\t\t\t");


				if(session.getAttribute("username") == null){
					response.sendRedirect("login.jsp");
				}
			sellUpdate.update();
			
      out.write("\n");
      out.write("<style>\n");
      out.write("\n");
      out.write(".nav{\n");
      out.write("\t\n");
      out.write("\t\toverflow: hidden;\n");
      out.write("\t\topacity: 1.0;\n");
      out.write("\t\t\n");
      out.write("\t}\n");
      out.write("\t.nav a{\n");
      out.write("\t\t\n");
      out.write("\t\tfloat: left;\n");
      out.write("\t\tdisplay: block;\n");
      out.write("  \t\tpadding: 10px;\n");
      out.write("  \t\tbackground-color: black;\n");
      out.write("  \t\tfont-family: verdana;\n");
      out.write("  \t\tfont-size: 14px;\n");
      out.write("  \t\ttransition-duration: 0.4s;\n");
      out.write("  \t\tcolor: white;\n");
      out.write("  \t\ttext-align: center;\n");
      out.write("  \t\tpadding: 14px 14px;\n");
      out.write("  \t\ttext-decoration: none;\n");
      out.write("  \t\t\n");
      out.write("\n");
      out.write("\t}\n");
      out.write("\t.nav a:hover:not(.active){\n");
      out.write("\t\tbackground-color: moccasin;\n");
      out.write("\t\tcolor: black;\n");
      out.write("\t}\n");
      out.write("\t.nav a.active {\n");
      out.write("  \t\tbackground-color: lightsalmon;\n");
      out.write("  \t\tcolor: black;\n");
      out.write("\t}\n");
      out.write("\t.nav input{\n");
      out.write("\t\n");
      out.write("\t\tfloat: center;\n");
      out.write("  \t\tpadding: 6px;\n");
      out.write("  \t\tmargin-top: 8px;\n");
      out.write("  \t\tmargin-right: 4px;\n");
      out.write("  \t\tmargin-left: 16px;\n");
      out.write("  \t\tborder-style: solid;\n");
      out.write("  \t\tfont-size: 17px;\n");
      out.write("\t\twidth: 500px;\n");
      out.write("\t\tbackground-color: transparent;\n");
      out.write("\t\tcolor: ivory;\n");
      out.write("\t\tborder-color: ivory;\n");
      out.write("\t\n");
      out.write("\t}\n");
      out.write("\t.nav input:focus{\n");
      out.write("\t\t\n");
      out.write("\t\toutline: none;\n");
      out.write("\t\n");
      out.write("\t}\n");
      out.write("\t.nav button {\n");
      out.write("  \t\t\n");
      out.write("  \t\tpadding: 6px 10px;\n");
      out.write("  \t\tmargin-top: 8px;\n");
      out.write("  \t\tmargin-right: 16px;\n");
      out.write("  \t\tbackground: #ddd;\n");
      out.write("  \t\tfont-size: 17px;\n");
      out.write("  \t\tborder: none;\n");
      out.write("  \t\tcursor: pointer;\n");
      out.write("  \t\tbackground-color: ivory;\n");
      out.write("\t}\n");
      out.write("\n");
      out.write("\t.nav button:hover {\n");
      out.write("  \t\tbackground: #ccc;\n");
      out.write("\t}\n");
      out.write("\ttable {\n");
      out.write("  \t\tfont-family: arial, sans-serif;\n");
      out.write("  \t\tborder-collapse: collapse;\n");
      out.write("  \t\tcolor: white;\n");
      out.write("  \t\twidth: auto;\n");
      out.write("\t}\n");
      out.write("\n");
      out.write("\ttd, th, tr {\n");
      out.write("  \t\tborder: none;\n");
      out.write("  \t\ttext-align: left;\n");
      out.write("  \t\tpadding: 8px;\n");
      out.write("  \t\tbackground-color: black;\n");
      out.write("  \t\tcolor: white;\n");
      out.write("  \t\t\n");
      out.write("\t}\n");
      out.write("\n");
      out.write("  \t\t\n");
      out.write("\t}\n");
      out.write("\tinput[type=submit] {\n");
      out.write("  \t\twidth: 75%;\n");
      out.write("  \t\tpadding: 6px 6px;\n");
      out.write("  \t\tmargin: 2px 0;\n");
      out.write("  \t\tbox-sizing: border-box;\n");
      out.write("  \t\tborder: none;\n");
      out.write("  \t\tbackground-color: indianred;\n");
      out.write("  \t\tcolor: white;\n");
      out.write("  \t\tfont-size: 14px;\n");
      out.write("  \t\ttransition-duration:0.2s;\n");
      out.write("\t}\n");
      out.write("\tinput[type=submit]:hover{\n");
      out.write("\t\t\n");
      out.write("\t\tbackground-color: firebrick;\n");
      out.write("\t\tcursor: pointer;\n");
      out.write("\t\n");
      out.write("\t}\n");
      out.write("\t.place-bid-bar{\n");
      out.write("\t\t \n");
      out.write("\t\twidth: 120px;\n");
      out.write("  \t\tpadding: 6px 6px;\n");
      out.write("  \t\tmargin: 2px 0;\n");
      out.write("  \t\tbox-sizing: border-box;\n");
      out.write("  \t\tborder: 1px solid;\n");
      out.write("  \t\tborder-color: lightseagreen;\n");
      out.write("  \t\tbackground-color: transparent;\n");
      out.write("  \t\tcolor: white;\n");
      out.write("  \t\tfont-size: 14px;\n");
      out.write("  \t\ttext-align: center;\n");
      out.write("  \t\t\n");
      out.write("  \t\t\n");
      out.write("\t\t\n");
      out.write("\t\n");
      out.write("\t}\n");
      out.write("\t.place-bid-bar:focus{\n");
      out.write("\t\t\n");
      out.write("\t\toutline: none;\n");
      out.write("\t\t\n");
      out.write("\t}\n");
      out.write("\t\n");
      out.write("\tbody{\n");
      out.write("\t\n");
      out.write("\t\t\n");
      out.write("\t\tbackground-image: url('http://localhost:8080/Project_Group_91/Images/buy.jpg');\n");
      out.write(" \t\tbackground-repeat: no-repeat;\n");
      out.write("  \t\tbackground-attachment: fixed; \n");
      out.write("  \t\tbackground-size: cover;\n");
      out.write("  \t\t\n");
      out.write("\t}\n");
      out.write("\t.item-info{\n");
      out.write("\t\n");
      out.write("\t\n");
      out.write("\t\tmargin: 8px;\n");
      out.write("\t\tpadding: 20px;\n");
      out.write("\t\tcolor: white;\n");
      out.write("\t\tbackground-color: black;\n");
      out.write("\t\topacity: 0.8;\n");
      out.write("\t\tborder-style: solid;\n");
      out.write("\t\tborder-color: ivory;\n");
      out.write("\t\t\n");
      out.write("\t\n");
      out.write("\t\n");
      out.write("\t}\n");
      out.write("\t.submit-button{\n");
      out.write("\t\n");
      out.write("\t\tpadding: 8px;\n");
      out.write("\t\tbackground: none;\n");
      out.write("\t\tcolor: white;\n");
      out.write("\t\tborder: none;\n");
      out.write("\t\tfont-size: 14px;\n");
      out.write("\t\ttransition-duration: 0.3s;\n");
      out.write("\t\n");
      out.write("\t\n");
      out.write("\t}\n");
      out.write("\t.submit-button:hover{\n");
      out.write("\t\n");
      out.write("\t\t\tbackground-color: limegreen;\n");
      out.write("\t\t\tcolor: black;\n");
      out.write("\t\t\tcursor: pointer;\n");
      out.write("\t\n");
      out.write("\t\n");
      out.write("\t}\n");
      out.write("\t.autobid-button{\n");
      out.write("\t\n");
      out.write("\t\tpadding: 8px;\n");
      out.write("\t\tbackground: none;\n");
      out.write("\t\tcolor: white;\n");
      out.write("\t\tborder: none;\n");
      out.write("\t\tfont-size: 14px;\n");
      out.write("\t\ttransition-duration: 0.3s;\n");
      out.write("\t\tfloat: right;\n");
      out.write("\t\n");
      out.write("\t\n");
      out.write("\t}\n");
      out.write("\t.autobid-button:hover{\n");
      out.write("\t\n");
      out.write("\t\t\tbackground-color: khaki;\n");
      out.write("\t\t\tcolor: black;\n");
      out.write("\t\t\tcursor: pointer;\n");
      out.write("\t\n");
      out.write("\t\n");
      out.write("\t}\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("</style>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("\n");
      out.write("\t<div class=\"nav\">\n");
      out.write("\t\t<a href = \"userHomepage.jsp\">HOME</a>\n");
      out.write("\t\t<a class=\"active\" href = \"buy.jsp\">BUY</a>\n");
      out.write("\t\t<a href = \"sell.jsp\">SELL</a>\n");
      out.write("\t\t<a href = \"my_products.jsp\">MY PRODUCTS</a>\n");
      out.write("\t\t<a href = \"userInbox.jsp\">INBOX</a>\n");
      out.write("\t\t\n");
      out.write("\t\t<a href = \"Logout.jsp\" style=\"float:right;\">LOGOUT</a>\n");
      out.write("\t\t<a href = \"help.jsp\" style=\"float:right;\">HELP</a>\n");
      out.write("\t</div>\n");
      out.write("\t\n");
      out.write("\t<br><br><br>\n");
      out.write("\t\n");
      out.write("\t<div class=\"item-info\">\n");
      out.write("\t\t\n");
      out.write("\t\t");

		
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
			
			
      out.write("\n");
      out.write("\t\t\t<script>\n");
      out.write("\t\t\t\talert(\"Aution Closed\");\n");
      out.write("\t\t\t\twindow.location.href = \"buy.jsp\";\n");
      out.write("\t\t\t</script>\n");
      out.write("\t\t\n");
      out.write("\t\t\t");
 
		
		}
		else{
		
		String str1 = "SELECT current_bid FROM item WHERE item_id = ?";
		PreparedStatement buff = con.prepareStatement(str1);
		buff.setString(1,item_id);
		ResultSet x = buff.executeQuery();
		
		
		
		while(x.next()){
			 int c_bid = Integer.parseInt(x.getString("current_bid"));
			 if(new_bid <= c_bid){
					
					
      out.write("\n");
      out.write("\t\t\t\t\t<script>\n");
      out.write("\t\t\t\t\t\talert(\"Enter a bid greater than the current bid\");\n");
      out.write("\t\t\t\t\t</script>\n");
      out.write("\t\t\t\t\t");
 
					
				}
				else{
					
					PreparedStatement ps = con.prepareStatement("SELECT username FROM auto_bid WHERE item_id = ? and username = ?");
					ps.setString(1, item_id);
					ps.setString(2, username);
					ResultSet check_rs = ps.executeQuery();
					if (check_rs.next() != false){
						
							
      out.write("\n");
      out.write("\t\t\t\t\t\t\t<script>\n");
      out.write("\t\t\t\t\t\t\t\talert(\"Automatic Bidding Already Exists\");\n");
      out.write("\t\t\t\t\t\t\t\twindow.location.href = \"buy.jsp\";\n");
      out.write("\t\t\t\t\t\t\t</script>\n");
      out.write("\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t\t");
 
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
			
			
      out.write("\n");
      out.write("\t\t\t\t<form action=\"auto_bid.jsp\" method=\"post\">\n");
      out.write("\t\t\t\t\t<div style=\"text-align:center;\">\n");
      out.write("\t\t\t\t\t\t<input type=\"hidden\" name=\"item_id\" value=\"");
      out.print(item_id);
      out.write("\">\n");
      out.write("\t\t\t\t\t\t<button class=\"autobid-button\" type=\"submit\">Set-up Automatic Bidding</button>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t</form>\n");
      out.write("\t\t\t\t\n");
      out.write("\t\t\t\t\n");
      out.write("\t\t\t\t<form action=\"bid_update.jsp\" method=\"post\">\n");
      out.write("\t\t\t\t<h2 style=\"color: lightcyan;\">Item Info</h2>\n");
      out.write("\t\t\t\t<table>\n");
      out.write("\t\t\t\t\n");
      out.write("\t\t\t\t<tr><td>Item ID:&emsp;&emsp;</td><td> ");
      out.print( rs.getString("item_id") );
      out.write(" </td></tr>\n");
      out.write("\t\t\t\t<tr><td>Item Name:&emsp;&emsp;</td><td> ");
      out.print( rs.getString("item_name") );
      out.write(" </td></tr>\n");
      out.write("\t\t\t\t<tr><td>Category Name:&emsp;&emsp;</td><td> ");
      out.print( rs.getString("category_name") );
      out.write(" </td></tr>\n");
      out.write("\t\t\t\t<tr><td>Current Bid:&emsp;&emsp;</td><td> ");
      out.print( rs.getString("current_bid") );
      out.write(" $</td></tr>\n");
      out.write("\t\t\t\t<tr><td>Closing Date and Time:&emsp;&emsp;</td><td> ");
      out.print( rs.getString("closing_date_time") );
      out.write(" </td></tr>\n");
      out.write("\t\t\t\t\n");
      out.write("\n");
      out.write("\t\t\t\t</table>\n");
      out.write("\t\t\t\t<br>\n");
      out.write("\t\t\t\t<div style=\"text-align:center;\">\n");
      out.write("\t\t\t\t<input class=\"place-bid-bar\" type=\"text\" name=\"new_bid\" placeholder=\"Enter New Bid\">\n");
      out.write("\t\t\t\t<input type=\"hidden\" name=\"item_id\" value=\"");
      out.print(item_id);
      out.write("\">\n");
      out.write("\t\t\t\t<button class=\"submit-button\" type=\"submit\">Submit</button>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t\n");
      out.write("\t\t\t\t</form>\t\t\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t\n");
      out.write("\t\t\t");
 
		
		
		}while(rs.next());
		
		}
			db.closeConnection(con);
		
		}
		catch(Exception e){
			System.out.print(e);
		} 
		
		
		
      out.write("\n");
      out.write("\t\n");
      out.write("\t</div>\n");
      out.write("\t\n");
      out.write("</body>\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
