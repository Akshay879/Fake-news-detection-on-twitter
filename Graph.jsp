<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@page import="Mysql.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>

<%!
    // --- String Join Function converts from Java array to javascript string.
    public String join(ArrayList<?> arr, String del)
    {

        StringBuilder output = new StringBuilder();

        for (int i = 0; i < arr.size(); i++)
        {

            if (i > 0) output.append(del);

              // --- Quote strings, only, for JS syntax
              if (arr.get(i) instanceof String) output.append("\"");
              output.append(arr.get(i));
              if (arr.get(i) instanceof String) output.append("\"");
        }

        return output.toString();
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Simple JSP Demo</title>
        <script type="text/javascript" src="https://cdn.zingchart.com/zingchart.min.js"></script>
    </head>
    <body>
        <script>
            <%
               // --- Create two Java Arrays
                ArrayList<String> months = new ArrayList<String>();
                ArrayList<Integer> users = new ArrayList<Integer>();

               // --- Loop 10 times and create 10 string dates and 10 users
                            Connection con = DbConnection.getConnection();
                            Statement st = con.createStatement();
                            String name=null;
                            int count=0;
                            ResultSet rs=st.executeQuery("select * from user_details where email IN(SELECT uid FROM public_tweets)");
                            while(rs.next()){
                            name=rs.getString("uname");
                            months.add(name);
                            }

                            ResultSet rs1=st.executeQuery("SELECT COUNT(*) AS count FROM public_tweets GROUP BY uid");
                            while(rs1.next()){
                            count=rs1.getInt("count");
                            users.add(count);
                            }
            %>

            // --- add a comma after each value in the array and convert to javascript string representing an array
            var monthData = [<%= join(months, ",") %>];
            var userData = [<%= join(users, ",") %>];

        </script>
        <script>
            window.onload = function () {
                zingchart.render({
                    id: "myChart",
                    width: "100%",
                    height: 400,
                    data: {
                        "type": "bar",
                        "title": {
                            "text": "Simple JSP Example"
                        },
                        "scale-x": {
                            "labels": monthData
                        },
                        "plot": {
                            "line-width": 1
                        },
                        "series": [{
                                "values": userData
                            }]
                    }
                });
            };
        </script>

        <h1>Data From JSP Page Using Docker</h1>
        <div id="myChart"></div>
    </body>
</html>