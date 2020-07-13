import java.sql.Connection;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MySqlCon {
	// must use mysql-connector-java-8.0.19.jar (exactly same version of mysql-server)
    private static String driver = "com.mysql.cj.jdbc.Driver";
    private static String connection = "jdbc:mysql://localhost:3306/CS157A?serverTimezone=UTC";
    
    private static String user = "root";                  //'root' is username
    private static String password = "Summer2020~";        //password  
    
    private static Connection con = null;
    private static Statement state = null;
    private static ResultSet result;

    public static void main(String args[]) throws Exception {
        mysqlConnect();
        state = con.createStatement();
        result = state.executeQuery("select * from emp");
        closeConnection();
        }

    public static void mysqlConnect(){
        try{
            Class.forName(driver);
            con = DriverManager.getConnection(connection, user, password);
            System.out.println("Successfully connected to database.");
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


    public static void closeConnection(){
        try{
            if(!con.isClosed()){
                con.close();
                System.out.println("Database closed successfully.");
                }
            }
        catch(NullPointerException e){
            System.err.println("Couldn't load driver.");
            System.out.println(e.getMessage( ));
            }
        catch(SQLException e){
            System.err.println("Couldn't close database.");
            System.out.println(e.getMessage( ));
            }
        }

    public static void showData(String word){
        try{
            state = con.createStatement();
            result = state.executeQuery("select * from dictionary where word='"+word+"'");
            while(result.next()){
                String word1 = result.getString("word");
                String mean = result.getString("meaning");
                String syno = result.getString("synonyms");
                String anto = result.getString("antonyms");
                System.out.println("Word: "+word1+" Meaning: "+mean+" Synonyms: "+syno+" Antonyms: "+anto);
                }
            }
        catch(SQLException e){
            System.err.println("Query error.");
            System.out.println(e.getMessage( ));
            }
        
        catch(NullPointerException e){
            System.err.println("Element not found.");
            System.out.println(e.getMessage( ));
            }
        }
}

