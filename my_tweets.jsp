<%@page import="key.Constants"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Mysql.DbConnection"%>
<%@page import="twitter4j.Status" %>
<%@page import="twitter4j.TwitterException" %>
<%@page import="twitter4j.TwitterFactory" %>
<%@page import="twitter4j.conf.ConfigurationBuilder" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                            <li><a id="myBtn" href="twe.jsp">Compose Tweet</a></li>
                            <li><a href="my_tweets.jsp">My Tweets</a></li>
                            <li><a href="news_rank.jsp">News Rank</a></li>
                            <li><a href="change_password.jsp">Change Password</a></li>
                            <li><a href="user_logout.jsp">Logout</a></li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- ################################################################################################ -->
        </div>
        <div class="wrapper row3" style="background-image: url('img/my_tweet.jpg');">
            <main class="hoc container clear">
                <!-- main body -->
                <!-- ################################################################################################ -->
                <div class="center btmspace-80">
                    <h3 class="heading" style="color:white">My Tweet's</h3>
                    <%                        ConfigurationBuilder cf = new ConfigurationBuilder();
                        cf.setDebugEnabled(true)
                                .setOAuthConsumerKey(Constants.CONSUMER_KEY)
                                .setOAuthConsumerSecret(Constants.CONSUMER_SECRET)
                                .setOAuthAccessToken(Constants.CONSUMER_ACCESS_TOKEN)
                                .setOAuthAccessTokenSecret(Constants.CONSUMER_ACCESS_TOKEN_SECRET);

                        TwitterFactory tf = new TwitterFactory(cf.build());
                        twitter4j.Twitter twitter = tf.getInstance();
                        java.util.List<Status> status = twitter.getHomeTimeline();

                    %>
                    <!-- / Main body -->
                    <table>
                        <tr>
                            <th>S.no</th>
                            <th>Screen Name</th>
                            <th>Post</th>
                        </tr>
                        <%                            String email = (String) session.getAttribute("semail");
                            System.out.println("User Email ID : " + email);
                            Connection con = DbConnection.getConnection();
                            Statement st = con.createStatement();
                            ResultSet rs = st.executeQuery("select * from public_tweets where uid='" + email + "'");
                            while (rs.next()) {

                        %>
                        <tr>
                            <td style="color: black"><%=rs.getString("id")%></td>
                            <td style="color: black"><%=rs.getString("username")%></td>
                            <td style="color: darkblue"><%=rs.getString("msg")%></td>
                        </tr>
                        <%}%>
                    </table>
                    <!--<a href="Pre_Process.jsp"><input type="Submit" value="Pre-Processing" class="button" ></a>-->
                    <!-- / End body -->
                </div>
                <!-- ################################################################################################ -->
                <div class="clear"></div>
            </main>
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