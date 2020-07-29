package sjsu.gntmarket;

import java.io.*;
import java.sql.*;
import java.util.logging.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.sql.*;

public class SearchServlet extends HttpServlet {
    private String dbURL, dbUser, dbPassword;
 
	public SearchServlet() {
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
         System.out.println(name);
         boolean hasFnameParam = name != null && !name.equals("Select Food");
         String fSearchWord = request.getParameter("fsearch").trim();
         boolean hasfSearchParam = fSearchWord != null && (fSearchWord.length() > 0);

         String htmlStr="<html><head><title>GNT-market</title></head><body>\n"
         + "<h2>Query Result</h2>\n";
 
         conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
         stmt = conn.createStatement();

         // Form a SQL command based on the param(s) present
         StringBuilder sqlStr = new StringBuilder();  // more efficient than String
         sqlStr.append("SELECT * FROM Food WHERE (");
         if (hasFnameParam) {
            sqlStr.append("name = '").append(name).append("'");
         }
         if (hasfSearchParam) {
            if (hasFnameParam) {
               sqlStr.append(" OR ");
            }
            sqlStr.append("name LIKE '%").append(fSearchWord).append("%'");
         }
         sqlStr.append(") ORDER BY name");
         System.out.println(sqlStr);  // for debugging
         ResultSet rset = stmt.executeQuery(sqlStr.toString());

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
           do {
               String id = rset.getString("food_id");
               htmlStr += "<tr>\n"
               + "<td>" + rset.getString("name") + "</td>\n"
               + "<td><form method='get' action='gCard'>\n"
               + "<input type='hidden' name='todo' value='addF'/>\n"
               + "<input type='hidden' name='id' value='" + id + "'/>\n"
               + "<input type='submit' value='+'/>\n"
               + "</form></td>\n"
               + "<td><form method='get' action='gCard'>\n"
               + "<input type='hidden' name='todo' value='delF'/>\n"
               + "<input type='hidden' name='id' value='" + id + "'/>\n"
               + "<input type='submit' value='X'/>\n"
               + "</form></td></tr>\n";
            }  while (rset.next());
            htmlStr += "</table><br/>\n"
            + "<p><a href='food'>Select More Food</a></p>\n";

            
            HttpSession session = request.getSession(false); // check if session exists
            if (session != null) {
               GroceryCard gCard;
               synchronized (session) {
                  // Retrieve the shopping cart for this session, if any. Otherwise, create one.
                  gCard = (GroceryCard) session.getAttribute("gCard");
                  if (gCard != null && !gCard.isEmpty()) {
                     htmlStr += "<p><a href='gCard?todo=view'>Grocery List</a></p>\n";
                  }
               }
            }
            htmlStr += "</body></html>\n";
            out.println(htmlStr);
         }
      } catch (SQLException ex) {
         out.println("<h3>Service not available. Please try again later!</h3></body></html>");
      } finally {
         out.close();
         try {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();  // Return the connection to the pool
         } catch (SQLException ex) {
         }
      }
   }


 
   @Override
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
           throws ServletException, IOException {
      doGet(request, response);
   }
}
