/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2022-03-26 16:31:16 UTC
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

public final class edit_005fbids_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<title>Edit Bids</title>\n");
      out.write("</head>\n");
      out.write("\t\t\t");


				if(session.getAttribute("cr_username") == null){
					response.sendRedirect("employee_login.jsp");
				}
			sellUpdate.update();

			
      out.write("\n");
      out.write("<style>\n");
      out.write(".nav {\n");
      out.write("\toverflow: hidden;\n");
      out.write("\topacity: 1.0;\n");
      out.write("\tvertical-align:bottom;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".nav a {\n");
      out.write("\tfloat: left;\n");
      out.write("\tdisplay: block;\n");
      out.write("\tbackground-color: black;\n");
      out.write("\tfont-family: verdana;\n");
      out.write("\tfont-size: 14px;\n");
      out.write("\ttransition-duration: 0.4s;\n");
      out.write("\tcolor: white;\n");
      out.write("\ttext-align: center;\n");
      out.write("\tpadding: 14px 14px;\n");
      out.write("\ttext-decoration: none;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".nav a:hover:not(.active) {\n");
      out.write("\tbackground-color: forestgreen;\n");
      out.write("\tcolor: white;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".nav a.active {\n");
      out.write("\tbackground-color: forestgreen;\n");
      out.write("\tcolor: white;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".nav input {\n");
      out.write("\tfloat: center;\n");
      out.write("\tpadding: 10px;\n");
      out.write("\tmargin-top: 4px;\n");
      out.write("\tmargin-right: 4px;\n");
      out.write("\tmargin-left: 16px;\n");
      out.write("\tborder-style: solid;\n");
      out.write("\tfont-size: 17px;\n");
      out.write("\twidth: auto;\n");
      out.write("\tbackground-color: black;\n");
      out.write("\tcolor: ivory;\n");
      out.write("\tborder-color: ivory;\n");
      out.write("\topacity: 0.7;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".nav input:focus {\n");
      out.write("\toutline: none;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".searchbutton {\n");
      out.write("\tpadding: 8px 8px;\n");
      out.write("\tmargin-top: 8px;\n");
      out.write("\tmargin-right: 16px;\n");
      out.write("\tfont-size: 17px;\n");
      out.write("\tborder: none;\n");
      out.write("\tcursor: pointer;\n");
      out.write("\tbackground-color: black;\n");
      out.write("\tvertical-align: top;\n");
      out.write("\tcolor: white;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".searchbutton:hover {\n");
      out.write("\tbackground: grey;\n");
      out.write("}\n");
      out.write("\n");
      out.write("table {\n");
      out.write("\tfont-family: arial, sans-serif;\n");
      out.write("\tborder-collapse: collapse;\n");
      out.write("\tcolor: white;\n");
      out.write("\tbackground-color: black;\n");
      out.write("\tmargin-right: auto;\n");
      out.write("\tmargin-right:auto;\n");
      out.write("\twidth: 100%;\n");
      out.write("\t\n");
      out.write("\t\n");
      out.write("}\n");
      out.write("\n");
      out.write("td, th {\n");
      out.write("\tborder: 1px solid white;\n");
      out.write("\ttext-align: center;\n");
      out.write("\tpadding: 8px;\n");
      out.write("\tbackground-color: black;\n");
      out.write("\tcolor: white;\n");
      out.write("}\n");
      out.write("\n");
      out.write("tr:nth-child(even) {\n");
      out.write("\tbackground-color: black;\n");
      out.write("\tcolor: white;\n");
      out.write("}\n");
      out.write("\n");
      out.write("input[type=submit] {\n");
      out.write("\twidth: 75%;\n");
      out.write("\tpadding: 6px 6px;\n");
      out.write("\tmargin: 2px 0;\n");
      out.write("\tbox-sizing: border-box;\n");
      out.write("\tborder: none;\n");
      out.write("\tbackground-color: indianred;\n");
      out.write("\tcolor: white;\n");
      out.write("\tfont-size: 14px;\n");
      out.write("\ttransition-duration: 0.2s;\n");
      out.write("\tverticle-align: bottom;\n");
      out.write("}\n");
      out.write("\n");
      out.write("input[type=submit]:hover {\n");
      out.write("\tbackground-color: firebrick;\n");
      out.write("\tcursor: pointer;\n");
      out.write("}\n");
      out.write("input[type=text]{\n");
      out.write("\n");
      out.write("   \tfont-size: 14px;\n");
      out.write("   \tbackground-color: transparent;\n");
      out.write("   \tcolor:white;\n");
      out.write("   \tfont-family: inherit;\n");
      out.write("\n");
      out.write("}\n");
      out.write("input[type=number]{\n");
      out.write("\n");
      out.write("   \tfont-size: 14px;\n");
      out.write("   \tbackground-color: transparent;\n");
      out.write("   \tcolor:white;\n");
      out.write("   \tfont-family: inherit;\n");
      out.write("\n");
      out.write("}\n");
      out.write("\n");
      out.write(".remove {\n");
      out.write("\twidth: 75%;\n");
      out.write("\tpadding: 6px 6px;\n");
      out.write("\tmargin: 2px 0;\n");
      out.write("\tbox-sizing: border-box;\n");
      out.write("\tborder: none;\n");
      out.write("\tbackground-color: firebrick;\n");
      out.write("\tcolor: white;\n");
      out.write("\tfont-size: 14px;\n");
      out.write("\ttransition-duration: 0.2s;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".remove:hover {\n");
      out.write("\tbackground-color: indianred;\n");
      out.write("\tcursor: pointer;\n");
      out.write("}\n");
      out.write(".submit-button {\n");
      out.write("\tpadding: 8px;\n");
      out.write("\tbackground: none;\n");
      out.write("\tcolor: white;\n");
      out.write("\tborder: none;\n");
      out.write("\tfont-size: 14px;\n");
      out.write("\ttransition-duration: 0.3s;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".submit-button:hover {\n");
      out.write("\tbackground-color: limegreen;\n");
      out.write("\tcolor: black;\n");
      out.write("\tcursor: pointer;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".viewbids {\n");
      out.write("\twidth: 75%;\n");
      out.write("\tpadding: 6px 6px;\n");
      out.write("\tmargin: 2px 0;\n");
      out.write("\tbox-sizing: border-box;\n");
      out.write("\tborder: none;\n");
      out.write("\tbackground-color: teal;\n");
      out.write("\tcolor: white;\n");
      out.write("\tfont-size: 14px;\n");
      out.write("\ttransition-duration: 0.2s;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".viewbids:hover {\n");
      out.write("\tbackground-color: lightseagreen;\n");
      out.write("\tcursor: pointer;\n");
      out.write("}\n");
      out.write(".goback-button{\n");
      out.write("\t\n");
      out.write("\t\tpadding: 8px;\n");
      out.write("\t\tbackground: none;\n");
      out.write("\t\tcolor: white;\n");
      out.write("\t\tborder: none;\n");
      out.write("\t\tfont-size: 14px;\n");
      out.write("\t\ttransition-duration: 0.3s;\n");
      out.write("\t\n");
      out.write("\t\n");
      out.write("}\n");
      out.write(".goback-button:hover{\n");
      out.write("\t\n");
      out.write("\t\tbackground-color: silver;\n");
      out.write("\t\tcolor: black;\n");
      out.write("\t\tcursor: pointer;\n");
      out.write("\t\t\n");
      out.write("}\n");
      out.write("body {\n");
      out.write("\tbackground-image:\n");
      out.write("\t\turl('http://localhost:8080/Project_Group_91/Images/customerrepHomepage.jpg');\n");
      out.write("\tbackground-repeat: no-repeat;\n");
      out.write("\tbackground-attachment: fixed;\n");
      out.write("\tbackground-size: cover;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".category {\n");
      out.write("\tpadding: 12px 12px 11px 12px;\n");
      out.write("\tfont-size: 15px;\n");
      out.write("\tborder: none;\n");
      out.write("\tcursor: pointer;\n");
      out.write("\tbackground-color: black;\n");
      out.write("\tcolor: white;\n");
      out.write("\ttransition-duration: 0.4s;\n");
      out.write("\tvertical-align: bottom;\n");
      out.write("\tmargin-bottom: none;\n");
      out.write("\t\n");
      out.write("\t\n");
      out.write("}\n");
      out.write("\n");
      out.write(".dropdown {\n");
      out.write("\tdisplay: inline-block;\n");
      out.write("\tbackground-color: black;\n");
      out.write("\tborder: none;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".dropdown_cnt {\n");
      out.write("\tdisplay: none;\n");
      out.write("\tposition: absolute;\n");
      out.write("\tbackground-color: black;\n");
      out.write("\toverflow: auto;\n");
      out.write("\tmax-height: 200px;\n");
      out.write("\tfont-size: 14px;\n");
      out.write("\twidth: 150px;\n");
      out.write("\tborder: none;\n");
      out.write("\tcursor: pointer;\n");
      out.write("\tz-index: 2;\n");
      out.write("\n");
      out.write("}\n");
      out.write("\n");
      out.write(".dropdown_cnt button {\n");
      out.write("\tcolor: white;\n");
      out.write("\tpadding: 10px;\n");
      out.write("\ttext-decoration: none;\n");
      out.write("\tdisplay: inline-block;\n");
      out.write("\twidth: 150px;\n");
      out.write("\toverflow: auto;\n");
      out.write("\tbackground-color: black;\n");
      out.write("\tborder: none;\n");
      out.write("\tfont-size: 14px;\n");
      out.write("\tcursor: pointer;\n");
      out.write("\ttransition-duration: 0.4s;\n");
      out.write("\t\n");
      out.write("}\n");
      out.write("\n");
      out.write(".dropdown_cnt button:hover {\n");
      out.write("\tbackground-color: forestgreen;\n");
      out.write("\tcolor: white;\n");
      out.write("\tbackground: fill;\n");
      out.write("\t\n");
      out.write("\n");
      out.write("}\n");
      out.write("\n");
      out.write(".dropdown:hover .dropdown_cnt {\n");
      out.write("\tdisplay: block;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".category:hover, .dropdown:hover .category {\n");
      out.write("\tbackground-color: forestgreen;\n");
      out.write("\tcolor: white;\n");
      out.write("}\n");
      out.write("</style>\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("\t<div class=\"nav\">\n");
      out.write("\t\t<a class=\"active\" href=\"customerrepHomepage.jsp\">AUCTIONS</a> \n");
      out.write("\t\t<a href=\"cr_catg.jsp\">CATEGORY</a> \n");
      out.write("\t\t<a href = \"cr_user.jsp\">USERS</a>\n");
      out.write("\t\t<a href=\"cr_inbox.jsp\">INBOX</a>\n");
      out.write("\t\t\n");
      out.write("\t\t\n");
      out.write("\t\t\n");
      out.write("\t\n");
      out.write("\t\t\n");
      out.write("\t\t\n");
      out.write("\t\t\n");
      out.write("\t\t\n");
      out.write("\t\t<a href=\"Logout.jsp\" style=\"float: right;\">LOGOUT</a>\n");
      out.write("\t</div>\n");
      out.write("\t<br><br>\n");
      out.write("\t<div style=\"background-color: black; opacity: 0.7; min-height: 650px; padding: 30px; position:relative; z-index: 1;\">\n");
      out.write("\t\n");
      out.write("\t\n");
      out.write("\t<br>\n");
      out.write("\n");
      out.write("\t");

	
	
			try{
				
				ApplicationDB db = new ApplicationDB();
				Connection con = db.getConnection();
				
				String item_id = request.getParameter("item_id");
				String remove_bid_username = request.getParameter("remove_bid_username");
				String remove_bid = request.getParameter("remove_bid");
				
				
				if(remove_bid != null){
					
					
					PreparedStatement ps = con.prepareStatement("DELETE FROM bids WHERE bid = ? AND username = ? AND item_id = ?");
					ps.setString(1, remove_bid);
					ps.setString(2, remove_bid_username);
					ps.setString(3, item_id);
					ps.executeUpdate();
					
					PreparedStatement ps2 = con.prepareStatement("SELECT MAX(bid) max_bid, item_id FROM bids WHERE item_id = ? GROUP BY item_id");
					ps2.setString(1, item_id);
					ResultSet rs2 = ps2.executeQuery();
					
					if(rs2.next() == true){
						
						String current_bid = rs2.getString("max_bid");
						PreparedStatement ps3 = con.prepareStatement("UPDATE item SET current_bid = ? WHERE item_id = ?");
						ps3.setString(1, current_bid);
						ps3.setString(2, item_id);
						ps3.executeUpdate();
						
						
					}
					
					
				}
				
				
				
				
				String str = "SELECT i.item_id, i.item_name, u.firstname, u.lastname, b.bid, u.username FROM item i, bids b, user u WHERE b.item_id = ? AND i.item_id = b.item_id AND b.username = u.username";
				PreparedStatement p1 = con.prepareStatement(str);
				p1.setString(1,item_id);
				ResultSet rs = p1.executeQuery(); 

				
      out.write("\n");
      out.write("\t\t\t\t\t<table>\n");
      out.write("\t\t\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t\t\t<th>Item ID</th>\n");
      out.write("\t\t\t\t\t\t\t\t<th>Item Name</th>\n");
      out.write("\t\t\t\t\t\t\t\t<th>Name of Bidder</th>\n");
      out.write("\t\t\t\t\t\t\t\t<th>Bid</th>\n");
      out.write("\t\t\t\t\t\t\t\t<th>Remove Bid</th>\n");
      out.write("\t\t\t\t\t\t\t</tr>\n");
      out.write("\t\t\t\t\n");
      out.write("\t\t\t\t");
 
				while(rs.next()){
					
					String bid = rs.getString("bid");
					String username = rs.getString("username");
						
						
      out.write("\n");
      out.write("\t\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t\t\t<td>");
      out.print( rs.getString("item_id") );
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t\t\t<td>");
      out.print( rs.getString("item_name") );
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t\t\t<td>");
      out.print( rs.getString("firstname") );
      out.write(',');
      out.write(' ');
      out.print(rs.getString("lastname") );
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t\t\t<td>");
      out.print( bid );
      out.write(" $</td>\n");
      out.write("\t\t\t\t\t\t\t\t<td>\n");
      out.write("\t\t\t\t\t\t\t\t<form action=\"edit_bids.jsp\" method=\"post\" style=\"display: inline;\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<input type=\"hidden\" name=\"remove_bid\" value=\"");
      out.print(bid );
      out.write("\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<input type=\"hidden\" name=\"remove_bid_username\" value=\"");
      out.print(username );
      out.write("\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<button class=\"remove\" type=\"submit\" name=\"item_id\"\n");
      out.write("\t\t\t\t\t\t\t\t\t\tvalue=\"");
      out.print(item_id);
      out.write("\">Remove Bid</button>\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t\t\t</form>\n");
      out.write("\t\t\t\t\t\t\t\t</td>\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t\t</tr>\n");
      out.write("\t\t\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\t");
 
					
					
				}
				
				db.closeConnection(con);
				
			}
			catch(Exception e){
				
				out.println(e);
				
				
			}

	
	
	
	
	
	
	
	
	
      out.write("\n");
      out.write("\t</table>\n");
      out.write("\t<br><br>\n");
      out.write("\t\t\t\t<div style=\"text-align:center\">\n");
      out.write("\t\t\t\t\t<a href=\"customerrepHomepage.jsp\"><button class=\"goback-button\" type=\"submit\">Go Back</button></a>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\n");
      out.write("\t\n");
      out.write("\t\n");
      out.write("\t</div>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>\n");
      out.write("\n");
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
