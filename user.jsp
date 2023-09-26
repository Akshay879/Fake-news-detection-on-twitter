<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setDateHeader("Expires", 0); // Proxies.
%>
<%
    String uid = null;
    if (session.getAttribute("semail") != null) {
        uid = session.getAttribute("semail").toString(); // user id
    }

    String email = "", password = "";
    boolean verifyOtp = false;

    if (request.getAttribute("email") != null) {
        email = (String) request.getAttribute("email");
    }

    if (request.getAttribute("password") != null) {
        password = (String) request.getAttribute("password");
    }

    if (request.getAttribute("verifyOtp") != null) {
        verifyOtp = (boolean) request.getAttribute("verifyOtp");
    }

%>
<html>
    <head>
        <title>Fake News Detection In Twitter</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
        <%            if (request.getParameter("msgg") != null) {
        %>
        <script>alert('<%= (String) request.getParameter("msgg")%>');</script>
        <%            }
        %>
        <%
            if (request.getParameter("msg") != null) {

        %>
        <script>alert('Registration Success!!');</script>
        <%            }
        %>
        <%
            if (request.getParameter("mes") != null) {

        %>
        <script>alert('<%= request.getParameter("mes")%>');</script>
        <%            }
        %>

        <link rel="stylesheet" href="css/style.css">
    </head>
    <body id="top">

        <div class="bgded overlay">
            <div class="wrapper row0">
                <div id="topbar" class="hoc clear" >
                    <div class="fl_left">
                    </div>
                    <div class="fl_right" >
                        <ul>
                            <li><a href="index.jsp">Home</a></li>
                            <li><a href="https://apps.twitter.com/" target="_blank"><b>Get API</b></a></li>
                            <li><a href="user.jsp">User Login</a></li>
                            <li><a href="admin.jsp">Admin Login</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="content" style="background-image: url('img/admin.jpg');">
                <div class="wrapper row1">
                    <header id="header" class="hoc clear">
                        <!-- ################################################################################################ -->
                        <!--      <div id="logo" class="fl_left">
                                <h1><a href="index.html">TWITTER</a></h1>
                              </div>-->
                        <!--- --->

                        <div class="container">

                            <div class="login" >

                                <h3 class="login-heading">
                                    <strong>Welcome.</strong> Please login.</h3>
                                <form method="post" action="action.jsp" >
                                    <input type="email" name="name" placeholder="E-mail ID" required="required"
                                           value="<%= email%>" class="input-txt" />
                                    <input type="password" name="pass" placeholder="Password" required="required"
                                           value="<%= password%>" class="input-txt" />
                                    <% if (verifyOtp) {%>
                                    <input type="password" name="otp" placeholder="OTP"
                                           required="required" class="input-txt" />
                                    <input type="hidden" name="verifyOtp" value="<%= verifyOtp%>"/>
                                    <%}%>
                                    <input type="hidden" name="status" value="1">
                                    <div class="login-footer">
                                        <a href="register.jsp" class="lnk">
                                            <span class="icon icon--min"></span>
                                            Sign Up Here!!
                                        </a>
                                        <br>
                                        <a href="forgot_password.jsp" class="lnk">
                                            <span class="icon icon--min"></span>
                                            Forgot Password
                                        </a>
                                        <button type="submit" class="btn btn--right">Sign in  </button>
                                    </div>
                                </form>

                            </div>
                        </div>

                        <!-- ################################################################################################ -->
                    </header>
                </div>
                <!-- ################################################################################################ -->
            </div>
        </div>

        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->

        <!-- JAVASCRIPTS -->
        <script src="layout/scripts/jquery.min.js"></script>
        <script  src="js/index.js"></script>
        <script src="layout/scripts/jquery.backtotop.js"></script>
        <script src="layout/scripts/jquery.mobilemenu.js"></script>
        <script src="layout/scripts/jquery.flexslider-min.js"></script>

    </body>
</html>