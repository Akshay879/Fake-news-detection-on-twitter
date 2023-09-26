<%@page import="Mysql.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%
    String email = (String) session.getAttribute("semail");
    String currentPassword = request.getParameter("current");
    String Newpass = request.getParameter("new");
    String conpass = request.getParameter("confirm");
    Connection con = DbConnection.getConnection();
    Statement st = con.createStatement();
    String pass = "";
    int id = 0;
    try {
        ResultSet rs = st.executeQuery("select * from user_details where email='" + email + "' and pass='" + currentPassword + "'");
        while (rs.next()) {
            pass = rs.getString("pass");
        }
        if (pass.equals(currentPassword)) {
            if (Newpass.equals(conpass)) {
                Statement st1 = con.createStatement();
                int i = st1.executeUpdate("update user_details set pass='" + Newpass + "' where email='" + email + "'");
                response.sendRedirect("change_password.jsp?log=Success");
                st1.close();
                con.close();
            } else {
                response.sendRedirect("change_password.jsp?log=Match");
            }
        } else {
            response.sendRedirect("change_password.jsp?log=Failure");
        }
    } catch (Exception e) {
        out.println(e);
    }
%>