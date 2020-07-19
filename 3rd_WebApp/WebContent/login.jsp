<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CS157A-Team11-GNT-market</title>
</head>
<body>
	<div style="text-align: center" id = "login-section">
		<h2>User Login</h2>
		<form action="login" method="post">
			<label for="email">Email:</label> 
			<input type="text" id="email" name="email" size="30">
			<br><br><label for="pass">Password:</label>
			<input type="password" id="pass" name="password" size="30">
			<br><br><button type="submit">Login</button>
		</form>
		<br>
	</div>
</body>
</html>