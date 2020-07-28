<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="ISO-8859-1">
<title>CS157A-Team11-GNT-market | Create Account</title>
</head>
<body>
	<h1>Create New User</h1>
	<form action="CreateUserServlet" method="post">
			<label for="name">Name:</label>
			<input type="text" id="name" name="name" size="30">
			<br><br><label for="email">Email:</label>
			<input type="text" id="email" name="email" size="30">
			<br><br><label for="pass">Password:</label>
			<input type="password" id="pass" name="password" size="30">
			<br><br><button type="submit">Create New Account</button>
	</form>
</body>
</html>