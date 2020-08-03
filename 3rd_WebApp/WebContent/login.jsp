
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

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
    <link href="https://getbootstrap.com/docs/4.0/examples/sign-in/signin.css" rel="stylesheet">
</head>

<body class="text-center">
<!--
    <div style="text-align: center" id = "login-section">
            <label for="email">Email:</label>
            <input type="text" id="email" name="email" size="30">
            <br><br><label for="pass">Password:</label>
            <input type="password" id="pass" name="password" size="30">
            <br><br><input type="submit" value = "Login" />
        </form>
        <br>
    </div>
-->

<form action="login-user" method="post" class="form-signin">
      <h1 class="h3 mb-3 font-weight-normal">Please login</h1>
      <label for="email" class="sr-only">Email address</label>
      <input type="text" id="email" name="email" class="form-control" placeholder="Email address">
      <label for="pass" class="sr-only">Password</label>
      <input type="password" id="pass" name="password" class="form-control" placeholder="Password">
      <button class="btn btn-lg btn-primary btn-block" type="submit" value="Login"/>Login</button>
      <p class="mt-5 mb-3 text-muted">© GNT-market</p>
</form>
</body></html>
