/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2022-03-26 16:57:20 UTC
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

public final class register_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<meta charset=\"UTF-8\">\n");
      out.write("<title>Sign Up</title>\n");
      out.write("</head>\n");
      out.write("<style>\n");
      out.write("\t \n");
      out.write(" \th1{\n");
      out.write("  \t\tfont-family: \"Lucida Console\", Monaco, monospace;\n");
      out.write("\t}\n");
      out.write("\t\n");
      out.write("\ttable{\n");
      out.write("\t\n");
      out.write("\t\tfont-family: \"Courier New\", monospace;\n");
      out.write("\t\tcolor: white;\n");
      out.write("\t\n");
      out.write("\t}\t\n");
      out.write("\t\n");
      out.write("\tbody{\n");
      out.write("\t\tbackground-image: url('http://localhost:8080/Project_Group_91/Images/login.jpg');\n");
      out.write(" \t\tbackground-repeat: no-repeat;\n");
      out.write("  \t\tbackground-attachment: fixed; \n");
      out.write("  \t\tbackground-size: cover;\n");
      out.write("  \t\topacity: 0.6;\n");
      out.write("  \t\t\n");
      out.write("\t}\n");
      out.write("\tinput{\n");
      out.write("\t\t\n");
      out.write("\t\tbackground-color: black;\n");
      out.write("\t\tcolor: white;\n");
      out.write("\t\tbox-sizing: border-box;\n");
      out.write("\t\tpadding: 10px;\n");
      out.write("\t\tfont-size: 14px;\n");
      out.write("\t\t\n");
      out.write("\t}\n");
      out.write("\t\n");
      out.write("\t\n");
      out.write("\t.button{\n");
      out.write("\t\n");
      out.write("\t\t\n");
      out.write("\t\tpadding: 10px;\n");
      out.write("\t\tfont-size: 14px;\n");
      out.write("\t\tbackground-color: black;\n");
      out.write("\t\tcolor: white;\n");
      out.write("\t\n");
      out.write("\t\n");
      out.write("\t\n");
      out.write("\t}\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("</style>\n");
      out.write("<body>\n");
      out.write("\t<div align=\"center\">\n");
      out.write("\t<br>\n");
      out.write("\t<br>\n");
      out.write("\t<br>\n");
      out.write("\t<br>\n");
      out.write("\t<br>\n");
      out.write("\t<br>\n");
      out.write("\t\t<h1 style=\"color: white;\">User Registration</h1>\n");
      out.write("\t\t<form action=\"Registration.jsp\" method=\"post\">\n");
      out.write("\t\t\t<table>\n");
      out.write("\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t<td>Username:</td>\n");
      out.write("\t\t\t\t\t<td><input type=\"text\" name=\"username\" placeholder=\"Username\" required></td>\n");
      out.write("\t\t\t\t</tr>\n");
      out.write("\t\t\t\t<tr>\n");
      out.write("\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t<td>First Name</td>\n");
      out.write("\t\t\t\t\t<td><input type=\"text\" name=\"firstname\" placeholder=\"First Name\" required></td>\n");
      out.write("\t\t\t\t\t<td>Last Name</td>\n");
      out.write("\t\t\t\t\t<td><input type=\"text\" name=\"lastname\" placeholder=\"Last Name\" required></td>\n");
      out.write("\t\t\t\t</tr>\n");
      out.write("\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t<td>Password:</td>\n");
      out.write("\t\t\t\t\t<td><input type=\"password\" name=\"password1\" placeholder=\"Password\" required></td>\n");
      out.write("\t\t\t\t</tr>\n");
      out.write("\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t<td>Confirm Password:</td>\n");
      out.write("\t\t\t\t\t<td><input type=\"password\" name=\"password2\" placeholder=\"Confirm Password\" required></td>\n");
      out.write("\t\t\t\t</tr>\n");
      out.write("\t\t\t\t<tr>\n");
      out.write("\t\t\t\t\t<td></td>\n");
      out.write("\t\t\t\t\t<td><input type=\"submit\" value=\"Register\"></td>\n");
      out.write("\t\t\t\t\t<td><a href=\"login.jsp\"><button style=\"font-size:14px; padding: 8px; background-color: black; color: white;\" type=\"button\">Back to Login</button></a></td>\n");
      out.write("\t\t\t\t\t<!-- <td><a href=\"register.jsp\">Registration</a></td> -->\n");
      out.write("\t\t\t\t</tr>\n");
      out.write("\t\t\t</table>\n");
      out.write("\t\t</form>\n");
      out.write("\t</div>\n");
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
