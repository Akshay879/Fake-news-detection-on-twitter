/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Upload;

import Mysql.DbConnection;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Tweet")
@MultipartConfig(maxFileSize = 16177215)
public class Tweets extends HttpServlet {

    // database connection settings
    private SimpleDateFormat format;

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(true);
        String userid = (String) session.getAttribute("semail");
        String uname = (String) session.getAttribute("suname");
        boolean isComment = Boolean.valueOf(request.getParameter("isComment"));
        int tweetId = Integer.parseInt(request.getParameter("tweetId"));
        String msg = request.getParameter("msg");
        session.setAttribute("message", msg);
        InputStream inputStream = null;

        Connection conn = null;
        try {

            conn = DbConnection.getConnection();

            String sql = "INSERT INTO public_tweets (uid, username, msg) values (?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, userid);
            statement.setString(2, uname);
            statement.setString(3, msg);

            int row = statement.executeUpdate();

            if (isComment) {
                String updatePublicTweets = "UPDATE tweets SET tweet_weight = (tweet_weight + 1) "
                        + " WHERE id = " + tweetId;
                int i = conn.createStatement().executeUpdate(updatePublicTweets);
            }

            if (row > 0) {
                response.sendRedirect("post.jsp?msg=success");
            } else {
                response.sendRedirect("twe.jsp?msgg=Failed");
            }

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }

    }
}
