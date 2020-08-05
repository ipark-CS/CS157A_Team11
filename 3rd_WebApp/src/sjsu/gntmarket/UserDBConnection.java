package sjsu.gntmarket;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 * 
 * This is a test class, it is NOT USED in the program.
 * 
 *
 */
public class UserDBConnection {
	
	public User userLogin(String email, String password) throws Exception{
		
	    String driver = "com.mysql.cj.jdbc.Driver";
	    String connection = "jdbc:mysql://localhost:3306/gnt-market?serverTimezone=UTC";
	    
	    String dbUser = "root";      
	    String dbPassword = "admin";  
	    
	    Connection con = null;
	    Statement state = null;
	    ResultSet result;
	    
	    Class.forName(driver);
	    
	    con = DriverManager.getConnection(connection, dbUser, dbPassword);
        
	    String sql = "SELECT * FROM users WHERE email = ? and password = ?";
        
        PreparedStatement statement = con.prepareStatement(sql);
        statement.setString(1, email);
        statement.setString(2, password);
 
        result = statement.executeQuery();
 
        User user = null;
 
        if (result.next()) {
            user = new User();
            user.setName(result.getString("name"));
            user.setEmail(email);
        }
 
        con.close();
		
		return user;
	}
	
}
