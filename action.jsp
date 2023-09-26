<%@page import="java.sql.ResultSet"%>
<%@page import="Mysql.DbConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Random"%>

<%
    Connection con = null;
    Statement st = null;

    ResultSet rs = null;
    String mail = request.getParameter("name");
    String pass = request.getParameter("pass");
    String otp = "";
    Boolean verifyOtp = Boolean.valueOf(request.getParameter("verifyOtp"));

    if (verifyOtp) {
        otp = request.getParameter("otp");
    }

    int status = Integer.parseInt(request.getParameter("status"));
    System.out.println("Status : " + status);

    try {
        con = DbConnection.getConnection();
        st = con.createStatement();
        Statement st1 = con.createStatement();
        switch (status) {
            case 1:
                try {
                    String sql = "select * from user_details where email='" + mail + "' AND pass='" + pass + "'";
                    rs = st.executeQuery(sql);
                    if (rs.next()) {

                        if ("".equals(otp) && 0 == rs.getInt("is_verified")) {
                            request.setAttribute("email", rs.getString("email"));
                            request.setAttribute("password", rs.getString("pass"));
                            request.setAttribute("verifyOtp", true);
//                            response.sendRedirect("user.jsp");
                            request.getRequestDispatcher("user.jsp").forward(request, response);
                            break;
                        } else {

                            if (verifyOtp && rs.getString("otp").equals(otp)) {

                                st1.execute("UPDATE user_details SET is_verified = 1 WHERE email = '" + mail + "'");
                            } else if (verifyOtp) {
                                response.sendRedirect("user.jsp?msgg=Invalid OTP");
                                break;
                            }
                        }

                        session.setAttribute("sapp_key", rs.getString("app_key"));
                        session.setAttribute("sapp_secret", rs.getString("app_secret"));
                        session.setAttribute("sacc_key", rs.getString("acc_key"));
                        session.setAttribute("sacc_token", rs.getString("acc_token"));
                        session.setAttribute("semail", rs.getString("email"));
                        session.setAttribute("suname", rs.getString("uname"));

                        response.sendRedirect("uhome.jsp");
                    } else {
                        response.sendRedirect("user.jsp?msgg=INvalid login credentials");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
            case 2:

                try {
                    con = DbConnection.getConnection();
                    st = con.createStatement();

                    if (mail.equalsIgnoreCase("admin") && pass.equalsIgnoreCase("admin")) {
                        st.executeUpdate("TRUNCATE tweets");
                        session.setAttribute("admin", "admin");
                        response.sendRedirect("ahome.jsp");
                    } else {
                        response.sendRedirect("admin.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;

            case 5:
                try {
                    rs = st.executeQuery("select * from reg where yyys='" + pass + "' AND role='Soldier'");
                    if (rs.next()) {
                        response.sendRedirect("s_home.jsp?msg=success");
                    } else {
                        response.sendRedirect("s_one_p.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;

            case 6:
                try {
                    rs = st.executeQuery("select * from reg where yyys='" + pass + "' AND role='Commander'");
                    if (rs.next()) {

                        response.sendRedirect("c_home.jsp?msg=success");
                    } else {
                        response.sendRedirect("c_one_p.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }

                break;

            case 8:
                try {
                    if (mail.equalsIgnoreCase("Admin") && pass.equalsIgnoreCase("Admin")) {
                        response.sendRedirect("admin_home.jsp?msg=success");
                    } else {
                        response.sendRedirect("admin.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;

            default:
                response.sendRedirect("index.html");
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }

%>
