/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2022-03-26 16:15:23 UTC
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

public final class add_005fcategory_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<title>Add Category</title>\n");
      out.write("</head>\n");
      out.write("<style>\n");
      out.write(".nav {\n");
      out.write("\toverflow: hidden;\n");
      out.write("\topacity: 1.0;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".nav a {\n");
      out.write("\tfloat: left;\n");
      out.write("\tdisplay: block;\n");
      out.write("\tpadding: 10px;\n");
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
      out.write("\twidth: 500px;\n");
      out.write("\tbackground-color: transparent;\n");
      out.write("\tcolor: ivory;\n");
      out.write("\tborder-color: ivory;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".nav input:focus {\n");
      out.write("\toutline: none;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".nav button {\n");
      out.write("\tpadding: 6px 10px;\n");
      out.write("\tmargin-top: 8px;\n");
      out.write("\tmargin-right: 16px;\n");
      out.write("\tbackground: #ddd;\n");
      out.write("\tfont-size: 17px;\n");
      out.write("\tborder: none;\n");
      out.write("\tcursor: pointer;\n");
      out.write("\tbackground-color: ivory;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".nav button:hover {\n");
      out.write("\tbackground: #ccc;\n");
      out.write("}\n");
      out.write("\n");
      out.write("input[type=text]{\n");
      out.write("\n");
      out.write("   \tfont-size: 14px;\n");
      out.write("   \tbackground-color: transparent;\n");
      out.write("   \tcolor:white;\n");
      out.write("   \tfont-family: inherit;\n");
      out.write("\n");
      out.write("}\n");
      out.write("body {\n");
      out.write("\tbackground-image:\n");
      out.write("\t\turl('http://localhost:8080/Project_Group_91/Images/buy.jpg');\n");
      out.write("\tbackground-repeat: no-repeat;\n");
      out.write("\tbackground-attachment: fixed;\n");
      out.write("\tbackground-size: cover;\n");
      out.write("\tfont-family: Verdana, Geneva, sans-serif;\n");
      out.write("}\n");
      out.write("\n");
      out.write(".item-info {\n");
      out.write("\tmargin: 8px;\n");
      out.write("\tpadding: 20px;\n");
      out.write("\tcolor: white;\n");
      out.write("\tbackground-color: black;\n");
      out.write("\topacity: 0.8;\n");
      out.write("\tborder-style: solid;\n");
      out.write("\tborder-color: ivory;\n");
      out.write("\tfont-family: Helvetica, Arial, sans-serif;\n");
      out.write("\tfont-size: 16px;\n");
      out.write("\ttext-align: center;\n");
      out.write("}\n");
      out.write("\n");
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
      out.write("}\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("</style>\n");
      out.write("\n");
      out.write("\t\t\t");


				if(session.getAttribute("username") == null){
					response.sendRedirect("login.jsp");
				}
			sellUpdate.update();

			
      out.write("\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("\t<div class=\"nav\">\n");
      out.write("\t\t<a href=\"userHomepage.jsp\">HOME</a> \n");
      out.write("\t\t<a href=\"buy.jsp\">BUY</a> \n");
      out.write("\t\t<a class=\"active\" href=\"sell.jsp\">SELL</a>\n");
      out.write("\t\t<a href = \"my_products.jsp\">MY PRODUCTS</a>\n");
      out.write("\t\t <a href=\"userInbox.jsp\">INBOX</a>\n");
      out.write("\t\t\n");
      out.write("\t\t\n");
      out.write("\t\t<a href=\"Logout.jsp\" style=\"float: right;\">LOGOUT</a>\n");
      out.write("\t\t<a href = \"help.jsp\" style=\"float:right;\">HELP</a>\n");
      out.write("\t</div>\n");
      out.write("\n");
      out.write("\t\n");
      out.write("\t");

	
		try{
			
			String category_name = request.getParameter("category_name");
			
			if(category_name != null){
				
				
				ApplicationDB db = new ApplicationDB();
				Connection con = db.getConnection();
				
				Statement stmt = con.createStatement();
				
				String str = "SELECT category_name FROM category";
				
				ResultSet rs =  stmt.executeQuery(str);
				
				while(rs.next()){
					
					String catg_name = rs.getString("category_name");
					if(catg_name.equals(category_name)){
						
						
      out.write("\n");
      out.write("\t\t\t\t\t\t<script>\n");
      out.write("\t\t\t\t\t\t\talert(\"Category Already Exists\");\n");
      out.write("\t\t\t\t\t\t\twindow.location.href = \"sell.jsp\";\n");
      out.write("\t\t\t\t\t\t</script>\n");
      out.write("\t\t\t\t\t\t");

						break;
					}
					
				}
				
				int category_id = GetID.getCategoryID();
				
				String insert = "INSERT INTO category (category_id, category_name) VALUES (? ,?)";
				PreparedStatement p = con.prepareStatement(insert);
				p.setString(1, String.valueOf(category_id));
				p.setString(2, category_name);
				p.executeUpdate();
				
				db.closeConnection(con);
				
				response.sendRedirect("sell.jsp");
				
			}
			
			
			
		}
		catch(Exception e){
			
			out.println(e);
		}
	
	
	
	
	
      out.write("\n");
      out.write("\t\n");
      out.write("\t\n");
      out.write("\t\n");
      out.write("\t\n");
      out.write("\t\n");
      out.write("\t<div class=\"item-info\">\n");
      out.write("\t<form method=\"post\" action = \"add_category.jsp\">\n");
      out.write("\t\t<label for=\"catg_name\">Category Name: &emsp;&emsp;</label>\n");
      out.write("\t\t<input type=\"text\" name=\"category_name\" id=\"catg_name\" required><br><br>\n");
      out.write("\t\t<a href=\"sell.jsp\"><button class=\"goback-button\" type=\"button\">Go Back</button></a>\n");
      out.write("\t\t<button type=\"submit\" class = \"submit-button\">Submit</button>\n");
      out.write("\t\t\n");
      out.write("\t</form>\n");
      out.write("\t</div>\n");
      out.write("\n");
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
