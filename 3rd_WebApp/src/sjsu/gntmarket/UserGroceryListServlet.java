package sjsu.gntmarket;

import java.io.*;
import java.sql.*;
import java.util.logging.*;
import javax.naming.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.sql.DataSource;

public class UserGroceryListServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private String dbURL, dbUser, dbPassword;

	public UserGroceryListServlet() {
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
      User currentUser;
      synchronized (session) {  // synchronized to prevent concurrent updates
         // Retrieve the shopping cart for this session, if any. Otherwise, create one.
         gCard = (GroceryCard) session.getAttribute("gCard");
         if (gCard == null) {
            gCard = new GroceryCard();
            session.setAttribute("gCard", gCard);  // Save it into session
         }
         
         currentUser = (User)session.getAttribute("currentUser");

         if (currentUser == null) {
        	 System.out.println("No user found");
         }
         else {
        	 System.out.println("Hello, " + currentUser.getName() + " - ID: " + currentUser.getId());
         }
      }

      //////////////////////////////
      // check user logged in session
      //////////////////////////////
      //String userID="100";
      String userID = String.valueOf(currentUser.getId());
      //////////////////////////////

      Connection conn   = null;
      Statement  stmt   = null;
      String     sqlStr = null;


      try {
         conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
         stmt = conn.createStatement();


         String htmlStr = "<html><head><title>GNT-market</title></head><body>\n"
         + "<h2>User Grocery List</h2>\n";

         // All cases - Always display the shopping cart
         if (gCard.isEmpty()) {
            out.println("<p>Your Grocery List is empty</p>");
         } else {
            htmlStr += "<table border='1' cellpadding='6'>\n"
            + "<tr>\n"
            + "<th>Food</th>\n"
            + "<th>Note</th>\n";

            for (GroceryCardItem item : gCard.getItems()) {
               int id = item.getId();
               String name = item.getName();
               sqlStr = "SELECT food_id FROM user_marks_food WHERE " 
               + "user_id="+ userID + " AND food_id=" + id + " AND "
               + "is_restricted=1 GROUP BY food_id";
               System.out.println(sqlStr);
               
               ResultSet rset2 = stmt.executeQuery(sqlStr);
               if (rset2.next()) {
                    htmlStr += "<tr><td><strike>" + name + "</strike></td>\n"
                    + "<td> you marked it as dietry restriction!</td>\n";
               } else {
                    htmlStr += "<tr><td>" + name + "</td>\n"
                    + "<td></td>\n";
               } 
            }
            htmlStr += "</tr></table>\n";

            // ARCHIVE TO DB
            // Table1) grocerylist (list_id, date)
            // Table2) user_creates_grocerylist (user_id, list_id)
            // Taboe3) Food_lists_GroceryList (food_id, list_id)
            //
            //                                                            
            // Step1) create a grocerylist
            //        AND get grocery list ID (list_id)
            sqlStr = "INSERT INTO grocerylist (date) VALUES(now());";
            stmt.executeUpdate(sqlStr);
            System.out.println(sqlStr);

            // get glistID
            sqlStr = "SELECT list_id FROM grocerylist ORDER BY  list_id DESC LIMIT 1";
            ResultSet rset = stmt.executeQuery(sqlStr);
            rset.next();
            String glistID = rset.getString("list_id");
            System.out.println("glistID=" + glistID);
            
            // Step2) user create a grocerylist (user_id, list_id)
            //        where user_id shouldn't be primary key, because user can
            //        have multiple grocerylist, thus should accept duplicate user_id
            //        with different list_id
            //
            sqlStr = "INSERT INTO user_creates_grocerylist (user_id, list_id) "
            + "VALUES (" + userID + ", " + glistID + ")";
            System.out.println(sqlStr);
            stmt.executeUpdate(sqlStr);

            // Step3) insert food list to grocery list (food_id, list_id)
            sqlStr = "INSERT INTO Food_lists_GroceryList (food_id, list_id) VALUES ";
            int i = 0;
            for (GroceryCardItem item : gCard.getItems()) {
               i += 1;
               int id = item.getId();
               String name = item.getName();
               if (i < gCard.size())
            	    sqlStr += "(" + id + ", " + glistID + "),";
               else
                    sqlStr += "(" + id + ", " + glistID + ")";
            }
            System.out.println(sqlStr);
            stmt.executeUpdate(sqlStr);
            htmlStr += "<p><a href='/GNTmarket/'>Return to Home</a></p>\n"
            + "<p><a href='/GNTmarket/gCard'>Return to GroceryList</a></p>\n"
            + "</body></html>\n";
            out.println(htmlStr);
         }
      } catch (SQLException ex) {
         out.println(ex.toString());
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
