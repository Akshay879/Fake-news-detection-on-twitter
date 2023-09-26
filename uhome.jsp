<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Project Name</title>
        <meta charset="utf-8">
        <style>
            .button {
                background-color: #B94A48; /* Green */
                border: none;
                font-family: fantasy;
                color: white;
                padding: 5px 10px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
            }
        </style>

        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
        <%
            long serialVersionUID = -2486285775626564821L;
            String URL_REGEX = "((www\\.[\\s]+)|(https?://[^\\s]+))";
            String CONSECUTIVE_CHARS = "([a-z])\\1{1,}";
            String STARTS_WITH_NUMBER = "[1-9]\\s*(\\w+)";
            String quest = "\\?";

        %>
    </head>
    <%        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        response.setDateHeader("Expires", 0); // Proxies.
    %>
    <%
        String uid = null;
        if (session.getAttribute("semail") != null) {
            uid = session.getAttribute("semail").toString(); // user id
        } else {
            response.sendRedirect("user.jsp");
        }
    %>
    <body id="top">
        <div class="bgded overlay">
            <div class="wrapper row0">
                <div id="topbar" class="hoc clear">
                    <div class="fl_left">
                    </div>
                    <div class="fl_right">
                        <ul>
                            <li><a href="uhome.jsp">Home</a></li>
                            <li><a href="news_search.jsp">News Search</a></li>
                            <li><a href="twe.jsp">Compose Tweet</a></li>
                            <li><a href="my_tweets.jsp">My Tweet's</a></li>
                            <li><a href="news_rank.jsp">News Rank</a></li>
                            <li><a href="change_password.jsp">Change Password</a></li>
                            <li><a href="user_logout.jsp">Logout</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <%                String semail = (String) session.getAttribute("semail");
                String name = (String) session.getAttribute("suname");
                System.out.println("------------- : " + semail);
            %>
            <div class="content" style="background-image: url('img/user_home.jpg');">
                <div id="pageintro" class="hoc clear">
                    <!-- ################################################################################################ -->
                    <div class="flexslider basicslider">
                        <ul class="slides">
                            <li>
                                <article>
                                    <center><b><span style="font-size: 28px;color:red;">Project Name</span></b></center>
                                    <br><center>
                                        <font style="font-family: fantasy; font-size: 26px;color:red;">
                                        <%=name%>
                                        </font>
                                        <img src="viewimage.jsp?id=<%=semail%>" style="width: 200px; height: 200px">
                                    </center>

                                </article>
                            </li>
                        </ul>
                    </div>
                    <!-- ################################################################################################ -->
                </div>
            </div>
            <!-- ################################################################################################ -->
        </div>

        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <!-- ################################################################################################ -->
        <a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
        <!-- JAVASCRIPTS -->
        <script src="layout/scripts/jquery.min.js"></script>
        <script src="layout/scripts/jquery.backtotop.js"></script>
        <script src="layout/scripts/jquery.mobilemenu.js"></script>
        <script src="layout/scripts/jquery.flexslider-min.js"></script>
    </body>
</html>