package sjsu.gntmarket;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
	
	private String driver = "com.mysql.cj.jdbc.Driver";
	private Connection dbCon;
	
	private String dbURL;
    private String dbUser;      
    private String dbPassword;
	
	
	public UserDAO(String dbURL, String dbUser, String dbPassword){
		this.dbURL = dbURL;
		this.dbUser = dbUser;
		this.dbPassword = dbPassword;
	}
	
    protected void mysqlConnect() throws SQLException{
        try{
            Class.forName(driver);
            dbCon = DriverManager.getConnection(dbURL, dbUser, dbPassword);
            System.out.println("Successfully connected to database from UserDAO");
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
    
    public boolean createUser(User user) throws SQLException {
    	String sql = "INSERT INTO users (email, password, name) VALUES (?, ?, ?)";
    	mysqlConnect();
    	
    	PreparedStatement statement = dbCon.prepareStatement(sql);
    	statement.setString(1, user.getEmail());
    	statement.setString(2, user.getPassword());
    	statement.setString(3, user.getName());
    	
    	boolean userCreated = (statement.executeUpdate() > 0);
    	statement.close();
    	mysqlDisconnect();
    	
    	return userCreated;
    }
    
    public int restoreUserID(String email, String password) throws SQLException{
    	
    	String sql = "SELECT user_id FROM users WHERE email = ? AND password = ?";
    	
    	mysqlConnect();
    	
    	PreparedStatement statement = dbCon.prepareStatement(sql);
    	statement.setString(1, email);
    	statement.setString(2, password);
    	
    	ResultSet rs = statement.executeQuery();
    	
    	int userID = 0;
    	
    	while(rs.next()) {
    		userID = rs.getInt("user_id");
    	}
    	
    	if (userID != 0) {
    		System.out.println("UserID " + userID + " found!");
    	}
    	else {
    		System.out.println("User not found");
    	}
    	
    	rs.close();
    	statement.close();
    	
    	mysqlDisconnect();
    	
    	return userID;
    }
    
    public List<User> listUsers() throws SQLException {
    	List<User> userList = new ArrayList<User>();
    	
    	String sql = "SELECT * FROM users";
    	
    	mysqlConnect();
    	
    	Statement statement = dbCon.createStatement();
    	
    	ResultSet rs = statement.executeQuery(sql);
    	
    	System.out.println("Inside list users");
    	
    	while(rs.next()) {
    		
    		int id = rs.getInt("user_id");
    		String email = rs.getString("email");
    		String password = rs.getString("password");
    		String name = rs.getString("name");
    		
    		System.out.println("ID: " + id + ", Email: " + email);
    		
    		User user = new User(id, email, password, name);
    		userList.add(user);
    	}
    	
    	rs.close();
    	statement.close();
    	
    	mysqlDisconnect();
    	
    	System.out.println("COUNT: " + userList.size());
    	
    	return userList;
    }
    
    public User getUser(String email, String password) throws SQLException {
    	User user = null;
    	
    	String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
    	
    	mysqlConnect();
    	
    	PreparedStatement statement = dbCon.prepareStatement(sql);
    	statement.setString(1, email);
    	statement.setString(2, password);
    	
    	ResultSet rs = statement.executeQuery();
    	
    	if(rs.next()) {
    		int userID = rs.getInt("user_id");
    		email = rs.getString("email");
    		password = rs.getString("password");
    		String name = rs.getString("name");
    		
    		user = new User(userID, email, password, name);
    		
    		System.out.println("Welcome, " + user.getName());
    	}
    	
    	rs.close();
    	statement.close();
    	
    	return user;
    }
    
    public boolean updateUser(User user) throws SQLException{
    	String sql = "UPDATE users SET email = ?, password = ?, name = ? WHERE user_id = ?";
    	
    	mysqlConnect();
    	
    	PreparedStatement statement = dbCon.prepareStatement(sql);
    	statement.setString(1, user.getEmail());
    	statement.setString(2, user.getPassword());
    	statement.setString(3, user.getName());
    	statement.setInt(4, user.getId());
    	
    	boolean userUpdated = (statement.executeUpdate() > 0);
    	
    	statement.close();
    	mysqlDisconnect();
    	
    	return userUpdated;
    }
    
    public boolean deleteUser(User user) throws SQLException{
    	
    	String sql = "DELETE FROM users WHERE user_id = ?";
    	
    	mysqlConnect();
    	
    	PreparedStatement statement = dbCon.prepareStatement(sql);
    	
    	statement.setInt(1, user.getId());
    	
    	boolean userDeleted = (statement.executeUpdate() > 0);
    	
    	statement.close();
    	mysqlDisconnect();
    	
    	return userDeleted;
    }
    
    

}
