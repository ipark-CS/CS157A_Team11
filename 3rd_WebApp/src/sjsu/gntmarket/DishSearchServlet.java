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
    public DishSearchServlet() 
    {
        super();
    }

    public void init() throws ServletException 
    {
        dbURL = getServletContext().getInitParameter("dbURL");
        dbUser = getServletContext().getInitParameter("dbUser");
        dbPassword = getServletContext().getInitParameter("dbPassword");
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

          String htmlStr="<html><head><title>GNT-market</title></head><body>\n"
          + "<h2>Query Result</h2>\n";
  
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

