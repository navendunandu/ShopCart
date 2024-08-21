<%-- 
    Document   : Place
    Created on : 20 Aug, 2024, 4:22:50 PM
    Author     : Nandu
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <!DOCTYPE html>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Place</title>
        </head>
    <%
        if (request.getParameter("btn_submit") != null) {
            String place = request.getParameter("txt_place");
            String district = request.getParameter("sel_dist");
            String id = request.getParameter("txt_id");
            if (id == "") {
                String insQry = "insert into tbl_place(district_id, place_name) values('" + district + "','" + place + "')";
                if (con.executeCommand(insQry)) {
    %>
    <script>
        alert("Inserted");
        window.location = "Place.jsp";
    </script>
    <%
        }
    } else {
        String updQry = "update tbl_place set place_name='" + place + "', district_id='"+ district +"' where place_id=" + id;
        if (con.executeCommand(updQry)) {
    %>
    <script>
        alert("Updated");
        window.location = "District.jsp";
    </script>
    <%
                }
            }
        }

        if (request.getParameter("did") != null) {
            String delQry = "delete from tbl_place where place_id=" + request.getParameter("did");
            if (con.executeCommand(delQry)) {
    %>
    <script>
        alert("Deleted");
        window.location = "Place.jsp";
    </script>
    <%
            }
        }
        String place = "";
        String placeId = "";
        String distId = "";
        if (request.getParameter("eid") != null) {
            String selEdit = "select * from tbl_place where place_id=" + request.getParameter("eid");
            ResultSet rse = con.selectCommand(selEdit);
            rse.next();
            place = rse.getString("place_name");
            placeId = rse.getString("place_id");
            distId = rse.getString("district_id");
        }
    %>
    <body>
        <form method="POST">
            <input type="hidden" name="txt_id" value="<%=placeId%>">
            <table border="1">
                <thead>
                    <tr>
                        <th>
                            District
                        </th>
                        <th>
                            <select name="sel_dist">
                                <option value="">
                                    Select District
                                </option>
                                <%
                                    String selDist = "select * from tbl_district";
                                    ResultSet rsd = con.selectCommand(selDist);
                                    while (rsd.next()) {
                                %>
                                <option value="<%=rsd.getString("district_id")%>"
                                        <%
                                        String dd = rsd.getString("district_id");
                                        if(dd.equals(distId)){
                                            out.print("selected");
                                        }
                                        %>
                                        >
                                    <%=rsd.getString("district_name")%>
                                </option>
                                <%
                                    }
                                %>
                            </select>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            Place
                        </td>
                        <td>
                            <input type="text" name="txt_place" value="<%=place%>">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="submit" value="Submit" name="btn_submit">
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
        <table border="1">
            <thead>
                <tr>
                    <th>Sl.No</th>
                    <th>Place</th>
                    <th>District</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    String selPlace = "select * from tbl_place p inner join tbl_district d on p.district_id=d.district_id";
                    ResultSet rsp = con.selectCommand(selPlace);
                    int i = 0;
                    while (rsp.next()) {
                        i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rsp.getString("place_name")%></td>
                    <td><%=rsp.getString("district_name")%></td>
                    <td><a href="Place.jsp?did=<%=rsp.getString("place_id")%>">Delete</a>||<a href="Place.jsp?eid=<%=rsp.getString("place_id")%>">Edit</a></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>

    </body>
</html>
