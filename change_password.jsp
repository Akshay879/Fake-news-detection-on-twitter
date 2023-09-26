<%@page import="Mysql.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setDateHeader("Expires", 0); // Proxies.
%>
<%
    String user_id = null;
    if (session.getAttribute("semail") != null) {
        user_id = session.getAttribute("semail").toString(); // user id
    } else {
        response.sendRedirect("index.jsp");
    }
%>
<%
    String email = (String) session.getAttribute("semail");
    String name = null, id = null, country = null, display_name = null;
    Connection con = DbConnection.getConnection();
    Statement st = con.createStatement();
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <title>Project Name</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
        <link rel="stylesheet" href="css/style.css">
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

        <script>
            function countChar(val) {
                var len = val.value.length;
                if (len >= 140) {
                    val.value = val.value.substring(0, 140);
                } else {
                    $('#charNum').text(140 - len);
                }
            }
            ;
        </script>
        <script type="text/javascript">
            var Msg = '<%=request.getParameter("log")%>';
            if (Msg == "Success") {
                alert("Password Changed Successfully");
            }
            if (Msg == "Failure") {
                alert("Invalid Current Password");
            }
            if (Msg == "Match") {
                alert("New and Confirm Password Doesnt Match");
            }
        </script>
    </head>
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

            %>

            <div class="content" style="background-image: url('img/change_password.jpg');">
                <div class="wrapper row1">
                    <header id="header" class="hoc clear">
                        <div class="container">
                            <div class="login" >
                                <h3 class="login-heading">
                                    Change Your Password</h3>
                                <form action="change_process.jsp" method="get">
                                    <input type="password" name="current" placeholder="Old Password" required="required" class="input-txt" />
                                    <span class="label info" style="background-color: #2196F3;font-size:18px;">Password Lenght 6, Atleast 1 no and 1 Alphabet..</span>
                                    <input type="password" name="new" placeholder="New Password" pattern="^(?=.*[0-9])(?=.*[a-z]).{6,}$" required="required" class="input-txt" />
                                    <input type="password" name="confirm" placeholder="Confirm Password" pattern="^(?=.*[0-9])(?=.*[a-z]).{6,}$" required="required" class="input-txt" />
                                    <button type="submit" class="btn btn--right">Change</button>
                                </form>
                            </div>
                        </div>
                        <!-- ################################################################################################ -->
                    </header>
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



<!------------------------------------------------------ Content Header (Page header) ------------------------>
