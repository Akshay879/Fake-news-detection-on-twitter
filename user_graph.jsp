<%@page import="java.util.ArrayList"%>
<%@page import="Mysql.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
    // --- String Join Function converts from Java array to javascript string.
    public String join(ArrayList<?> arr, String del) {

        StringBuilder output = new StringBuilder();

        for (int i = 0; i < arr.size(); i++) {

            if (i > 0) {
                output.append(del);
            }

            // --- Quote strings, only, for JS syntax
            if (arr.get(i) instanceof String) {
                output.append("\"");
            }
            output.append(arr.get(i));
            if (arr.get(i) instanceof String) {
                output.append("\"");
            }
        }

        return output.toString();
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Fake News Detection In Twitter</title>
        <script type="text/javascript" src="user_charts.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
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
    <body id="top">
        <script>
            <%
                // --- Create two Java Arrays
                ArrayList<String> names = new ArrayList<String>();
                ArrayList<Integer> tweets = new ArrayList<Integer>();

                // --- Loop 10 times and create 10 string dates and 10 users
                Connection con = DbConnection.getConnection();
                Statement st = con.createStatement();
                String name = null;
                int count = 0;
                ResultSet rs = st.executeQuery("select * from user_details where email IN(SELECT uid FROM public_tweets)");
                while (rs.next()) {
                    name = rs.getString("uname");
                    names.add(name);
                }

                ResultSet rs1 = st.executeQuery("SELECT COUNT(*) AS count FROM public_tweets GROUP BY uid");
                while (rs1.next()) {
                    count = rs1.getInt("count");
                    tweets.add(count);
                }
            %>

            // --- add a comma after each value in the array and convert to javascript string representing an array
            var names = [<%= join(names, ",")%>];
            var tweets = [<%= join(tweets, ",")%>];
        </script>
        <script>
            window.onload = function () {
                zingchart.render({
                    id: "myChart",
                    width: "100%",
                    height: 500,
                    data: {
                        "type": "bar3d",
                        "title": {
                            display: true,
                            "text": "User Tweet Details"
                        },
                        "scale-x": {
                            "labels": names
                        },
                        "plot": {
                            valueBox: [
                                {
                                    text: 'Tweets',
                                    placement: 'middle',
                                    color: '#fff',
                                    shadow: 0
                                }
                            ]
                        },
                        "series": [{
                                "values": tweets,

                            }]
                    }
                });
            };
        </script>

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
        <%                String semail = (String) session.getAttribute("semail");

        %>
        <div class="content" style="background-image: url('img/graph1.jpg');">
            <div id="pageintro" class="hoc clear">
                <div style="background-color: #fff">
                    <div id="myChart"></div>
                </div>

            </div>
            <!-- ################################################################################################ -->
        </div>

        <!-- ################################################################################################ -->


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
