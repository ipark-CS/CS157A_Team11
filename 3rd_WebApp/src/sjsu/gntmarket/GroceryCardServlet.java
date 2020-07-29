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

         out.println("<html><head><title>GNT-market</title></head><body>");
         out.println("<h2>Grocery List</h2>");

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
         }

         // All cases - Always display the shopping cart
         if (gCard.isEmpty()) {
            out.println("<p>Your Grocery List is empty</p>");
         } else {
            out.println("<table border='1' cellpadding='6'>");
            out.println("<tr>");
            out.println("<th>Food</th>");

            for (GroceryCardItem item : gCard.getItems()) {
               int id = item.getId();
               String name = item.getName();

               out.println("<tr>");
               out.println("<td>" + name + "</td>");

               out.println("<td><form method='get'>");
               out.println("<input type='hidden' name='todo' value='update' />");
               out.println("<input type='hidden' name='id' value='" + id + "' />");

               out.println("<input type='submit' value='Update' />");
               out.println("</form></td>");

               out.println("<td><form method='get'>");
               out.println("<input type='submit' value='Remove'>");
               out.println("<input type='hidden' name='todo' value='remove'");
               out.println("<input type='hidden' name='id' value='" + id + "'>");
               out.println("</form></td>");
               out.println("</tr>");
            }
            out.println("</table>");
         }

         out.println("<p><a href='food'>Select More Food</a></p>");
         out.println("<p><form method='get'>");
         out.println("<input type='submit' value='Save'></p>");
         out.println("</body></html>");

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
