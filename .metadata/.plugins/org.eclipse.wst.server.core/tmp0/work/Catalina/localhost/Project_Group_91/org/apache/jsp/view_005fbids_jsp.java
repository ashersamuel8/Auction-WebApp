/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2022-03-26 16:29:19 UTC
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

public final class view_005fbids_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<title>View Bid</title>\n");
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
      out.write("\t\topacity: 0.8;\n");
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
      out.write("\t\tfont-family: arial, sans-serif;\n");
      out.write("\t\tborder-collapse: collapse;\n");
      out.write("\t\twidth: 100%;\n");
      out.write("\t\tcolor: white;\n");
      out.write("\t}\n");
      out.write("\n");
      out.write("\ttd, th {\n");
      out.write("\t\tborder: 1px solid #dddddd;\n");
      out.write("\t\ttext-align: center;\n");
      out.write("\t\tpadding: 8px;\n");
      out.write("\t\tbackground-color: black;\n");
      out.write("\t\tcolor: white;\n");
      out.write("\t}\n");
      out.write("\n");
      out.write("\ttr:nth-child(even) {\n");
      out.write("\t\tbackground-color: black;\n");
      out.write("\t\tcolor: white;\t\n");
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
      out.write("\t.goback-button{\n");
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
      out.write("\t.goback-button:hover{\n");
      out.write("\t\n");
      out.write("\t\t\tbackground-color: silver;\n");
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
		
		String item_id = request.getParameter("item_id");
		String str = "SELECT i.item_id, i.item_name, u.firstname, u.lastname, b.bid FROM item i, bids b, user u WHERE b.item_id = ? AND i.item_id = b.item_id AND b.username = u.username";
		PreparedStatement p1 = con.prepareStatement(str);
		p1.setString(1,item_id);
		ResultSet rs = p1.executeQuery(); 
		
		
      out.write("\n");
      out.write("\t\t\t<table>\n");
      out.write("\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t<th>Item ID</th>\n");
      out.write("\t\t\t\t\t\t<th>Item Name</th>\n");
      out.write("\t\t\t\t\t\t<th>Name of Bidder</th>\n");
      out.write("\t\t\t\t\t\t<th>Bid</th>\n");
      out.write("\t\t\t\t\t</tr>\n");
      out.write("\t\t\n");
      out.write("\t\t");
 
		while(rs.next()){
			
				
      out.write("\n");
      out.write("\t\t\t\t\t\n");
      out.write("\t\t\t\t\t\n");
      out.write("\t\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t\t<td>");
      out.print( rs.getString("item_id") );
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td>");
      out.print( rs.getString("item_name") );
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td>");
      out.print( rs.getString("firstname") );
      out.write(',');
      out.write(' ');
      out.print(rs.getString("lastname") );
      out.write("</td>\n");
      out.write("\t\t\t\t\t\t<td>");
      out.print( rs.getString("bid") );
      out.write(" $</td>\t\t\t\t\t\n");
      out.write("\t\t\t\t\t</tr>\n");
      out.write("\t\t\t\t\t\n");
      out.write("\t\t\t\t");
 
			
			
		}
		
			db.closeConnection(con);
		
		}
		catch(Exception e){
			
		}
		
		
      out.write("\t\n");
      out.write("\t\t\n");
      out.write("\t\t\t</table>\n");
      out.write("\t\t\t\t\t<br>\n");
      out.write("\t\t\t\t\t<div style=\"text-align:center\">\n");
      out.write("\t\t\t\t\t<a href=\"buy.jsp\"><button class=\"goback-button\" type=\"submit\">Go Back</button></a>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\n");
      out.write("\t</div>\n");
      out.write("\t\n");
      out.write("\n");
      out.write("\n");
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
