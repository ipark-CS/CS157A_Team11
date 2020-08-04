package sjsu.gntmarket;

import java.io.*;
import java.sql.*;
import java.util.logging.*;
import javax.naming.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.sql.DataSource;

public class DishGroceryCardServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private String dbURL, dbUser, dbPassword;
    
    private GroceryCardDAO gCardDAO;
    private FoodDAO foodDAO;
    private UserDAO userDAO;

	public DishGroceryCardServlet() {
		super();
	}

	public void init() {
		dbURL = getServletContext().getInitParameter("dbURL");
		dbUser = getServletContext().getInitParameter("dbUser");
		dbPassword = getServletContext().getInitParameter("dbPassword");
		
		gCardDAO = new GroceryCardDAO(dbURL, dbUser, dbPassword);
		foodDAO = new FoodDAO(dbURL, dbUser, dbPassword);
		userDAO = new UserDAO(dbURL, dbUser, dbPassword);
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
         /*gCard = (GroceryCard) session.getAttribute("dgCard");
         if (gCard == null) {
            gCard = new GroceryCard();
            session.setAttribute("dgCard", gCard);  // Save it into session
         } */
         
         currentUser = (User)session.getAttribute("currentUser");
         
         System.out.print("(Inside DishGroceryCardServlet - doGet()) ");

         if (currentUser == null) {
        	 System.out.println("No user found");
         }
         else {
        	 System.out.println("Hello, " + currentUser.getName() + " - ID: " + currentUser.getId());
         }
         
         
         gCard = (GroceryCard) session.getAttribute("gCard");
         
         if (gCard == null) {
        	 
        	 //Checks if User already has GroceryCard stored
        	 try {
				int gCardID = gCardDAO.getUserGroceryListID(currentUser.getId());
				
				if(gCardID != 0) {
					System.out.println("Found grocery list: " + gCardID);
					
					gCard = gCardDAO.restoreGroceryCard(gCardID);
					
					if (gCard == null) {
						gCard = new GroceryCard();
					}
					
				} else {
					gCard = new GroceryCard();
				}
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
        	 
            session.setAttribute("gCard", gCard);  // Save it into session
         }
         
         
      }

      //////////////////////////////
      // check user logged in session
      //////////////////////////////
      //String userID="100";
      String userID = String.valueOf(currentUser.getId());
      
      Connection conn   = null;
      Statement  stmt   = null;
      ResultSet  rset   = null;
      String     sqlStr = null;


      try {
         conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
         stmt = conn.createStatement();

         String htmlStr = "<html><head><title>GNT-market</title></head><body>\n"
         + "<h2>Dish Grocery List Edit</h2>\n";

         String[] ids = request.getParameterValues("addF");
         if (ids != null) {
            for (String id : ids) {                                 
               sqlStr = "SELECT * FROM Food WHERE food_id = " + id;
               System.out.println(sqlStr);  // for debugging
               rset = stmt.executeQuery(sqlStr);
               rset.next(); // Expect only one row in ResultSet
               String name = rset.getString("name");
               int idInt = rset.getInt("food_id");
               gCard.add(idInt, name);
            }
         }

         String[] ids2 = request.getParameterValues("delF");
         if (ids2 != null) {
            for (String id : ids2) 
                gCard.remove(Integer.parseInt(id));
         } 
 
         String todo = request.getParameter("todo");
         if (todo != null) {
            if (todo.equals("avoidF")) {                                                
               String id = request.getParameter("id");  // Only one id for remove case
               //sqlStr = "INSERT INTO user_marks_food values (100, " + id + ", 1, 0)";
               /*
               sqlStr = "UPDATE user_marks_food "
               + "SET is_restricted=1, is_favorite=0 "
               + "WHERE food_id='" + id + "' "
               + "AND user_id = '" + userID + "'";
               */
               sqlStr = "REPLACE INTO user_marks_food VALUES (" 
               + userID + ", "  // user_id
               + id + ", "      // food_id
               + "1, "          // is_restricted
               + "0)";          // is_favorite
               System.out.println(sqlStr);  // for debugging
               stmt.executeUpdate(sqlStr);
               
               userDAO.userMarksFood(userID, id, 1, 0);
               
            } else if (todo.equals("likeF")) {
               String id = request.getParameter("id");  // Only one id for remove case
               /*
               sqlStr = "UPDATE user_marks_food "
               + "SET is_restricted=0, is_favorite=1 "
               + "WHERE food_id='" + id + "' "
               + "AND user_id = '" + userID + "'";
               */
               sqlStr = "REPLACE INTO user_marks_food VALUES (" 
               + userID + ", "  // user_id
               + id + ", "      // food_id
               + "0, "          // is_restricted
               + "1)";          // is_favorite
               System.out.println(sqlStr);  // for debugging
               stmt.executeUpdate(sqlStr);
               
               userDAO.userMarksFood(userID, id, 0, 1);
            }
         }

         // All cases - Always display the shopping cart
         if (gCard.isEmpty()) {
            out.println("<p>Your Grocery List is empty</p>");
         } else {
            htmlStr += "<table border='1' cellpadding='6'>\n"
            + "<tr>\n"
            + "<th>Food</th>\n"
            + "<th>Preference</th>\n";

            for (GroceryCardItem item : gCard.getItems()) {
               int id = item.getId();
               String name = item.getName();

               
               htmlStr += "<tr>\n"
               + "<td>" + name + "</td>"
               + "<td><form method='get' action='dgCard'>\n"
               + "<input type='hidden' name='id' value='" + id + "'/>\n"
               + "<label><input type='radio' name='todo' value='likeF'/>Like</label>\n"
               + "<label><input type='radio' name='todo' value='avoidF'/>Avoid</label>\n"
               + "<input type='submit' value='update'>\n"
               + "</td></form>\n";
            }
            htmlStr += "</tr></table>\n";
         }
         htmlStr += "<p><a href='dish'>Select More Dish</a></p>\n"
         + "<p><form method='get' action='userdishGlist'><input type='submit' value='Save'></form></p>\n"
         + "</body></html>\n";
         
         request.setAttribute("gCard", gCard);
         session.setAttribute("gCard", gCard);

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
