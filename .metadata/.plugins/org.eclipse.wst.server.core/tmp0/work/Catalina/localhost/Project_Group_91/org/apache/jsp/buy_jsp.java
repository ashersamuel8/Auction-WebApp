/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2022-03-26 16:57:39 UTC
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

public final class buy_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<title>Buy</title>\n");
      out.write("</head>\n");
      out.write("\t\t\t");


				if(session.getAttribute("username") == null){
					response.sendRedirect("login.jsp");
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
      out.write("\tbackground-color: moccasin;\n");
      out.write("\tcolor: black;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".nav a.active {\n");
      out.write("\tbackground-color: lightsalmon;\n");
      out.write("\tcolor: black;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".nav input {\n");
      out.write("\tfloat: center;\n");
      out.write("\tpadding: 6px;\n");
      out.write("\tmargin-top: 8px;\n");
      out.write("\tmargin-right: 4px;\n");
      out.write("\tmargin-left: 16px;\n");
      out.write("\tborder-style: solid;\n");
      out.write("\tfont-size: 17px;\n");
      out.write("\twidth: auto;\n");
      out.write("\tbackground-color: transparent;\n");
      out.write("\tcolor: ivory;\n");
      out.write("\tborder-color: ivory;\n");
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
      out.write("\tbackground-color: ivory;\n");
      out.write("\tvertical-align: top;'\n");
      out.write("}\n");
      out.write("\n");
      out.write(".searchbutton:hover {\n");
      out.write("\tbackground: #ccc;\n");
      out.write("}\n");
      out.write("\n");
      out.write("table {\n");
      out.write("\tfont-family: arial, sans-serif;\n");
      out.write("\tborder-collapse: collapse;\n");
      out.write("\twidth: 100%;\n");
      out.write("\tcolor: white;\n");
      out.write("}\n");
      out.write("\n");
      out.write("td, th {\n");
      out.write("\tborder: 1px solid #dddddd;\n");
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
      out.write("\n");
      out.write(".placebid {\n");
      out.write("\twidth: 75%;\n");
      out.write("\tpadding: 6px 6px;\n");
      out.write("\tmargin: 2px 0;\n");
      out.write("\tbox-sizing: border-box;\n");
      out.write("\tborder: none;\n");
      out.write("\tbackground-color: indianred;\n");
      out.write("\tcolor: white;\n");
      out.write("\tfont-size: 14px;\n");
      out.write("\ttransition-duration: 0.2s;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".placebid:hover {\n");
      out.write("\tbackground-color: firebrick;\n");
      out.write("\tcursor: pointer;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".viewbids {\n");
      out.write("\twidth: 75%;\n");
      out.write("\tpadding: 6px 6px;\n");
      out.write("\tmargin: 2px 0;\n");
      out.write("\tbox-sizing: border-box;\n");
      out.write("\tborder: none;\n");
      out.write("\tbackground-color: lightseagreen;\n");
      out.write("\tcolor: white;\n");
      out.write("\tfont-size: 14px;\n");
      out.write("\ttransition-duration: 0.2s;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".viewbids:hover {\n");
      out.write("\tbackground-color: teal;\n");
      out.write("\tcursor: pointer;\n");
      out.write("}\n");
      out.write("\n");
      out.write("body {\n");
      out.write("\tbackground-image:\n");
      out.write("\t\turl('http://localhost:8080/Project_Group_91/Images/buy.jpg');\n");
      out.write("\tbackground-repeat: no-repeat;\n");
      out.write("\tbackground-attachment: fixed;\n");
      out.write("\tbackground-size: cover;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".category {\n");
      out.write("\tpadding: 14px 14px 12px 14px;\n");
      out.write("\tfont-size: 15px;\n");
      out.write("\tborder: none;\n");
      out.write("\tcursor: pointer;\n");
      out.write("\tbackground-color: black;\n");
      out.write("\tcolor: white;\n");
      out.write("\ttransition-duration: 0.4s;\n");
      out.write("\tvertical-align: bottom;\n");
      out.write("\tmargin-bottom: none;\n");
      out.write("\tmargin-top: -1px;\n");
      out.write("\t\n");
      out.write("}\n");
      out.write("\n");
      out.write(".dropdown {\n");
      out.write("\tdisplay: inline-block;\n");
      out.write("\tbackground-color: black;\n");
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
      out.write("\n");
      out.write("}\n");
      out.write("\n");
      out.write(".dropdown_cnt button {\n");
      out.write("\tcolor: white;\n");
      out.write("\tpadding: 10px;\n");
      out.write("\ttext-decoration: none;\n");
      out.write("\tdisplay: inline-block;\n");
      out.write("\twidth: 120px;\n");
      out.write("\toverflow: auto;\n");
      out.write("\tbackground-color: black;\n");
      out.write("\tborder: none;\n");
      out.write("\tfont-size: 14px;\n");
      out.write("\ttransition-duration: 0.4s;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".dropdown_cnt button:hover {\n");
      out.write("\tbackground-color: cornsilk;\n");
      out.write("\tcolor: black;\n");
      out.write("\t\n");
      out.write("\n");
      out.write("}\n");
      out.write("\n");
      out.write(".dropdown:hover .dropdown_cnt {\n");
      out.write("\tdisplay: block;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".category:hover, .dropdown:hover .category {\n");
      out.write("\tbackground-color: moccasin;\n");
      out.write("\tcolor: black;\n");
      out.write("}\n");
      out.write("</style>\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("\t<div class=\"nav\">\n");
      out.write("\t\t<a href=\"userHomepage.jsp\">HOME</a> <a class=\"active\" href=\"buy.jsp\">BUY</a>\n");
      out.write("\t\t<a href=\"sell.jsp\">SELL</a> \n");
      out.write("\t\t<a href = \"my_products.jsp\">MY PRODUCTS</a>\n");
      out.write("\t\t<a href=\"userInbox.jsp\">INBOX</a>\n");
      out.write("\t\t\n");
      out.write("\t\t\n");
      out.write("\t\t<form style=\"display: inline;\">\n");
      out.write("\t\t<div class=\"dropdown\">\n");
      out.write("\t\t\t\t\t<button type=\"button\" class=\"category\">CATEGORY</button>\n");
      out.write("\t\t\t\t<div class=\"dropdown_cnt\">\n");
      out.write("\t\t\t\t\t");
 
					try{
				 			
				 			ApplicationDB db = new ApplicationDB();
				 			Connection con = db.getConnection();
				 			
				 			String str = "SELECT DISTINCT category_name FROM category";
				 			Statement stmt = con.createStatement();
				 			ResultSet rs = stmt.executeQuery(str);
				 			
				 			while(rs.next()){
				 				
				 			String catg_name = rs.getString("category_name");
				 				
      out.write("\n");
      out.write("\t\t\t\t \t\t\t\t<button onclick=\"buy.jsp\" name=\"catg_filter\" value=\"");
      out.print(catg_name);
      out.write('"');
      out.write('>');
      out.print(catg_name);
      out.write("</button>\n");
      out.write("\t\t\t\t \t\t\t\t");

				 			}
				 			
				 			db.closeConnection(con);
				 			
				 		}
				 		catch(Exception e){
				 			out.print(e);
				 		}
					
					
      out.write("\t\n");
      out.write("\t\t\t\t\t\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t</form>\n");
      out.write("\t\t\n");
      out.write("\t\t<form style=\"display: inline;\">\n");
      out.write("\t\t<div class=\"dropdown\">\n");
      out.write("\t\t\t\t\t<button class=\"category\">SORT BY</button>\n");
      out.write("\t\t\t\t<div class=\"dropdown_cnt\">\n");
      out.write("\t\t\t\t\n");
      out.write("\t\t\t\t\t<button onclick=\"buy.jsp\" name=\"sort_filter\" value=\"item_name\"> Item Name</button>\n");
      out.write("\t\t\t\t\t<button onclick=\"buy.jsp\" name=\"sort_filter\" value=\"current_bid\">Price</button>\n");
      out.write("\t\t\t\t\t<button onclick=\"buy.jsp\" name=\"sort_filter\" value=\"category_name\">Kind</button>\n");
      out.write("\t\t\t\t\t<button onclick=\"buy.jsp\" name=\"sort_filter\" value=\"closing_date_time\">Closing Date</button>\n");
      out.write("\t\t\t\t\t\t\t\t\n");
      out.write("\t\t\t\t</div>\t\t\t\n");
      out.write("\t\t</div>\n");
      out.write("\t\t</form>\n");
      out.write("\t\t\n");
      out.write("\t\t\n");
      out.write("\t\t\n");
      out.write("\t\t<form action=\"buy.jsp\" method=\"post\" style=\"display: inline;\">\n");
      out.write("\t\t\t<input type=\"text\" style=\"vertical-align: top; width: 400px;\" placeholder=\"Search Product..\" name=\"buy_search\">\n");
      out.write("\t\t\t<button type=\"submit\" class=\"searchbutton\">Search</button>\n");
      out.write("\t\t</form>\n");
      out.write("\t\t<a href=\"Logout.jsp\" style=\"float: right;\">LOGOUT</a>\n");
      out.write("\t</div>\n");
      out.write("\n");
      out.write("\t");

	try {

		ApplicationDB db = new ApplicationDB();
		Connection con = db.getConnection();
		
		String catg_filter =  request.getParameter("catg_filter");
		String sort_filter = request.getParameter("sort_filter");
		String search = request.getParameter("buy_search");
		ResultSet result;
		
		if(catg_filter != null){
			
			
			PreparedStatement ps1 = con.prepareStatement("SELECT i.item_id, i.item_name, i.category_name, i.current_bid, i.closing_date_time, u.firstname, u.lastname FROM item i, sell_list s, user u WHERE i.item_id = s.item_id AND s.seller = u.username AND i.category_name = ? AND i.closing_date_time > now()");
			ps1.setString(1, catg_filter);
			result = ps1.executeQuery();
			//System.out.println(catg_filter + "1");
			
		}
		else if(sort_filter != null){
			
			
			PreparedStatement ps2 = con.prepareStatement("SELECT i.item_id, i.item_name, i.category_name, i.current_bid, i.closing_date_time, u.firstname, u.lastname FROM item i, sell_list s, user u WHERE i.item_id = s.item_id AND s.seller = u.username AND i.closing_date_time > now() ORDER BY "+ sort_filter);
			result = ps2.executeQuery();
			//System.out.println(sort_filter + "2");
			
		}
		else if(search != null){
			
			String str ="SELECT i.item_id, i.item_name, i.category_name, i.current_bid, i.closing_date_time, u.firstname, u.lastname FROM item i, sell_list s, user u WHERE i.item_id = s.item_id AND s.seller = u.username AND i.closing_date_time > now() AND i.item_name LIKE '%"+search+"%'";
			PreparedStatement ps3 = con.prepareStatement(str);
			result = ps3.executeQuery();
			//System.out.println(search + "3");
		}
		else{
			
			
			Statement stmt = con.createStatement();
			String str = "SELECT i.item_id, i.item_name, i.category_name, i.current_bid, i.closing_date_time, u.firstname, u.lastname FROM item i, sell_list s, user u WHERE i.item_id = s.item_id AND s.seller = u.username AND i.closing_date_time > now()";
			result = stmt.executeQuery(str);
			//System.out.println("4");
		
		}
		
		
	
      out.write("\n");
      out.write("\t<br>\n");
      out.write("\t<br>\n");
      out.write("\t<table>\n");
      out.write("\t\t<tr>\n");
      out.write("\t\t\t<th>Seller</th>\n");
      out.write("\t\t\t<th>Item Name</th>\n");
      out.write("\t\t\t<th>Category Name</th>\n");
      out.write("\t\t\t<th>Current Bid</th>\n");
      out.write("\t\t\t<th>Closing Date Time</th>\n");
      out.write("\t\t\t<th>Place a Bid</th>\n");
      out.write("\t\t\t<th>View All Bids</th>\n");
      out.write("\t\t</tr>\n");
      out.write("\n");
      out.write("\t\t");

		//parse out the results
		while (result.next()) {
		
      out.write('\n');
      out.write('	');
      out.write('	');

		String item_id = result.getString("item_id");
		
      out.write("\n");
      out.write("\t\t<tr>\n");
      out.write("\t\t\t<td>");
      out.print(result.getString("firstname"));
      out.write(',');
      out.write(' ');
      out.print(result.getString("lastname"));
      out.write("</td>\n");
      out.write("\t\t\t<td>");
      out.print(result.getString("item_name"));
      out.write("</td>\n");
      out.write("\t\t\t<td>");
      out.print(result.getString("category_name"));
      out.write("</td>\n");
      out.write("\t\t\t<td>");
      out.print(result.getString("current_bid"));
      out.write(" $</td>\n");
      out.write("\t\t\t<td>");
      out.print(result.getString("closing_date_time"));
      out.write("</td>\n");
      out.write("\t\t\t<td>\n");
      out.write("\t\t\t\t<form action=\"place_bid.jsp\" method=\"post\"\n");
      out.write("\t\t\t\t\tstyle=\"display: inline;\">\n");
      out.write("\n");
      out.write("\t\t\t\t\t<button class=\"placebid\" type=\"submit\" name=\"item_id\"\n");
      out.write("\t\t\t\t\t\tvalue=\"");
      out.print(item_id);
      out.write("\">Place Bid</button>\n");
      out.write("\n");
      out.write("\t\t\t\t</form>\n");
      out.write("\t\t\t</td>\n");
      out.write("\t\t\t<td>\n");
      out.write("\t\t\t\t<form action=\"view_bids.jsp\" method=\"post\"\n");
      out.write("\t\t\t\t\tstyle=\"display: inline;\">\n");
      out.write("\n");
      out.write("\t\t\t\t\t<button class=\"viewbids\" type=\"submit\" name=\"item_id\"\n");
      out.write("\t\t\t\t\t\tvalue=\"");
      out.print(item_id);
      out.write("\">View Bids</button>\n");
      out.write("\n");
      out.write("\t\t\t\t</form>\n");
      out.write("\t\t\t</td>\n");
      out.write("\n");
      out.write("\t\t</tr>\n");
      out.write("\n");
      out.write("\n");
      out.write("\t\t");

		}

		db.closeConnection(con);
		
      out.write("\n");
      out.write("\n");
      out.write("\t\t");

		} catch (Exception e) {
		System.out.print(e);
		}
		
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\t</table>\n");
      out.write("\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>\n");
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
