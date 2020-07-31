package sjsu.gntmarket;

import java.io.*;
import java.sql.*;
import java.util.logging.*;
import javax.naming.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.sql.DataSource;

public class UserDishGroceryListServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private String dbURL, dbUser, dbPassword;

	public UserDishGroceryListServlet() {
		super();
	}

	public void init() {
		dbURL = getServletContext().getInitParameter("dbURL");
		dbUser = getServletContext().getInitParameter("dbUser");
		dbPassword = getServletContext().getInitParameter("dbPassword");
	}
	
   @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
      response.setContentType("text/html;charset=UTF-8");
      PrintWriter out = response.getWriter();

      // Retrieve current HTTPSession object. If none, create one.
      HttpSession session = request.getSession(true);
      GroceryCard gCard;
      synchronized (session) {  // synchronized to prevent concurrent updates
         // Retrieve the shopping cart for this session, if any. Otherwise, create one.
         gCard = (GroceryCard) session.getAttribute("dgCard");
         if (gCard == null) {
            gCard = new GroceryCard();
            session.setAttribute("dgCard", gCard);  // Save it into session
         }
      }

      //////////////////////////////
      // check user logged in session
      //////////////////////////////
      String userID="100";
      String glistID="200";
      //////////////////////////////

      Connection conn   = null;
      Statement  stmt   = null;
      ResultSet  rset   = null;
      String     sqlStr = null;

      try {
         conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
         stmt = conn.createStatement();

         String htmlStr = "<html><head><title>GNT-market</title></head><body>\n"
         + "<h2>User Dish Grocery List</h2>\n";

         // All cases - Always display the shopping cart
         if (gCard.isEmpty()) {
            out.println("<p>Your Grocery List is empty</p>");
         } else {
            htmlStr += "<table border='1' cellpadding='6'>\n"
            + "<tr>\n"
            + "<th>Food</th>\n";

            sqlStr = "INSERT INTO Food_lists_GroceryList VALUES ";
            int i = 0;
            for (GroceryCardItem item : gCard.getItems()) {
               i += 1;
               int id = item.getId();
               String name = item.getName();
               htmlStr += "<tr><td>" + name + "</td>\n";
               if (i < gCard.size())
            	    sqlStr += "(" + id + ", " + glistID + "),";
               else
                    sqlStr += "(" + id + ", " + glistID + ")";

            }
            htmlStr += "</tr></table>\n";
         }
         htmlStr += "<p><a href='/GNTmarket/'>Return to Home</a></p>\n"
         + "</body></html>\n";
         out.println(htmlStr);
         System.out.println(sqlStr);
         stmt.executeUpdate(sqlStr);

      } catch (SQLException ex) {
         out.println("<h3>Service not available. Please try again later!</h3></body></html>");
      } finally {
         out.close();

      }
   }

   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
      doGet(request, response);
   }
}
