<%@page import="Mysql.DbConnection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Fake News Detection In Twitter</title>

        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">

        <link rel="stylesheet" type="text/css" href="styles.css" />


    </head>

    <body  id="top" style="background-image: url('img/compose.jpg');">

        <div class="bgded overlay">
            <div class="wrapper row0">
                <div id="topbar" class="hoc clear">
                    <div class="fl_left">
                    </div>
                    <div class="fl_right">
                        <ul>
                            <li><a href="uhome.jsp">Home</a></li>
                            <li><a href="news_search.jsp">News Search</a></li>
                            <li><a id="myBtn" href="twe.jsp">Compose Tweet</a></li>
                            <li><a href="my_tweets.jsp">My Tweet's</a></li>
                            <li><a href="news_rank.jsp">News Rank</a></li>
                            <li><a href="change_password.jsp">Change Password</a></li>
                            <li><a href="user_logout.jsp">Logout</a></li>
                        </ul>
                    </div>
                </div>
            </div>

        </div>

        <%
            Connection conn = DbConnection.getConnection();
            String sql = "SELECT * FROM tweets"
                    + " ORDER BY tweet_weight DESC";
            ResultSet rsMedia = conn.createStatement().executeQuery(sql);

            int row = 0;
            if (rsMedia != null) {
                rsMedia.last();
                row = rsMedia.getRow();
            }

            if (row == 0) {
        %>
        <br><br><br><br><br><br><br><br><br><br><br><br>
        <h3 style="width: 100%;background-color: white;color: black;margin-bottom: 5px"><center >No News Found!</center></h3>
                <%
                } else {
                %>
        <h3>Prioritized News [Based on ranking] </h3>
        <%
            rsMedia.beforeFirst();
            int i = 1;
            while (rsMedia.next()) {
        %>
        <div style="width: 98%;background-color: white;color: blue;margin-bottom: 5px">
            <div style="padding: 8px;border-style: solid; border-width: 1px; border-color: rgb(160,160,255);text-align: center">
                <div style="padding-top: 5px">
                    <label style="float: left; color: #000;"><%= i%></label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <img src="<%= rsMedia.getString("img")%>" style="float: left;margin-left: 25px;padding-right: 4px" alt="hhh" width="60" height="60"/>
                    <%= rsMedia.getString("post")%>
                    <div style="clear: both"></div>
                </div>
            </div>
        </div>
        <%
                    i++;
                }
            }%>

        <!-- It would be great if you leave the link back to the tutorial. Thanks! -->

        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
    </body>
</html>
