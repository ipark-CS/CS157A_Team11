<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
  
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>CS157A-Team11| GNT-Market | Food </title>
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
  </head>
</head>
  
<body>
  <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
	  <h5 class="my-0 mr-md-auto font-weight-normal">GNT-Market</h5>
	  <nav class="my-2 my-md-0 mr-md-3">
	    <a class="p-2 text-dark" href="/GNTmarket/home">Home</a>
	    
	    <c:if test="${currentUser != null}">
	        <a class="p-2 text-dark" href="/GNTmarket/dish">Dish</a>
	    	<a class="p-2 text-dark" href="/GNTmarket/food">Food</a>
	    	<a class="p-2 text-dark" href="/GNTmarket/gCard">Grocery List</a>
	    </c:if>
	  </nav>
  </div>
  
       <h2>Select/Search Food</h2>
       <form method='get' action='search'>
	       <select name='fname' id='fname' size='1'></select>
	       <option value=''>Select Food</option>
	       <option value='" + name + "'>" + name + "</option>
	       
	       <input type='submit' value='Search' />
       </form>
  
  <p><a href='gCard?todo=view'>Grocery List</a></p>
  
</body>
</html>
