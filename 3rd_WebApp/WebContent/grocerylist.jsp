<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<html lang="en">
<head>
    <meta charset="utf-8">
    <title>CS157A-Team11| GNT-Market | Home</title>
    <!-- css -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v3.8.5">
   
    <link rel="canonical" href="https://getbootstrap.com/docs/4.3/examples/pricing/">

    <!-- Bootstrap core CSS -->
<link href="/docs/4.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">


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
	<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>

  
<body>
<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
<h5 class="my-0 mr-md-auto font-weight-normal">
<a href="#" class="navbar-brand d-flex align-items-center">
<i class='fas fa-carrot' style='font-size:24px'></i>
<strong>&nbsp;GNT-Market</strong>
</a></h5>
<nav class="my-2 my-md-0 mr-md-3">
    <a class="p-2 text-dark" href="/GNTmarket/home">Home</a>
    
    <c:if test="${currentUser != null}">
        <a class="p-2 text-dark" href="/GNTmarket/dish">Dish</a>
    	<a class="p-2 text-dark" href="/GNTmarket/food">Food</a>
    	<a class="p-2 text-dark" href="/GNTmarket/gCard">Grocery List</a>
    </c:if>
    
    <c:if test="${currentUser == null}">  
   		<a class="p-2 text-dark" href="/GNTmarket/new-account">Create Account</a>
   		<a class="btn btn-outline-primary" href="/GNTmarket/login">Login</a>
   		
   	</c:if>
   	
    <!-- <a class="p-2 text-dark" href="/GNTmarket/user-list">User Test Page</a>  -->
  
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
			
			<c:forEach var="food" items="${groceryArrList}">
				<tr>
					<td><c:out value="${food.name}" /></td>
					
                    <td><form method='get' action='gCard'>
               				<input type='hidden' name='id' value="${food.id}"/>
               				<label><input type='radio' name='todo' value='likeF'/>Like</label>
               				<label><input type='radio' name='todo' value='avoidF'/>Avoid</label>
               				<input type='submit' value='update'>
               		</form></td>
                    
                    <td><c:out value="${food.nutrientInfo}" /></td>
				</tr>
			</c:forEach>
			
		</table>
		
		<p><a href="food">Select More Food</a></p>
        <br><form method='get' action='userGlist'><input type='submit' value='Save'></form>
		
</main><!-- /.container -->

</body></html>
