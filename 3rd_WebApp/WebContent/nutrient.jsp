<%@ page import="java.sql.*"%>
  
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>CS157A-Team11-GNT-market</title>
    <!-- bootstrap -->
    <link href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">

    <!-- css -->
    <link href="/docs/4.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

    <!-- Favicons -->
	<link rel="apple-touch-icon" href="/docs/4.5/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
	<link rel="icon" href="/docs/4.5/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
	<link rel="icon" href="/docs/4.5/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
	<link rel="manifest" href="/docs/4.5/assets/img/favicons/manifest.json">
	<link rel="mask-icon" href="/docs/4.5/assets/img/favicons/safari-pinned-tab.svg" color="#563d7c">
	<link rel="icon" href="/docs/4.5/assets/img/favicons/favicon.ico">
	<meta name="msapplication-config" content="/docs/4.5/assets/img/favicons/browserconfig.xml">
	<meta name="theme-color" content="#563d7c">


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
    <!-- Custom styles for this template -->
    <link href="pricing.css" rel="stylesheet">
</head>

  
<body>
  <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
  <h5 class="my-0 mr-md-auto font-weight-normal">GNT-Market</h5>
  <nav class="my-2 my-md-0 mr-md-3">
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-primary my-2 my-sm-0" type="submit">Search Food</button>
    </form>
  </nav>
  <nav class="my-2 my-md-0 mr-md-3">
    <a class="p-2 text-dark" href="dish.jsp">Dish</a>
    <a class="p-2 text-dark" href="food.jsp">Food</a>
    <a class="p-2 text-dark" href="nutrient.jsp">Nutrient</a>
    <a class="p-2 text-dark" href="bodysystem.jsp#">BodySystem</a>
  </nav>
  <a class="btn btn-outline-primary" href="#">Login</a>
</div>

<main role="main" class="container">

  
   <% 
     String db = "GNTmarket";
        String user; // assumes database name is the same as username
          user = "root";
          String password = "Summer2020~";
        try {
            
            java.sql.Connection con; 
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url="jdbc:mysql://localhost:3306/" + db + "?serverTimezone=UTC";
            con = DriverManager.getConnection(url, user, password);
            out.println(db + " database successfully opened.<br/><br/>");
            
            String tableName = "Nutrient";
        	%>
        	<div class="list-group">
        	
            <button type="button" class="list-group-item list-group-item-action active">
            <%=tableName + " Table fetched"%>
           </button>
           	<%
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM " + tableName);
            while (rs.next()) {
            	%>
            	<button type="button" class="list-group-item list-group-item-action">
            	<%=rs.getInt(1) + " " + rs.getString(2)%>
            	 </button>
				<%
            }
            rs.close();
            stmt.close();
            con.close();
        } catch(SQLException e) { 
            out.println("SQLException caught: " + e.getMessage()); 
        }
    %>
 

</div>

</main><!-- /.container -->

</body></html>
