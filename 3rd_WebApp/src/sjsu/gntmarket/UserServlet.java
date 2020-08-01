package sjsu.gntmarket;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CreateUserServlet
 */
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void init() {
		String dbURL = getServletContext().getInitParameter("dbURL");
		String dbUser = getServletContext().getInitParameter("dbUser");
		String dbPassword = getServletContext().getInitParameter("dbPassword");

		userDAO = new UserDAO(dbURL, dbUser, dbPassword);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * String yourName = request.getParameter("name"); PrintWriter writer =
		 * response.getWriter(); writer.println("<h1>Hello " + yourName + "</h1>");
		 * writer.close();
		 */

		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {

		String action = request.getServletPath();

		try {
			switch (action) {
			case "/home":
				returnToHome(request, response);
				break;
			case "/new-account":
				showNewUserForm(request, response);
				break;
			case "/insert":
				insertUser(request, response);
				break;
			case "/user-list":
				listUser(request, response);
				break;
			case "/login":
				loginPage(request, response);
				break;
			case "/login-user":
				loginUser(request, response);
				break;
			default:
				System.out.println("Reached Default");
				returnToHome(request, response);
				break;
			}

		} catch (Exception ex) {
			throw new ServletException(ex);
		}
	}
	
	public void listUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		List<User> userList = userDAO.listUsers();
		
		System.out.println("Before Index Dispatch, list count: " + userList.size());
		
		//ServletContext sc = getServletContext();
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("user.jsp");
		
		request.setAttribute("userList", userList);
		dispatcher.forward(request, response);
	}
	
	public void insertUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		
		 String email = request.getParameter("email");
	     String password = request.getParameter("password");
	     String name = request.getParameter("name");
	     
	     User newUser = new User(email, password, name);
	     userDAO.createUser(newUser);
	     
	     int newUserID = userDAO.restoreUserID(email, password);
	     
	     newUser.setId(newUserID);
	     
	     HttpSession session = request.getSession();
		 session.setAttribute("currentUser", newUser);
	     
		 RequestDispatcher dispatcher = request.getRequestDispatcher("/home");
		dispatcher.forward(request, response);
		
	}

	public void showNewUserForm(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("createAccount.jsp");
		dispatcher.forward(request, response);

	}
	
	public void loginPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);

	}
	
	public void loginUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		
		String email = request.getParameter("email");
	    String password = request.getParameter("password");
	    
	    User returningUser = userDAO.getUser(email, password);
	    
	    request.setAttribute("currentUser", returningUser);
	    
	    HttpSession session = request.getSession();
	    session.setAttribute("currentUser", returningUser);
	    
	    //response.sendRedirect("grocerylist.jsp");
	    
	    RequestDispatcher dispatcher = request.getRequestDispatcher("/gCard");
		dispatcher.forward(request, response);
		
	}
	
	public void returnToHome(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, SQLException {
		
		System.out.println("Returning to Home Page");
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
		dispatcher.forward(request, response);
		
	}

}
