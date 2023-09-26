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
        <title>Fake News Detection In Twitter</title>
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
                            <li><a href="index.jsp">Home</a></li>
                            <!--                            <li><a href="user.jsp">User Login</a></li>
                                                        <li><a href="admin.jsp">Admin Login</a></li>-->
                        </ul>
                    </div>
                </div>
            </div>
            <div class="wrapper row1">
                <header id="header" class="hoc clear">
                    <!-- ################################################################################################ -->
                    <div id="logo" class="fl_left">
                        <h1><a href="index.jsp">TWITTER</a></h1>
                    </div>

                    <!-- ################################################################################################ -->
                </header>
            </div>
            <div id="pageintro" class="hoc clear">
                <!-- ################################################################################################ -->
                <div class="flexslider basicslider">
                    <ul class="slides">
                        <li>
                            <article>
                                <h3 style="font-size: 32px"><br><br>SociRank: Identifying and Ranking Prevalent News Topics Using Social Media Factors<br></h3>

                                <footer>
                                    <form class="group" method="post" action="#">
                                        <fieldset>
                                            <legend>Newsletter:</legend>
                                            <!--                  <input type="email" value="" placeholder="Email Here&hellip;">
                                                              <button class="fa fa-sign-in" type="submit" title="Submit"><em>Submit</em></button>-->
                                        </fieldset>
                                    </form>
                                </footer>
                            </article>
                        </li>
                    </ul>
                </div>
                <!-- ################################################################################################ -->
            </div>
            <!-- ################################################################################################ -->
        </div>
        <div class="wrapper row3">
            <main class="hoc container clear">
                <!-- main body -->
                <!-- ################################################################################################ -->
                <div class="center btmspace-80">
                    <h3 class="heading">Tweet's get from Twitter</h3>
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
                            <th>User ID</th>
                            <th>Profile Images</th>
                            <th>User Name</th>
                            <th>Post</th>
                        </tr>
                        <%                            for (Status st : status) {
                                Connection con = DbConnection.getConnection();
                                Statement stt = con.createStatement();
                                String tweet = st.getText().replace("'", " ");
                                tweet = tweet.replaceAll(URL_REGEX, "");
                                tweet = tweet.replaceAll("@([^\\s]+)", "");
                                tweet = tweet.replaceAll(CONSECUTIVE_CHARS, "$1");
                                tweet = tweet.replaceAll(STARTS_WITH_NUMBER, "");
                                tweet = tweet.replaceAll("&", "&");
                                tweet = tweet.replaceAll(quest, "");
                                System.out.println("Replce Tweets *-* : " + tweet);
                                stt.executeUpdate("insert into tweets (uid, img, uname, post) values ('" + st.getId() + "', '" + st.getUser().getBiggerProfileImageURL() + "', '" + st.getUser().getName() + "', '" + tweet + "')");

                        %>
                        <tr>
                            <td style="color: black"><%=st.getId()%></td>
                            <td><img src="<%=st.getUser().getBiggerProfileImageURL()%>" width="50" height="50" /></td>
                            <td style="color: darkblue"><%=st.getUser().getName()%></td>
                            <td style="color: blueviolet"><%=st.getText()%></td>
                        </tr>
                        <%}%>
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