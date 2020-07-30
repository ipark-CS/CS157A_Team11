package sjsu.gntmarket;

import java.io.*;
import java.sql.*;
import java.util.logging.*;
import javax.naming.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.sql.DataSource;

public class GroceryCardServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private String dbURL, dbUser, dbPassword;

	public GroceryCardServlet() {
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
         gCard = (GroceryCard) session.getAttribute("gCard");
         if (gCard == null) {
            gCard = new GroceryCard();
            session.setAttribute("gCard", gCard);  // Save it into session
         }
      }

      Connection conn   = null;
      Statement  stmt   = null;
      ResultSet  rset   = null;
      String     sqlStr = null;


      try {
         conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
         stmt = conn.createStatement();

         String htmlStr = "<html><head><title>GNT-market</title></head><body>\n"
         + "<h2>Grocery List</h2>\n";

         String todo = request.getParameter("todo");
         if (todo == null) todo = "view";  // to prevent null pointer

         if (todo.equals("addF")) {
            String[] ids = request.getParameterValues("id");
            if (ids == null) {
               out.println("<h3>Please Select a Food!</h3></body></html>");
               return;
            }
            for (String id : ids) {
               sqlStr = "SELECT * FROM Food WHERE food_id = " + id;
               System.out.println(sqlStr);  // for debugging
               rset = stmt.executeQuery(sqlStr);
               rset.next(); // Expect only one row in ResultSet
               String name = rset.getString("name");
               int idInt = rset.getInt("food_id");
               if (todo.equals("addF")) {
                  gCard.add(idInt, name);
               } 
            }
         } else if (todo.equals("delF")) {
            String id = request.getParameter("id");  // Only one id for remove case
            gCard.remove(Integer.parseInt(id));
         } else if (todo.equals("avoidF")) {
            String id = request.getParameter("id");  // Only one id for remove case
            sqlStr = "INSERT INTO user_marks_food values (100, " + id + ", 1, 0)";
            System.out.println(sqlStr);  // for debugging
            stmt.executeUpdate(sqlStr);
         } else if (todo.equals("likeF")) {
            String id = request.getParameter("id");  // Only one id for remove case
            sqlStr = "INSERT INTO user_marks_food values (100, " + id + ", 0, 1)";
            System.out.println(sqlStr);  // for debugging
            stmt.executeUpdate(sqlStr);
         }
 
         // All cases - Always display the shopping cart
         if (gCard.isEmpty()) {
            out.println("<p>Your Grocery List is empty</p>");
         } else {
            htmlStr += "<table border='1' cellpadding='6'>\n"
            + "<tr>\n"
            + "<th>Food</th>\n"
            + "<th>Like</th>\n"
            + "<th>Avoid</th>\n";

            for (GroceryCardItem item : gCard.getItems()) {
               int id = item.getId();
               String name = item.getName();

               htmlStr += "<tr>\n"
               + "<td>" + name + "</td>"
               + "<td><form method='get' action='gCard'>\n"
               + "<input type='hidden' name='todo' value='likeF'/>\n"
               + "<input type='hidden' name='id' value='" + id + "'/>\n"
               + "<input type='radio' onClick=\"this.form.submit()\"/>\n"
               + "</form></td>\n"
               + "<td><form method='get' action='gCard'>\n"
               + "<input type='hidden' name='todo' value='avoidF'/>\n"
               + "<input type='hidden' name='id' value='" + id + "'/>\n"
               + "<input type='radio' onClick=\"this.form.submit()\"/>\n"
               + "</td></form>\n";
            }
            htmlStr += "</tr></table>\n";
         }
         htmlStr += "<p><a href='food'>Select More Food</a></p>\n"
         + "<p><form method='get' action=''><input type='submit' value='Save'></form></p>\n"
         + "</body></html>\n";

         out.println(htmlStr);

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
