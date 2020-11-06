<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.Date"%>
    
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
    />
    <!-- Bootstrap CSS -->
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
      crossorigin="anonymous"
    />
    <script
      src="https://kit.fontawesome.com/0ff6456f25.js"
      crossorigin="anonymous"
    ></script>
    <style>
      body {
        background-repeat: no-repeat;
        background-size: cover;
      }

      .img {
        width: 50vh;
        height: 50vh;
        margin-left: 25%;
        margin-top: 10%;
      }

      #icn {
        font-size: 25px;
        margin: 19px;
        color: white;
        cursor: pointer;
      }

      .mobileShow {
        display: inline;
      }

      /* Smartphone Portrait and Landscape */
      @media only screen and (min-device-width: 320px) and (max-device-width: 580px) {
        .mobileShow {
          display: inline;
        }
      }

      .mobileHide {
        display: inline;
      }

      /* Smartphone Portrait and Landscape */
      @media only screen and (min-device-width: 320px) and (max-device-width: 580px) {
        .mobileHide {
          display: none;
        }
      }
    </style>
  </head>
<body>
<div  class="container-fluid d-flex justify-content-center" style="height: 100vh ;background: linear-gradient(rgba(0, 0, 0, 0.5),rgba(0, 0, 0, 0.2)),url(g2.png);
 background-size:cover;background-position:center; background-repeat:no-repeat">
	<nav
      class="navbar navbar-expand fixed-top text-light navbar-dark bg-dark justify-content-between"
    	>
      <div class="nav navbar-nav">
        <a class="nav-item nav-link active" href="prep_reg_form.htm" style="font-weight: bolder;font-size: 20px;text-shadow: 2px 2px 5px red"> Sign Up</a
        >
      </div>
      <div class="nav navbar-nav" style="font-family: cursive; font-size: 30px; text-shadow: 2px 2px 5px red">
        <b> Grocery Management System
        </b>
      </div>
      <div class="nav navbar-nav">
        <a class="nav-item nav-link active" href="prep_log_form.htm" style="font-weight: bolder;font-size: 20px;text-shadow: 2px 2px 5px red">Sign In </a>
      </div>
    </nav>
    
    <div class="container-fluid">
      <div class="row mt-5" style="height: 50vh">
        <div class="col-3"></div>
        <div class="col-6 ">
       <br>
        <div class=" display-4" style="text-align: center; color: cornsilk;font-weight: bolder; text-shadow: 5px 5px 10px grey;">WELCOME TO</div>
        <div class=" display-1" style="color: cornsilk; text-shadow: 5px 5px 10px grey;font-weight: bolder; text-align: center;">Grocery Management System</div>
        </div>
        <div class="col-3"></div>
      </div>
    </div>
    </div>

    <footer class="page-footer font-small bg-dark text-light fixed-bottom">
    <div style="display: flex; justify-content: center; align-items: center; color: cornsilk; font-size: 25px; text-shadow: 2px 2px 5px red">	<%= new Date() %></div>
      <div class="footer-copyright text-center">Created by : Grocery Management System</div>
     
      <!-- Copyright -->
      <div class="footer-copyright text-center">
        © 2020 Copyright:
        <a href="https://mdbootstrap.com/"> CDAC</a>
      </div>
      <!-- Copyright -->
    </footer>
    </div>
</body>
</html>