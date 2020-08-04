package sjsu.gntmarket;

import java.io.*;
import java.sql.*;
import java.util.logging.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.sql.*;

public class DishSearchServlet extends HttpServlet 
{
    private String dbURL, dbUser, dbPassword;
    
    private GroceryCardDAO gCardDAO;
    private FoodDAO foodDAO;
    private UserDAO userDAO;
    
    public DishSearchServlet() 
    {
        super();
    }

    public void init() throws ServletException 
    {
        dbURL = getServletContext().getInitParameter("dbURL");
        dbUser = getServletContext().getInitParameter("dbUser");
        dbPassword = getServletContext().getInitParameter("dbPassword");
        
		gCardDAO = new GroceryCardDAO(dbURL, dbUser, dbPassword);
		foodDAO = new FoodDAO(dbURL, dbUser, dbPassword);
		userDAO = new UserDAO(dbURL, dbUser, dbPassword);
		
        
        // load and register JDBC driver for MySQL 
        try 
        {                                              
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) 
        {
          e.printStackTrace();
        }
    } // EO-init()

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       response.setContentType("text/html;charset=UTF-8");
       PrintWriter out = response.getWriter();
  
       Connection conn = null;
       Statement stmt = null;
  
       try {
          String dname = request.getParameter("dname");
          String dsearchW = request.getParameter("dsearch").trim();
          boolean hasDname = dname != null && !dname.equals("Select Food");
          boolean hasDsearch = dsearchW != null && (dsearchW.length() > 0);

          String htmlStr="<html lang='en'> <head> <meta charset='utf-8'> <title>CS157A-Team11| GNT-Market | Home</title> <!-- css --> <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'> <head> <meta charset='utf-8'> <meta name='viewport' content='width=device-width, initial-scale=1, shrink-to-fit=no'> <meta name='description' content=''> <meta name='author' content='Mark Otto, Jacob Thornton, and Bootstrap contributors'> <meta name='generator' content='Jekyll v3.8.5'> <link rel='canonical' href='https://getbootstrap.com/docs/4.3/examples/pricing/'> <!-- Bootstrap core CSS --> <link href='/docs/4.3/dist/css/bootstrap.min.css' rel='stylesheet' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'> <style> .bd-placeholder-img { font-size: 1.125rem; text-anchor: middle; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; user-select: none; } @media (min-width: 768px) { .bd-placeholder-img-lg { font-size: 3.5rem; } } </style> <!-- Custom styles for this template --> <link href='pricing.css' rel='stylesheet'> <script src='https://kit.fontawesome.com/a076d05399.js'></script> </head> <body> <div class='d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm'> <h5 class='my-0 mr-md-auto font-weight-normal'> <a href='#' class='navbar-brand d-flex align-items-center'> <i class='fas fa-carrot' style='font-size:24px'></i> <strong>&nbsp;GNT-Market</strong> </a></h5> <nav class='my-2 my-md-0 mr-md-3'> <a class='p-2 text-dark' href='/GNTmarket/home'>Home</a> <a class='p-2 text-dark' href='/GNTmarket/dish'>Dish</a> <a class='p-2 text-dark' href='/GNTmarket/food'>Food</a> <a class='p-2 text-dark' href='/GNTmarket/gCard'>Grocery List</a> </nav> </div>";

         htmlStr += "<div class=\"container-fluid\">"
         + "<div class=\"col-sm-5 col-md-6\">"
         + "<h3>Food Search Result&nbsp;"
         + "<i class=\"fas fa-list-alt\"></i>"
         + "</h3><br>";
  
          conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
          stmt = conn.createStatement();

          String sqlStr = "SELECT * "
          + "FROM Food f, dish_has_food df, dish d "
          + "WHERE df.dish_id IN (SELECT dish_id FROM dish WHERE ";
          if (hasDname)
              sqlStr += "name = '" + dname + "' ";
          if (hasDsearch) {
              if (hasDname) {
                  sqlStr += " OR ";
              }
              sqlStr += "name LIKE '%" + dsearchW.trim() + "%')";
          } 
          sqlStr += "AND f.food_id=df.food_id "
          + "AND d.dish_id=df.dish_id)";
          System.out.println(sqlStr);  // for debugging
          ResultSet rset = stmt.executeQuery(sqlStr);

            /*
          String sqlStr = "SELECT f.name AS name, "
          + "f.food_id AS food_id,  "
          + "GROUP_CONCAT(n.name SEPARATOR ', ') AS Nutrients  "
          + "FROM Food_has_Nutrient fn NATURAL JOIN  Nutrient n  "
          + "JOIN Food f ON f.food_id WHERE  ";
          if (hasFname)
              sqlStr += "f.name='" + fname + "'   ";
          if (hasFsearch) {
              if (hasFname) 
                  sqlStr += " OR ";
              sqlStr += "f.name LIKE '%" + fsearchW.trim() + "%'  ";
          } 
          sqlStr += "AND fn.food_id=f.food_id "
          + "GROUP BY f.food_id";
          System.out.println(sqlStr);  // for debugging
          ResultSet rset = stmt.executeQuery(sqlStr);
            */




          if (!rset.next()) {  
             htmlStr += "<h3>No food found.</h3>\n"
             + "<p><a href='food'>Back to Select Menu</a></p>\n";
          } else {
             // Print the result in an HTML form inside a table
             htmlStr += "<table border='1' cellpadding='6'>\n"
             + "<tr>\n"
             + "<th>Food</th>\n"
             + "<th>Add</th>\n"
             + "<th>Delete</th>\n"
             + "</tr>\n";
  			
             // ResultSet's cursor now pointing at first row
             /*
            do {
                String id = rset.getString("food_id");
                htmlStr += "<tr>\n"
                + "<td>" + rset.getString("name") + "</td>\n"
                + "<td><form method='get' action='gCard'>\n"
                + "<input type='hidden' name='todo' value='addF'/>\n"
                + "<input type='hidden' name='id' value='" + id + "'/>\n"
                + "<input type='submit' value='[+]'/>\n"
                + "</form></td>\n"
                + "<td><form method='get' action='gCard'>\n"
                + "<input type='hidden' name='todo' value='delF'/>\n"
                + "<input type='hidden' name='id' value='" + id + "'/>\n"
                + "<input type='submit' value='[x]'/>\n"
                + "</form></td></tr>\n";
             }  while (rset.next());
             htmlStr += "</table><br/>\n"
             + "<p><a href='dish'>Select More Dish</a></p>\n";
             */

            htmlStr += "<form method='get' action='dgCard'>\n";
            do {
                String id = rset.getString("food_id");
                htmlStr += "<tr>\n"
                + "<td>" + rset.getString("name") + "</td>\n"
                + "<td><input type='checkbox' name='addF' value='" + id + "'/></td>\n"
                + "<td><input type='checkbox' name='delF' value='" + id + "'/></td>\n"
                + "</tr>\n";
             }  while (rset.next());
             htmlStr += "</table><br/>\n"
             + "<p><input type='submit' value='Save'></form></p>\n"
             + "</body></html>\n";

             
             HttpSession session = request.getSession(false); // check if session exists
             if (session != null) {
            	 
                GroceryCard gCard;
                User currentUser;       
                
                synchronized (session) {
                   // Retrieve the shopping cart for this session, if any. Otherwise, create one.
                   //gCard = (GroceryCard) session.getAttribute("dgCard");
                	
                	
	                currentUser = (User)session.getAttribute("currentUser");
	                
	                System.out.print("(Insde DishSearchServlet near end) ");
	
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
                   
                   
                   
                   if (gCard != null && !gCard.isEmpty()) {
                      htmlStr += "<p><a href='dgCard?todo=view'>Grocery List</a></p>\n";
                   }
                   
                }
             }
             htmlStr += "</body></html>\n";
             out.println(htmlStr);
          }
       } catch (SQLException ex) {
          out.println(ex.toString());
          out.println("<h3>Service not available. Please try again later!</h3></body></html>");
       } finally {
          out.close();
          try {
             if (stmt != null) stmt.close();
             if (conn != null) conn.close();  // Return the connection to the pool
          } catch (SQLException ex) { }
       }
    }

   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
      doGet(request, response);
   } // EO-doPost

} // EO-class-SearchServlet

