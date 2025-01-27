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

         String htmlStr="<html lang='en'> <head> <meta charset='utf-8'> <title>CS157A-Team11| GNT-Market | Home</title> <!-- css --> <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'> <head> <meta charset='utf-8'> <meta name='viewport' content='width=device-width, initial-scale=1, shrink-to-fit=no'> <meta name='description' content=''> <meta name='author' content='Mark Otto, Jacob Thornton, and Bootstrap contributors'> <meta name='generator' content='Jekyll v3.8.5'> <link rel='canonical' href='https://getbootstrap.com/docs/4.3/examples/pricing/'> <!-- Bootstrap core CSS --> <link href='/docs/4.3/dist/css/bootstrap.min.css' rel='stylesheet' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'> <style> .bd-placeholder-img { font-size: 1.125rem; text-anchor: middle; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; user-select: none; } @media (min-width: 768px) { .bd-placeholder-img-lg { font-size: 3.5rem; } } </style> <!-- Custom styles for this template --> <link href='pricing.css' rel='stylesheet'> <script src='https://kit.fontawesome.com/a076d05399.js'></script> </head> <body> <div class='d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm'> <h5 class='my-0 mr-md-auto font-weight-normal'> <a href='#' class='navbar-brand d-flex align-items-center'> <i class='fas fa-carrot' style='font-size:24px'></i> <strong>&nbsp;GNT-Market</strong> </a></h5> <nav class='my-2 my-md-0 mr-md-3'> <a class='p-2 text-dark' href='/GNTmarket/home'>Home</a> <a class='p-2 text-dark' href='/GNTmarket/dish'>Dish</a> <a class='p-2 text-dark' href='/GNTmarket/food'>Food</a> <a class='p-2 text-dark' href='/GNTmarket/gCard'>Grocery List</a> </nav> </div>";


         htmlStr += "<div class=\"container-fluid\">"
         + "<main role='main' class='container'>"
         + "<p><h3>Search Dish&nbsp;"
         + "<i class=\"fas fa-drumstick-bite\"></i>&nbsp;<i class=\"fas fa-hotdog\"></i>&nbsp;"
         + "<i class=\"fas fa-hamburger\"></i>"
         + "&nbsp<i class=\"fas fa-pizza-slice\"></i>&nbsp;<i class=\"fas fa-stroopwafel\"></i>"
         + "&nbsp<i class=\"fas fa-seedling\"></i>"
         + "</h3></p><br>"
         + "<form method='get' action='dishsearch'>\n"
         + "<select name='dname' id='dname' class='custom-select'>\n"
         + "<option value=''>Select Dish</option>\n";
         
         while (rset.next()) {  // list all the food
            String name = rset.getString("name");
            htmlStr += "<option value='" + name + "'>" + name + "</option>";
         } 
         htmlStr += "</select>\n"
         + "<input type='text' class='form-control'  onfocus=\"this.value=''\" name='dsearch' placeholder='Type Dish Name'/>\n"
         + "<br><button type='submit' class='btn btn-primary mb-2' value='Search'/>search"
         + "</button></form>\n";

 
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
         htmlStr += "</div></main></body></html>\n";
         out.println(htmlStr);

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
