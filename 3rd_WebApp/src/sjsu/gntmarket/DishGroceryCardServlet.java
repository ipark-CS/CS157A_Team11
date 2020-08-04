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
      int gCardID = 0;
      
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
				gCardID = gCardDAO.getUserGroceryListID(currentUser.getId());
				
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


         String htmlStr="<html lang='en'> <head> <meta charset='utf-8'> <title>CS157A-Team11| GNT-Market | Home</title> <!-- css --> <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'> <head> <meta charset='utf-8'> <meta name='viewport' content='width=device-width, initial-scale=1, shrink-to-fit=no'> <meta name='description' content=''> <meta name='author' content='Mark Otto, Jacob Thornton, and Bootstrap contributors'> <meta name='generator' content='Jekyll v3.8.5'> <link rel='canonical' href='https://getbootstrap.com/docs/4.3/examples/pricing/'> <!-- Bootstrap core CSS --> <link href='/docs/4.3/dist/css/bootstrap.min.css' rel='stylesheet' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'> <style> .bd-placeholder-img { font-size: 1.125rem; text-anchor: middle; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; user-select: none; } @media (min-width: 768px) { .bd-placeholder-img-lg { font-size: 3.5rem; } } </style> <!-- Custom styles for this template --> <link href='pricing.css' rel='stylesheet'> <script src='https://kit.fontawesome.com/a076d05399.js'></script> </head> <body> <div class='d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm'> <h5 class='my-0 mr-md-auto font-weight-normal'> <a href='#' class='navbar-brand d-flex align-items-center'> <i class='fas fa-carrot' style='font-size:24px'></i> <strong>&nbsp;GNT-Market</strong> </a></h5> <nav class='my-2 my-md-0 mr-md-3'> <a class='p-2 text-dark' href='/GNTmarket/home'>Home</a> <a class='p-2 text-dark' href='/GNTmarket/dish'>Dish</a> <a class='p-2 text-dark' href='/GNTmarket/food'>Food</a> <a class='p-2 text-dark' href='/GNTmarket/gCard'>Grocery List</a> </nav> </div>";

         htmlStr += "<div class=\"container-fluid\">"
         + "<main role='main' class='container'>"
         + "<h3>Grocery List Preference Check&nbsp;"
         + "<i class=\"fas fa-check-square\"></i>"
         + "</h3><br>";

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
        	 
        	 gCardID = gCardDAO.getUserGroceryListID(currentUser.getId());
        	 
            for (String id : ids2) {
            	
                gCard.remove(Integer.parseInt(id));
            
	            if(gCardID != 0) {
	            	gCardDAO.removeFromGroceryList(gCardID, Integer.parseInt(id));
	            }
            }
            
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
               + "<label><input type='radio' name='todo' value='likeF'/>"
               + "<i class=\"far fa-thumbs-up\"></i></label>\n"
               + "<label><input type='radio' name='todo' value='avoidF'/>"
               + "<i class=\"far fa-thumbs-down\"></i></label>\n"
               + "<input type='submit' value='update'>\n"
               + "</td></form>\n";
            }
            htmlStr += "</tr></table>\n";
         }
         htmlStr += "<p><a href='dish'>Select More Dish</a></p>\n"
         + "<p><form method='get' action='userdishGlist'><input type='submit' value='Save'></form></p>\n"
         + "</div></main></body></html>\n";
         
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
