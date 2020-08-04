package sjsu.gntmarket;

import java.io.*;
import java.sql.*;
import java.util.logging.*;
import javax.servlet.*;
import javax.servlet.http.*;

 
public class DishServlet extends HttpServlet {
 
    private static final long serialVersionUID = 1L;
    private String dbURL, dbUser, dbPassword;
    
    private GroceryCardDAO gCardDAO;
    private FoodDAO foodDAO;
    private UserDAO userDAO;
 
	public DishServlet() {
		super();
	}

	public void init() throws ServletException {
		dbURL = getServletContext().getInitParameter("dbURL");
		dbUser = getServletContext().getInitParameter("dbUser");
		dbPassword = getServletContext().getInitParameter("dbPassword");
		
		gCardDAO = new GroceryCardDAO(dbURL, dbUser, dbPassword);
		foodDAO = new FoodDAO(dbURL, dbUser, dbPassword);
		userDAO = new UserDAO(dbURL, dbUser, dbPassword);
		
		// load and register JDBC driver for MySQL 
		try {
            Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

   @Override
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
      response.setContentType("text/html;charset=UTF-8");
      PrintWriter out = response.getWriter();
 
      Connection conn = null;
      Statement stmt = null;

      try {
         conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
         stmt = conn.createStatement();
         
         // food ////////////////////////////////
         String sqlStr = "SELECT name FROM dish";
         ResultSet rset = stmt.executeQuery(sqlStr);

         String htmlStr="<html><head><title>GNT-market</title></head><body>\n"
         + "<h2>Select/Search Dish</h2>\n"
         + "<form method='get' action='dishsearch'>\n"
         + "<select name='dname' id='dname' size='1'>\n"
         + "<option value=''>Select Dish</option>\n";
         
         while (rset.next()) {  // list all the food
            String name = rset.getString("name");
            htmlStr += "<option value='" + name + "'>" + name + "</option>";
         } 
         // A text field for entering search word for pattern matching
         htmlStr += "<input type='text' onfocus=\"this.value=''\" name='dsearch' placeholder='Type Dish Name'/>\n";
 
         // Submit and reset buttons
         htmlStr += "<input type='submit' value='Search' />\n"
         + "</form>\n";
 
         // Show "View Shopping Cart" if the cart is not empty
         HttpSession session = request.getSession(false); // check if session exists
         if (session != null) {
            GroceryCard gCard;
            synchronized (session) {
               // Retrieve the shopping cart for this session, if any. Otherwise, create one.
               gCard = (GroceryCard) session.getAttribute("gCard");
               if (gCard != null && !gCard.isEmpty()) {
                  htmlStr += "<P><a href='dgCard'>Grocery List</a></p>\n";
               }
            }
         }
         htmlStr += "</body></html>\n";
         out.println(htmlStr);

      } catch (SQLException ex) {
         out.println("<h3>Service not available. Please try again later!</h3></body></html>");
         Logger.getLogger(FoodServlet.class.getName()).log(Level.SEVERE, null, ex);
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
