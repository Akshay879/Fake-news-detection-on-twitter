<%@page import="twitter4j.Paging"%>
<%@page import="org.apache.commons.lang.StringEscapeUtils"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="key.Constants"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Mysql.DbConnection"%>
<%@page import="twitter4j.Status" %>
<%@page import="twitter4j.TwitterException" %>
<%@page import="twitter4j.TwitterFactory" %>
<%@page import="twitter4j.conf.ConfigurationBuilder" %>
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
        <script type="text/javascript">
            function urlify() {
                if (new RegExp("([a-zA-Z0-9]+://)?([a-zA-Z0-9_]+:[a-zA-Z0-9_]+@)?([a-zA-Z0-9.-]+\\.[A-Za-z]{2,4})(:[0-9]+)?(/.*)?").test(status_text)) {
                    alert("url inside");
                }
            }
        </script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
        <%
            long serialVersionUID = -2486285775626564821L;
            String URL_REGEX = "((www\\.[\\s]+)|(https?:\\/\\/[^\\s]+))";
            String CONSECUTIVE_CHARS = "([a-z])\\1{1,}";
            String STARTS_WITH_NUMBER = "[1-9]\\s*(\\w+)";
            String quest = "\\?";

        %>
    </head>
    <%         response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        response.setDateHeader("Expires", 0); // Proxies.
    %>
    <%
        String id = null;
        if (session.getAttribute("admin") != null) {
            id = session.getAttribute("admin").toString(); // user id
        } else {
            response.sendRedirect("admin.jsp");
        }
    %>
    <body id="top" onload="urlify()">
        <div class="bgded overlay">
            <div class="wrapper row0">
                <div id="topbar" class="hoc clear">
                    <div class="fl_left">
                    </div>
                    <div class="fl_right">
                        <ul>
                            <li><a href="ahome.jsp">Home</a></li>
                            <li><a href="user_graph.jsp">Graph</a></li>
                            <li><a href="admin_logout.jsp">Logout</a></li>
                            <!--                            <li><a href="user.jsp">User Login</a></li>
                                                        <li><a href="admin.jsp">Admin Login</a></li>-->
                        </ul>
                    </div>
                </div>
            </div>


            <!-- ################################################################################################ -->
        </div>
        <div class="wrapper row3 overlay" style="background-image: url('img/admin_home.jpg');">
            <main class="hoc container clear">
                <!-- main body -->
                <!-- ################################################################################################ -->
                <div class="center btmspace-80">

                    <%                        // keys
                        ConfigurationBuilder cf = new ConfigurationBuilder();
//                        cf.setDebugEnabled(true)
//                                .setOAuthConsumerKey("ya8UFSia5IF57ZfrWgnNNBdw1")
//                                .setOAuthConsumerSecret("zPKMDoQm6I8CpOVitHTO67hJKBkX1lGzREB3hfVIkLx7ZpGHkJ")
//                                .setOAuthAccessToken("979682664600031232-7h1yx9BXMpxO6SxPMOBzzArLcdRAeMa")
//                                .setOAuthAccessTokenSecret("YedVY0xs9y2P6aYbXODUVKYXCmMbsh9qXkSEntgJVjOkn");

                        cf.setDebugEnabled(true)
                                .setOAuthConsumerKey(Constants.CONSUMER_KEY)
                                .setOAuthConsumerSecret(Constants.CONSUMER_SECRET)
                                .setOAuthAccessToken(Constants.CONSUMER_ACCESS_TOKEN)
                                .setOAuthAccessTokenSecret(Constants.CONSUMER_ACCESS_TOKEN_SECRET);
                        TwitterFactory tf = new TwitterFactory(cf.build());
                        twitter4j.Twitter twitter = tf.getInstance();

                        Connection con = DbConnection.getConnection();


                    %>
                    <!-- / Main body -->
                    <table>
                        <tr>
                            <th>User ID</th>
                            <th>Profile Images</th>
                            <th>User Name</th>
                            <th>Post</th>
                        </tr>
                        <%                            Paging p = new Paging(1, 50);

                            for (int pageNo = 2; pageNo <= 3; pageNo++) {
                                java.util.List<Status> status = twitter.getHomeTimeline(p);
                                for (Status st : status) {
                                    Status tweetById = twitter.showStatus(st.getId());
                                    String url = "https://twitter.com/" + tweetById.getUser().getScreenName()
                                            + "/status/" + tweetById.getId();
                                    PreparedStatement stt = con.prepareStatement("insert into tweets (uid, img, uname, post, tweet_url)"
                                            + " values ('" + st.getId() + "', '" + st.getUser().getBiggerProfileImageURL() + "', '" + st.getUser().getName() + "', ?, '" + url + "')");
                                    String tweet = st.getText().replace("'", " ");
                                    tweet = tweet.replaceAll(URL_REGEX, "");
                                    tweet = tweet.replaceAll("@([^\\s]+)", "");
//                                    tweet = tweet.replaceAll(CONSECUTIVE_CHARS, "$1");
                                    tweet = tweet.replaceAll(STARTS_WITH_NUMBER, "");
                                    tweet = tweet.replaceAll("&", "&");
                                    tweet = tweet.replaceAll("#", "");
                                    tweet = tweet.replaceAll("/", "");
                                    tweet = tweet.replaceAll(quest, "");

                                    tweet = StringEscapeUtils.escapeJava(tweet);

                                    System.out.println("Replce Tweets *-* : " + tweet);
                                    stt.setString(1, tweet);
                                    stt.executeUpdate();

                        %>
                        <tr>
                            <td style="color: black"><%=st.getId()%></td>
                            <td><img src="<%=st.getUser().getBiggerProfileImageURL()%>" width="50" height="50" /></td>
                            <td style="color: darkblue"><%=st.getUser().getName()%></td>
                            <%
                                String a = st.getText();
                                a = a.replaceAll("#", "");
                            %>
                            <td style="color: blueviolet"><%= a%></td>
                        </tr>
                        <%}
                                p.setPage(pageNo);
                            }%>
                    </table>
                    <a href="Pre_Process.jsp"><input type="Submit" value="Pre-Processing" class="button" ></a>
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