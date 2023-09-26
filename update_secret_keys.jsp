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
<%
    boolean isComment = false;
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
        <title>Fake News Detection In Twitter</title>
        <meta charset="utf-8">
        <script>
            function validate()
            {
                var app_key = document.getElementById("app_key");
                var app_secret_key = document.getElementById("app_secret_key");
                var access_key = document.getElementById("access_key");
                var acc_token_key = document.getElementById("acc_token_key");
                if (app_key.value.length < 25)
                {
                    alert("App Key Should be 25 Characters!");
                    return false;
                }
                if (app_secret_key.value.length < 50)
                {
                    alert("App Secret Key Should be 50 Characters!");
                    return false;
                }
                if (access_key.value.length < 50)
                {
                    alert("Access Key Should be 50 Characters!");
                    return false;
                }
                if (acc_token_key.value.length < 45)
                {
                    alert("Access Token Key Should be 45 Characters!");
                    return false;
                }
            }
        </script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
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
                    <br><br><br>
                    <h3 class="heading" style="color:red;font-size: 20px;">Before composing Tweet you need to update Twitter API keys here</h3>
                    <form action="<%= request.getContextPath()%>//UpdateKeys" method="post" onsubmit="return validate()">
                        <input type="hidden" name="isComment" id="isComment" value="<%= isComment%>"/>
                        <input type="hidden" name="tweetId" id="tweetId" value="<%= tweetId%>"/>
                        <center>
                            <input type="password" name="app_key" id="app_key" placeholder="Consumer Key (API Key)" required="required" class="input-txt" />
                            <input type="password" name="app_secret_key" id="app_secret_key" placeholder="Consumer Secret (API Secret)" required="required" class="input-txt" />
                            <input type="password" name="access_key" id="access_key" placeholder="Access Token" required="required" class="input-txt" />
                            <input type="password" name="acc_token_key" id="acc_token_key" placeholder="Access Token Secret" required="required" class="input-txt" onkeypress="return check(event)"/>
                            <br>
                            <button type="submit" style="color: #000">Update</button><br>
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