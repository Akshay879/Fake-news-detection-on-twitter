/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Upload;

import Mysql.DbConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UserSearch")
public class UserSearch extends HttpServlet {

    // database connection settings
    private SimpleDateFormat format;

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {

        String keyword = request.getParameter("keyword");

        Connection conn = null;
        try {

            conn = DbConnection.getConnection();

            String sql = "select * from register where fname LIKE '%" + keyword + "%'";
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(sql);

            int mediaDF = 0;
            if (rs.next()) {
                mediaDF = rs.getInt("id");
            }

            request.setAttribute("mediaDF", mediaDF);
            RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
            rd.forward(request, response);

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

    }
}
