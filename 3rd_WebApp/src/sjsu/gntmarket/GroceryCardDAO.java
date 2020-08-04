package sjsu.gntmarket;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class GroceryCardDAO {
	
	private String driver = "com.mysql.cj.jdbc.Driver";
	private Connection dbCon;
	
	private String dbURL;
    private String dbUser;      
    private String dbPassword;
    
    public GroceryCardDAO(String dbURL, String dbUser, String dbPassword){
		this.dbURL = dbURL;
		this.dbUser = dbUser;
		this.dbPassword = dbPassword;
	}
	
    protected void mysqlConnect() throws SQLException{
        try{
            Class.forName(driver);
            dbCon = DriverManager.getConnection(dbURL, dbUser, dbPassword);
            System.out.println("Successfully connected to database from GroceryCardDAO");
            }
        catch(ClassNotFoundException e){
            System.err.println("Couldn't load driver.");
            System.out.println(e.getMessage( ));
            }
        catch(SQLException e){
            System.err.println("Couldn't connect to database.");
            System.out.println(e.getMessage( ));
            }
     }
    
    protected void mysqlDisconnect() throws SQLException{
    	if (dbCon != null && !dbCon.isClosed()) {
    		dbCon.close();
    	}
    }
    
    public void insertNewGroceryList() throws SQLException{
 	   
	 	String sqlStr = "INSERT INTO grocerylist (date) VALUES(now())";
	 	   
	 	mysqlConnect();
	 	  
	 	Statement statement = dbCon.createStatement();
	 	
	 	System.out.println(sqlStr);
	 	statement.executeQuery(sqlStr);
	 	  
	 	statement.close();
	 	 
	 	mysqlDisconnect();
 	   
    }
    
    public String getNewestGroceryList() throws SQLException{
    	
    	String sqlStr = "SELECT list_id FROM grocerylist ORDER BY list_id DESC LIMIT 1";
    	
	 	mysqlConnect();
	 	  
	 	Statement statement = dbCon.createStatement();
	 	
	 	System.out.println(sqlStr);
	 	ResultSet rs = statement.executeQuery(sqlStr);
	 	
	 	String listID = "";
	 	
	 	if (rs.next()) {
	 		listID = rs.getString("list_id");
	 	}
	 	
	 	rs.close();  
	 	statement.close();
	 	 
	 	mysqlDisconnect();
    	
		return listID;
    	
    }
    
    public int getUserGroceryListID(int userID) throws SQLException{
    	
    	String sql = "SELECT list_id FROM user_creates_grocerylist WHERE user_id = ? " + 
    				 "ORDER BY list_id DESC LIMIT 1";
    	
    	mysqlConnect();
    	
    	PreparedStatement statement = dbCon.prepareStatement(sql);
    	statement.setInt(1, userID);
    	
    	ResultSet rs = statement.executeQuery();
    	
    	int listID = 0;
    	
    	if(rs.next()) {
    		listID = rs.getInt("list_id");
    		
    		System.out.println("List ID: " + listID + " found for user: " + userID);
    	}
    	
    	rs.close();
    	statement.close();
    	
    	mysqlDisconnect();
    	
    	return listID;
    }
    
    public void removeFromGroceryList(int listID, int foodID) throws SQLException {
    	
    	String sql = "DELETE FROM food_lists_grocerylist WHERE list_id = ? AND food_id = ?";
    	
    	mysqlConnect();
    	
    	PreparedStatement statement = dbCon.prepareStatement(sql);
    	statement.setInt(1, listID);
    	statement.setInt(2, foodID);
    	
    	System.out.println(sql);
    	statement.executeQuery();
    	
    	statement.close();
    	
    	mysqlDisconnect();
    	
    }
    
    public GroceryCard restoreGroceryCard(int listID) throws SQLException {
    	
    	GroceryCard gCard = new GroceryCard();
    	
    	String sql = "SELECT food_id FROM food_lists_grocerylist WHERE list_id = ?"; 
    	
    	mysqlConnect();
    	
    	PreparedStatement statement = dbCon.prepareStatement(sql);
    	statement.setInt(1, listID);
    	
    	System.out.println(sql);
    	ResultSet rs = statement.executeQuery();
    	
    	while(rs.next()) {
    		
    		int foodID = rs.getInt("food_id");
    		
    		String foodSQLStr = "SELECT * FROM Food WHERE food_id = " + foodID;
    		
    		statement = dbCon.prepareStatement(foodSQLStr);
    		
    		System.out.println(foodSQLStr);
    		
    		ResultSet foodRSet = statement.executeQuery();
    		
    		if(foodRSet.next()) {
    			String name = foodRSet.getString("name");
    			gCard.add(foodID, name);
    		}
    		
    		foodRSet.close();
    	}
    	
    	rs.close();
    	statement.close();
    	
    	mysqlDisconnect();
    	
    	return gCard;
    }

}
