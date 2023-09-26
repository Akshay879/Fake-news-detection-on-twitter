<%@page import="Upload.TweetData"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Search News</title>

        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">

        <link rel="stylesheet" type="text/css" href="styles.css" />


    </head>
    <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
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
    <body  id="top" style="background-image: url('img/news.jpg');">

        <div class="bgded overlay">
            <div class="wrapper row0">
                <div id="topbar" class="hoc clear">
                    <div class="fl_left">
                    </div>
                    <div class="fl_right">
                        <ul>
                            <li><a href="ahome.jsp">Home</a></li>
                            <li><a href="user_graph.jsp">Graph</a></li>
                            <li><a href="news_search_admin.jsp">News Search</a></li>

                            <li><a href="admin_logout.jsp">Logout</a></li>
                        </ul>
                    </div>
                </div>
            </div>

        </div>

        <form id="searchForm" method="post" action="SearchNews">
            <div style="width: 100%;text-align: center">
                <div style="display: inline-block;margin: 0 auto;">
                    <h2>Search News!</h2>
                    <input id="s" name="keyword" type="text" required="required" />
                    <input  name="userType" value="admin" type="hidden" />
                    <input type="submit" value="Submit" id="submitButton" />
                </div>
            </div>
        </form>

        <% if (request.getAttribute("rsMedia") != null) {

                int mediaDF = Integer.parseInt(request.getAttribute("mediaDF").toString());
                int twitterDF = Integer.parseInt(request.getAttribute("twitterDF").toString());

//                ResultSet rsMedia = (ResultSet) request.getAttribute("rsMedia");
                List<TweetData> rsMedia = (List<TweetData>) request.getAttribute("rsMedia");
                ResultSet rsTwitter = (ResultSet) request.getAttribute("rsTwitter");
                String algorithmResult = (String) request.getAttribute("algorithmResult");
                if (twitterDF == 0 && mediaDF == 0) {
        %>
        <h3 style="width: 100%;background-color: white;color: black;margin-bottom: 5px"><center >Fake News!</center></h3>
                <%
                } else {

                    float per = 0;

                    for (int i = 0; i < rsMedia.size(); i++) {

                        per += rsMedia.get(i).getPercentage();

                %>

        <div style="width: 98%;background-color: white;color: blue;margin-bottom: 5px">
            <div style="padding: 8px;border-style: solid; border-width: 1px; border-color: rgb(160,160,255);text-align: center">
                <div style="width: 100%;">
                    <div style="float: left;background-color: #737CA1;color: white;padding: 4px;border-radius: 5px"><b>Twitter DF: <%= twitterDF%></b></div>

                    <% if (mediaDF > 0) {%>
                    <div style="display: inline-block;margin: 0 auto; background-color: #32CD32;color: white;padding: 4px;border-radius: 5px;">
                        <img src="img/thumbs-up.png" style="float: left;padding-right: 4px" alt="hhh" width="24" height="24"/>
                        <b>Genuine News!</b>
                    </div>
                    <%} else {%>
                    <div style="display: inline-block;margin: 0 auto; background-color: red;color: white;padding: 4px;border-radius: 5px;">
                        <img src="img/thumb-down.png" style="float: left;padding-right: 4px" alt="hhh" width="24" height="24"/>
                        <b>Fake News!</b>
                    </div>
                    <%}%>

                    <div style="float: right;background-color: #737CA1;color: white;padding: 4px;border-radius: 5px"><b>Media DF: <%= mediaDF%></b></div>
                    <br>
                    <div style="float: right;padding: 4px;border-radius: 5px;">
                        <a href="<%= rsMedia.get(i).getTweetUrl()%>" target="_blank" style="background-color: #737CA1;color: white; padding: 3px;">View Source</a>
                    </div>
                    <div style="clear: both"></div>
                </div>
                <!--  <br>-->

                <div style="padding-top: 5px">
                    <img src="<%= rsMedia.get(i).getImage()%>" style="float: left;padding-right: 4px" alt="hhh" width="60" height="60"/>
                    <%= rsMedia.get(i).getTweetBody()%>
                    <div style="clear: both"></div>
                </div>

            </div>
        </div>
        <% }%>

        <div style="display: inline-block;margin: 5px auto; font-size: 16px; width: 100%; background-color: white;color: blue;">
            Algorithm Result: <%= algorithmResult%> &nbsp;&nbsp; Accuracy: <%= (per / rsMedia.size())%>%
        </div>

        <% while (rsTwitter.next()) {
        %>


        <div style="width: 98%;background-color: white;color: blue;margin-bottom: 5px">
            <div style="padding: 8px;border-style: solid; border-width: 1px; border-color: rgb(160,160,255);text-align: center">
                <div style="width: 100%;">
                    <div style="float: left;background-color: #737CA1;color: white;padding: 4px;border-radius: 5px"><b>Twitter DF: <%= twitterDF%></b></div>

                    <% if (mediaDF > 0) {%>
                    <div style="display: inline-block;margin: 0 auto; background-color: #32CD32;color: white;padding: 4px;border-radius: 5px;">
                        <img src="img/thumbs-up.png" style="float: left;padding-right: 4px" alt="hhh" width="24" height="24"/>
                        <b>Genuine News!</b>
                    </div>
                    <%} else {%>
                    <div style="display: inline-block;margin: 0 auto; background-color: red;color: white;padding: 4px;border-radius: 5px;">
                        <img src="img/thumb-down.png" style="float: left;padding-right: 4px" alt="hhh" width="24" height="24"/>
                        <b>Fake News!</b>
                    </div>
                    <%}%>

                    <div style="float: right;background-color: #737CA1;color: white;padding: 4px;border-radius: 5px"><b>Media DF: <%= mediaDF%></b></div>
                    <div style="clear: both"></div>
                </div>
                <!--  <br>-->

                <div style="padding-top: 5px">
                    <img src="viewimage.jsp?id=<%= rsTwitter.getString("email")%>" style="float: left;padding-right: 4px" alt="hhh" width="60" height="60"/>
                    <%= rsTwitter.getString("msg")%>
                    <div style="clear: both"></div>
                </div>
            </div>
        </div>
        <% }
                }
            }%>

        <!-- It would be great if you leave the link back to the tutorial. Thanks! -->

        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
    </body>
</html>
