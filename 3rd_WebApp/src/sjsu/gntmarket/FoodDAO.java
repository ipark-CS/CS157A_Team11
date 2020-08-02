package sjsu.gntmarket;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;
import java.util.HashMap;

public class FoodDAO {
	
	private String driver = "com.mysql.cj.jdbc.Driver";
	private Connection dbCon;
	
	private String dbURL;
    private String dbUser;      
    private String dbPassword;
    
    public FoodDAO(String dbURL, String dbUser, String dbPassword){
		this.dbURL = dbURL;
		this.dbUser = dbUser;
		this.dbPassword = dbPassword;
	}
	
    protected void mysqlConnect() throws SQLException{
        try{
            Class.forName(driver);
            dbCon = DriverManager.getConnection(dbURL, dbUser, dbPassword);
            System.out.println("Successfully connected to database from FoodDAO");
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
    
    public void listAllFood() {
    	
    }
    
    public HashMap<String, String> getFoodNutrients(GroceryCard gCard) throws SQLException{
    	
    	mysqlConnect();
		
    	HashMap<String, String> nutrientMap = new HashMap<String, String>();
    	
        for (GroceryCardItem item : gCard.getItems()) {
        	
            int id = item.getId();
            
            String name = item.getName();

            String sqlStr2 = "SELECT GROUP_CONCAT(n.name SEPARATOR ', ') AS Nutrients\n"
            + "FROM Food_has_Nutrient fn NATURAL JOIN  Nutrient n\n"
            + "WHERE fn.food_id=" + id + "\n"
            + "AND fn.nutrient_id=n.nutrient_id\n"
            + "GROUP BY fn.food_id\n";
            
            PreparedStatement stmt = dbCon.prepareStatement(sqlStr2);
        	//stmt.setInt(1, userID);
            
            ResultSet rset2 = stmt.executeQuery(sqlStr2);
            
            rset2.next(); // Expect only one row in ResultSet
            
            String nutrient_info = rset2.getString("Nutrients");
            
            nutrientMap.put(name, nutrient_info);
            
            rset2.close();
        }
    	
        mysqlDisconnect();
        
    	return nutrientMap;
    }

}
