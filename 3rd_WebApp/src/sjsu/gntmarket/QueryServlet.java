package sjsu.gntmarket;

import java.io.*;
import java.sql.*;
import java.util.logging.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.sql.*;

public class QueryServlet extends HttpServlet {
    private String dbURL, dbUser, dbPassword;
 
	public QueryServlet() {
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
         String name = request.getParameter("name");
         boolean hasNameParam = name != null && !name.equals("Select...");
         String searchWord = request.getParameter("search").trim();
         boolean hasSearchParam = searchWord != null && (searchWord.length() > 0);

         String htmlStr="<html><head><title>GNT-market</title></head><body>\n"
         + "<h2>Grocery List</h2>\n";
 
         conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
         stmt = conn.createStatement();

         // Form a SQL command based on the param(s) present
         StringBuilder sqlStr = new StringBuilder();  // more efficient than String
         sqlStr.append("SELECT * FROM Food WHERE (");
         if (hasNameParam) {
            sqlStr.append("name = '").append(name).append("'");
         }
         if (hasSearchParam) {
            if (hasNameParam) {
               sqlStr.append(" OR ");
            }
            sqlStr.append("name LIKE '%").append(searchWord).append("%'");
         }
         sqlStr.append(") ORDER BY name");
         System.out.println(sqlStr);  // for debugging
         ResultSet rset = stmt.executeQuery(sqlStr.toString());
 
         if (!rset.next()) {  
            htmlStr += "<h3>No food found.</h3>\n"
            + "<p><a href='food'>Back to Select Menu</a></p>\n";
         } else {
            // Print the result in an HTML form inside a table
            htmlStr += "<form method='get' action='groceryCard'>\n"
            + "<input type='hidden' name='todo' value='add' />\n"
            + "<table border='1' cellpadding='6'>\n"
            + "<tr>\n"
            + "<th>&nbsp;</th>\n"
            + "<th>FOOD</th>\n"
            + "</tr>\n";
 			
            // ResultSet's cursor now pointing at first row
            do {
               // Print each row with a checkbox identified by book's id
               String id = rset.getString("food_id");
               htmlStr += "<tr>\n"
               + "<td><input type='checkbox' name='id' value='" + id + "' /></td>\n"
               + "<td>" + rset.getString("name") + "</td>\n"
               + "</tr>\n";
            } while (rset.next());
            htmlStr += "</table><br />\n"
            + "<input type='submit' value='Add to My Shopping Cart' />\n"
            + "<input type='reset' value='CLEAR' /></form>\n"
            + "<p><a href='food'>Back to Select Menu</a></p>\n";
 
            // Show "View Shopping Cart" if cart is not empty
            /*
            HttpSession session = request.getSession(false); // check if session exists
            if (session != null) {
               Cart cart;
               synchronized (session) {
                  // Retrieve the shopping cart for this session, if any. Otherwise, create one.
                  cart = (Cart) session.getAttribute("cart");
                  if (cart != null && !cart.isEmpty()) {
                     htmlStr += "<p><a href='cart?todo=view'>View Shopping Cart</a></p>\n";
                  }
               }
            }
            */
            htmlStr += "</body></html>\n";
            out.println(htmlStr);
         }
      } catch (SQLException ex) {
    	 System.out.println(ex.toString());
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
