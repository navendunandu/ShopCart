<%-- 
    Document   : User
    Created on : 20 Aug, 2024, 5:40:21 PM
    Author     : Nandu
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration:User</title>
    </head>
    <body>
        <form action="../Assets/ActionPages/UserUpload.jsp" method="POST" enctype="multipart/form-data">
            <table border="1">
                    <tr>
                        <td>Name</td>
                        <td><input type="text" name="txt_name"></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="email" name="txt_email"></td>
                    </tr>
                    <tr>
                        <td>Contact</td>
                        <td><input type="text" name="txt_contact"></td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td><textarea name="txt_address"></textarea></td>
                    </tr>
                    <tr>
                        <td>District</td>
                        <td>
                            <select name="sel_dist">
                                <option value="">
                                    Select District
                                </option>
                                <%
                                    String selDist = "select * from tbl_district";
                                    ResultSet rsd = con.selectCommand(selDist);
                                    while (rsd.next()) {
                                %>
                                <option value="<%=rsd.getString("district_id")%>">
                                    <%=rsd.getString("district_name")%>
                                </option>
                                <%
                                    }
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Place</td>
                        <td><select name="sel_place" id="sel_place">
                                <option value="">----Select----</option>
                            </select></td>
                    </tr>
                    <tr>
                        <td>Gender</td>
                        <td>
                            <input type="radio" value="Male" name="rad_gender">Male
                            <input type="radio" value="Female" name="rad_gender">Female
                        </td>
                    </tr>
                    <tr>
                        <td>Date of Birth</td>
                        <td><input type="date" name="txt_dob"></td>
                    </tr>
                    <tr>
                        <td>Photo</td>
                        <td><input type="file" name="file_photo"></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="txt_pass"></td>
                    </tr>
                    <tr>
                        <td>Confirm Password</td>
                        <td><input type="password" name="txt_cpass"></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="submit" name="btn_submit" value="Register"></td>
                    </tr>
            </table>

        </form>
    </body>
</html>
