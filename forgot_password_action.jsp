<%@page import="Mysql.Mail"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="Mysql.DbConnection"%>
<%
    String email = request.getParameter("email");

    String sql = "SELECT email, pass FROM user_details WHERE email = '" + email + "'";
    Statement stmt = DbConnection.getConnection().createStatement();

    ResultSet rsData = stmt.executeQuery(sql);

    if (rsData != null && rsData.first()) {
        String password = rsData.getString("pass");
        Mail.secretMail("Your password is " + password, "", email);
        response.sendRedirect("user.jsp?mes=Password sent to your registered mail id");
    } else {
        response.sendRedirect("user.jsp?mes=Invalid Email ID");
    }
%>