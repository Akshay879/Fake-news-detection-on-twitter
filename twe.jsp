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

    String consumerKey = (String) session.getAttribute("sapp_key");
    String consumerSecret = (String) session.getAttribute("sapp_secret");
    String accessToken = (String) session.getAttribute("sacc_key");
    String accessTokenSecret = (String) session.getAttribute("sacc_token");

    if (consumerKey == null || consumerSecret == null || accessToken == null || accessTokenSecret == null) {
        response.sendRedirect("update_secret_keys.jsp");
    }

%>
<%    boolean isComment = false;
    int tweetId = 0;

    if (request.getParameter("isComment") != null) {
        isComment = Boolean.valueOf(request.getParameter("isComment").toString());
        tweetId = Integer.parseInt(request.getParameter("tweetId"));
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Project Name</title>
        <meta charset="utf-8">
        <script>
            function countChar(val) {
                var len = val.value.length;
                if (len >= 280) {
                    val.value = val.value.substring(0, 280);
                } else {
                    $('#charNum').text(280 - len);
                }
            }
            ;
        </script>
        <%
            if (request.getParameter("msg") != null) {
        %>
        <script>alert('Updated');</script>
        <%}%>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
        <%            long serialVersionUID = -2486285775626564821L;
            String URL_REGEX = "((www\\.[\\s]+)|(https?://[^\\s]+))";
            String CONSECUTIVE_CHARS = "([a-z])\\1{1,}";
            String STARTS_WITH_NUMBER = "[1-9]\\s*(\\w+)";
            String quest = "\\?";

        %>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body id="top" >
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
            <!-- ################################################################################################ -->
            <!-- ################################################################################################ -->
        </div>
        <div class="wrapper row4" style="background-image: url('img/compose.jpg');">
            <main class="hoc container clear">
                <div class="center btmspace-80">
                    <h3 class="heading" style="color:red;font-size: 20px;">Compose New Tweet Here!!</h3>
                    <form action="<%= request.getContextPath()%>/Tweet" method="post" >
                        <input type="hidden" name="isComment" id="isComment" value="<%= isComment%>"/>
                        <input type="hidden" name="tweetId" id="tweetId" value="<%= tweetId%>"/>
                        <center>
                            <textarea name="msg" onkeyup="countChar(this)" required="" style="width: 360px; height: 100px; border-bottom-color: #00abf0; color: #269abc"></textarea><br>
                            <div id="charNum"></div><br>
                            <button type="submit" style="color: #000">Tweet</button><br>
                        </center>
                    </form>
                </div>
            </main>

            <!-- ################################################################################################ -->
            <!-- ################################################################################################ -->
            <!-- ################################################################################################ -->
            <a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
            <!-- JAVASCRIPTS -->
            <script src="layout/scripts/jquery.min.js"></script>
            <script src="layout/scripts/jquery.backtotop.js"></script>
            <script src="layout/scripts/jquery.mobilemenu.js"></script>
            <script src="layout/scripts/jquery.flexslider-min.js"></script>
        </div>
    </body>
</html>