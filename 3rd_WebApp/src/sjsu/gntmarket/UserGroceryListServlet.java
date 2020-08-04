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
    
    GroceryCardDAO gCardDAO;
    FoodDAO foodDAO;

	public UserGroceryListServlet() {
		super();
	}

	public void init() {
		dbURL = getServletContext().getInitParameter("dbURL");
		dbUser = getServletContext().getInitParameter("dbUser");
		dbPassword = getServletContext().getInitParameter("dbPassword");
		
		gCardDAO = new GroceryCardDAO(dbURL, dbUser, dbPassword);
		foodDAO = new FoodDAO(dbURL, dbUser, dbPassword);
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
         /*gCard = (GroceryCard) session.getAttribute("gCard");
         if (gCard == null) {
            gCard = new GroceryCard();
            session.setAttribute("gCard", gCard);  // Save it into session
         }
         */
         
          currentUser = (User)session.getAttribute("currentUser");
          
          System.out.print("(Insde UserGroceryCardServlet doGet()) ");

          if (currentUser == null) {
         	 System.out.println("No user found");
          }
          else {
         	 System.out.println("Hello, " + currentUser.getName() + " - ID: " + currentUser.getId());
          }
          
          // Retrieve the shopping cart for this session, if any. Otherwise, create one.
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
          } else {
        	  
        	  try {
				gCardID = gCardDAO.getUserGroceryListID(currentUser.getId());
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
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
            
            String glistID = "";
            
            if(gCardID == 0) {
            	
            	
            	//sqlStr = "INSERT INTO grocerylist (date) VALUES(now());";
            	
            	gCardDAO.insertNewGroceryList();
            	
                //System.out.println(sqlStr);
                //stmt.executeUpdate(sqlStr);
              
                // get glistID
                //sqlStr = "SELECT list_id FROM grocerylist ORDER BY list_id DESC LIMIT 1";
                //ResultSet rset = stmt.executeQuery(sqlStr);
                //rset.next();
                //glistID = rset.getString("list_id");
                
                glistID = gCardDAO.getNewestGroceryList();
            	
            	
            }
            else {
            	glistID = String.valueOf(gCardID);
            }
            
            System.out.println("glistID=" + glistID);
            
            // Step2) user create a grocerylist (user_id, list_id)
            //        where user_id shouldn't be primary key, because user can
            //        have multiple grocerylist, thus should accept duplicate user_id
            //        with different list_id
            //
            
            sqlStr = "REPLACE INTO user_creates_grocerylist (user_id, list_id) "
            + "VALUES (" + userID + ", " + glistID + ")";
            System.out.println(sqlStr);
            stmt.executeUpdate(sqlStr);

            // Step3) insert food list to grocery list (food_id, list_id)
            sqlStr = "REPLACE INTO Food_lists_GroceryList (food_id, list_id) VALUES ";
            
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
            
            request.setAttribute("gCard", gCard);
            session.setAttribute("gCard", gCard);
            
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
