package sjsu.gntmarket;

import java.io.*;
import java.sql.*;
import java.util.logging.*;
import javax.servlet.*;
import javax.servlet.http.*;

 
public class FoodServlet extends HttpServlet {
 
    private static final long serialVersionUID = 1L;
    private String dbURL, dbUser, dbPassword;
 
	public FoodServlet() {
		super();
	}

	public void init() throws ServletException {
		dbURL = getServletContext().getInitParameter("dbURL");
		dbUser = getServletContext().getInitParameter("dbUser");
		dbPassword = getServletContext().getInitParameter("dbPassword");
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
         String sqlStr = "SELECT name FROM Food";
         ResultSet rset = stmt.executeQuery(sqlStr);

         String htmlStr="<html><head><title>GNT-market</title></head><body>\n"
         + "<h2>Grocery List</h2>\n"
         + "<form method='get' action='search'>\n"
         + "Food: <select name='name' size='1'>\n"
         + "<option value=''>Select...</option>\n";
         
         while (rset.next()) {  // list all the food
            String name = rset.getString("name");
            htmlStr += "<option value='" + name + "'>" + name + "</option>";
         }
         htmlStr += "</select><br/>\n"
         + "<p>OR</p>\n";
 
         // A text field for entering search word for pattern matching
         htmlStr += "Search \"Food\": <input type='text' name='search' />\n";
 
         // Submit and reset buttons
         htmlStr += "<br/><br/>\n"
         + "<input type='submit' value='SEARCH' />\n"
         + "<input type='reset' value='CLEAR' />\n"
         + "</form>\n";
 
         // Show "View Shopping Cart" if the cart is not empty
         /*
         HttpSession session = request.getSession(false); // check if session exists
         if (session != null) {
            Cart cart;
            synchronized (session) {
               // Retrieve the shopping cart for this session, if any. Otherwise, create one.
               cart = (Cart) session.getAttribute("cart");
               if (cart != null && !cart.isEmpty()) {
                  htmlStr += "<P><a href='cart?todo=view'>View Shopping Cart</a></p>\n";
               }
            }
         }
         */
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
