package org.apache.jsp.Admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;

public final class District_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      DB.ConnectionClass con = null;
      synchronized (_jspx_page_context) {
        con = (DB.ConnectionClass) _jspx_page_context.getAttribute("con", PageContext.PAGE_SCOPE);
        if (con == null){
          con = new DB.ConnectionClass();
          _jspx_page_context.setAttribute("con", con, PageContext.PAGE_SCOPE);
        }
      }
      out.write("\n");
      out.write("\n");
      out.write("    <!DOCTYPE html>\n");
      out.write("    <html>\n");
      out.write("        <head>\n");
      out.write("            <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("            <title>District</title>\n");
      out.write("        </head>\n");
      out.write("    ");

        if (request.getParameter("btn_submit") != null) {
            String district = request.getParameter("txt_dist");
            String id = request.getParameter("txt_id");
            if (id == "") {
                String insQry = "insert into tbl_district(district_name) values('" + district + "')";
                if (con.executeCommand(insQry)) {
    
      out.write("\n");
      out.write("    <script>\n");
      out.write("        alert(\"Inserted\");\n");
      out.write("        window.location = \"District.jsp\";\n");
      out.write("    </script>\n");
      out.write("    ");

        }
    } else {
        String updQry = "update tbl_district set district_name='" + district + "' where district_id=" + id;
        if (con.executeCommand(updQry)) {
    
      out.write("\n");
      out.write("    <script>\n");
      out.write("        alert(\"Updated\");\n");
      out.write("        window.location = \"District.jsp\";\n");
      out.write("    </script>\n");
      out.write("    ");

                }
            }
        }

        if (request.getParameter("did") != null) {
            String delQry = "delete from tbl_district where district_id=" + request.getParameter("did");
            if (con.executeCommand(delQry)) {
    
      out.write("\n");
      out.write("    <script>\n");
      out.write("        alert(\"Deleted\");\n");
      out.write("        window.location = \"District.jsp\";\n");
      out.write("    </script>\n");
      out.write("    ");

            }
        }
        String dist = "";
        String distId = "";
        if (request.getParameter("eid") != null) {
            String selEdit = "select * from tbl_district where district_id=" + request.getParameter("eid");
            ResultSet rse = con.selectCommand(selEdit);
            rse.next();
            dist = rse.getString("district_name");
            distId = rse.getString("district_id");
        }
    
      out.write("\n");
      out.write("    <body>\n");
      out.write("        <form method=\"post\">\n");
      out.write("            <input type=\"hidden\" name=\"txt_id\" value=\"");
      out.print(distId);
      out.write("\">\n");
      out.write("            <table border=\"1\">\n");
      out.write("                <thead>\n");
      out.write("                    <tr>\n");
      out.write("                        <th>District</th>\n");
      out.write("                        <th><input type=\"text\" name=\"txt_dist\" value=\"");
      out.print(dist);
      out.write("\"></th>\n");
      out.write("                    </tr>\n");
      out.write("                </thead>\n");
      out.write("                <tbody>\n");
      out.write("                    <tr>\n");
      out.write("                        <td colspan=\"2\">\n");
      out.write("                            <input type=\"submit\" name=\"btn_submit\" value=\"Submit\">\n");
      out.write("                        </td>\n");
      out.write("                    </tr>\n");
      out.write("                </tbody>\n");
      out.write("            </table>\n");
      out.write("        </form>\n");
      out.write("        <table border=\"1\">\n");
      out.write("            <thead>\n");
      out.write("                <tr>\n");
      out.write("                    <th>Sl.No</th>\n");
      out.write("                    <th>District</th>\n");
      out.write("                    <th>Action</th>\n");
      out.write("                </tr>\n");
      out.write("            </thead>\n");
      out.write("            <tbody>\n");
      out.write("                ");

                    String selQry = "select * from tbl_district";
                    ResultSet rs = con.selectCommand(selQry);
                    int i = 0;
                    while (rs.next()) {
                        i++;
                
      out.write("\n");
      out.write("                <tr>\n");
      out.write("                    <td>");
      out.print(i);
      out.write("</td>\n");
      out.write("                    <td>");
      out.print( rs.getString("district_name"));
      out.write("</td>\n");
      out.write("                    <td><a href=\"District.jsp?did=");
      out.print( rs.getString("district_id"));
      out.write("\">Delete</a> || <a href=\"District.jsp?eid=");
      out.print( rs.getString("district_id"));
      out.write("\">Edit</a></td>\n");
      out.write("                </tr>\n");
      out.write("                ");

                    }
                
      out.write("\n");
      out.write("            </tbody>\n");
      out.write("        </table>\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
