<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Project Name</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
    </head>
    <body id="top">
        <div class="bgded overlay">
            <div class="wrapper row0">
                <div id="topbar" class="hoc clear">
                    <div class="fl_left">

                    </div>
                    <div class="fl_right">
                        <ul>
                            <li><a href="index.jsp"><b>Home</b></a></li>
                            <li><a href="https://apps.twitter.com/" target="_blank"><b>Get API</b></a></li>
                            <li><a href="user.jsp"><b>User Login</b></a></li>
                            <li><a href="admin.jsp"><b>Admin Login</a></b></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="content" style="background-image: url('img/index.png');">
                <div id="pageintro" class="hoc clear">
                    <!-- ################################################################################################ -->
                    <div class="flexslider basicslider">
                        <ul class="slides">
                            <li>
                                <article>
                                    <center><b><span style="font-size: 28px;color:red;"><br><br>Project Name<br><br><br><br></span></b></center>
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
            </div>
            <!-- ################################################################################################ -->
        </div>

        <a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
        <!-- JAVASCRIPTS -->
        <script src="layout/scripts/jquery.min.js"></script>
        <script src="layout/scripts/jquery.backtotop.js"></script>
        <script src="layout/scripts/jquery.mobilemenu.js"></script>
        <script src="layout/scripts/jquery.flexslider-min.js"></script>
    </body>
</html>