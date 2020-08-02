<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
  <h2>User Grocery List</h2><br>
  
  <nav class="my-2 my-md-0 mr-md-3">
    <a class="p-2 text-dark" href="/GNTmarket/home">Home</a>
    
    <c:if test="${currentUser != null}">
        <a class="p-2 text-dark" href="/GNTmarket/dish">Dish</a>
    	<a class="p-2 text-dark" href="/GNTmarket/food">Food</a>
    	<a class="p-2 text-dark" href="/GNTmarket/gCard">Grocery List</a>
    </c:if>
  </nav>

</div>

<main role="main" class="container">

    	<br><c:if test="${currentUser != null}">  
    		<h2>Hello, <c:out value="${currentUser.name}"></c:out>!</h2>
    	</c:if>
    	
    	<table border="1" cellpadding="6">
            <tr>
            	<th>Food</th>
            	<th>Preference</th>
            	<th>Nutrient Info</th>
			</tr>
			
			<c:forEach var="food" items="${foodNutrientMap}">
				<tr>
					<td><c:out value="${food.key}" /></td>
					
                    <td><form method='get' action='gCard'>
               				<input type='hidden' name='id' value='" + id + "'/>
               				<label><input type='radio' name='todo' value='likeF'/>Like</label>
               				<label><input type='radio' name='todo' value='avoidF'/>Avoid</label>
               				<input type='submit' value='update'>
               		</form></td>
                    
                    <td><c:out value="${food.value}" /></td>
				</tr>
			</c:forEach>
			
		</table>
		
		<p><a href="food">Select More Food</a></p>
        <br><form method='get' action='userGlist'><input type='submit' value='Save'></form>
		
</main><!-- /.container -->

</body></html>