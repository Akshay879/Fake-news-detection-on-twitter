<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Fake News Detection In Twitter</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
        <script type="text/javascript">
            
            function validate(){
                return true;
            }
            function check(evt)
            {
                password.Text = "Hello";
            }

        </script>
        <%
            if (request.getParameter("msg1") != null) {
        %>
        <script>alert('This Email ID Alredy Exists!!');</script>
        <%            }
        %>
        <link rel="stylesheet" href="css/style.css">
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
                            <li><a href="user.jsp">User Login</a></li>
                            <li><a href="admin.jsp">Admin Login</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="content" style="background-image: url('img/change_pwd.jpg');">
                <div class="wrapper row1">
                    <header id="header" class="hoc clear">
                        <div class="container">
                            <div class="login">
                                <h2 class="login-heading">REGISTER HERE!!</h2>
                                <form method="post" action="uploadServlet" enctype="multipart/form-data" onsubmit="return validate();">
                                    <input type="text" name="uname" placeholder="User Name" required="required" class="input-txt" />
                                    <input type="email" name="email" placeholder="Email" required="required" class="input-txt" />
                                    <span class="label info" style="background-color: #2196F3;font-size:18px;">Password Length 6, Atleast 1 number and 1 Alphabet.... </span>
                                    <input type="password" name="password" placeholder="Password" required="required" class="input-txt" pattern="^(?=.*[0-9])(?=.*[a-z]).{6,}$"/>
                                    <input type="file" name="photo" required="required" class="input-txt" />
                                    <div class="login-footer">
                                        <button type="submit" class="btn btn--right">Sign UP  </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <!--- --->

                        <!-- ################################################################################################ -->
                    </header>
                </div>
                <div>

                </div>
            </div>

            <!-- ################################################################################################ -->
        </div>

        <a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
        <!-- JAVASCRIPTS -->
        <script src="layout/scripts/jquery.min.js"></script>
        <script  src="js/index.js"></script>
        <script src="layout/scripts/jquery.backtotop.js"></script>
        <script src="layout/scripts/jquery.mobilemenu.js"></script>
        <script src="layout/scripts/jquery.flexslider-min.js"></script>
    </body>
</html>