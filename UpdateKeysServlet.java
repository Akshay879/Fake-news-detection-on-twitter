package Upload;

import Mysql.DbConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UpdateKeysServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {

            HttpSession session = req.getSession(true);
            String email = (String) session.getAttribute("semail");

            String appKey = req.getParameter("app_key");
            String appSecretKey = req.getParameter("app_secret_key");
            String accessToken = req.getParameter("access_key");
            String accessTokenSecret = req.getParameter("acc_token_key");

            Connection conn = DbConnection.getConnection();
            String sql = "UPDATE user_details SET app_key = ?, app_secret = ?, acc_key = ?, acc_token = ? WHERE email = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, appKey);
            statement.setString(2, appSecretKey);
            statement.setString(3, accessToken);
            statement.setString(4, accessTokenSecret);
            statement.setString(5, email);

            int row = statement.executeUpdate();

            if (row > 0) {

                session.setAttribute("sapp_key", appKey);
                session.setAttribute("sapp_secret", appSecretKey);
                session.setAttribute("sacc_key", accessToken);
                session.setAttribute("sacc_token", accessTokenSecret);

                resp.sendRedirect("twe.jsp?msg=Success");
            } else {
                resp.sendRedirect("update_secret_keys.jsp?msg=Error");
            }

        } catch (Exception ex) {
            System.out.println(ex);
        }

    }

}
