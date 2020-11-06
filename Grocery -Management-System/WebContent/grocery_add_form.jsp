<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spr" %> 
<%@page import="java.util.Date"%>
<%

response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);
    if(session.getAttribute("user")==null){
    response.sendRedirect(request.getContextPath() + "/login_form.jsp");

}
%>


<!DOCTYPE html>
<html>
<head>
    <title>Log-In</title>
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
    <script>
		var d = new Date();
		document.getElementById("demo").innerHTML = d;
	</script>
    <style>
      body {
        background-image: url("background.jpg");
        background-repeat: no-repeat;
        background-size: cover;
      }

      .img {
        width: 50vh;
        height: 50vh;
        margin-left: 16%;
        margin-top: 40%;
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
<body ">
	<div class="container-fluid d-flex justify-content-center" style="height: 100vh ;background: linear-gradient(rgba(0, 0, 0, 0),rgba(0, 0, 0, 0)),url(kk.jpg);
 		background-size:cover;background-position:center; background-repeat:no-repeat">
	<nav
      class="navbar navbar-expand fixed-top text-light navbar-dark bg-dark justify-content-between"
    >
      <div class="nav navbar-nav">
        <a class="nav-item nav-link active" href="home.jsp" style="font-weight: bolder;font-size: 20px;text-shadow: 2px 2px 5px red">Back</a>
      </div>
      <div class="nav navbar-nav" style="font-family: cursive; font-size: 30px; text-shadow: 2px 2px 5px red">
        <b> Grocery Management System
        </b>
      </div>
      <div class="nav navbar-nav">
        <a class="nav-item nav-link active" href="logout.htm" style="font-weight: bolder;font-size: 20px;text-shadow: 2px 2px 5px red">Logout </a>
      </div>
    </nav>
    <div class="container-fluid" style="margin-top:170px">
     	<spr:form action="grocery_add.htm" method="post" commandName="grocery" >
		
	<table align="center" >
		<tr>
			<td>
				<h4 style="color: black;font-weight: bolder; text-shadow: 2px 2px 3px red;">Item :</h4>
			</td>
			<td>
				<div class="form-group">
                  <spr:input class="form-control" placeholder="Enter Item Name" path="itemName"/>
                  <font style="color: red;text-shadow: 2px 2px 3px white; font-weight: bold;" ><spr:errors path="itemName"/></font>
                </div>
			</td>
		</tr>
		<tr>
			<td>
				<h4 style="color: black;font-weight: bolder; text-shadow: 2px 2px 3px red;">Quantity :</h4>
			</td>
			<td>
				<div class="form-group">
                  <spr:input class="form-control" type="number" id="quantity" name="quantity" min="1" max="5000000" value="1" placeholder="Enter Quantity" path="quantity"/>
                </div>
			</td>
		</tr>
		<tr>
			<td>
				<h4 style="color: black;font-weight: bolder; text-shadow: 2px 2px 3px red;">Price : </h4>
			</td>
			<td>
				<div class="form-group">
                  <spr:input class="form-control" type="number" id="quantity" name="quantity" min="1" max="5000000" value="1" placeholder="Enter Quantity" path="price"/>
                </div>
			</td>
		</tr>
		<tr>
			<td>
				<h4 style="color: black;font-weight: bolder; text-shadow: 2px 2px 3px red;">Purchase Date :</h4>
			</td>
			<td>
				<div class="form-group">
                  <spr:input class="form-control" type="date" placeholder="Enter Quantity" path="purchaseDate"/>
                   <font style="color: red;text-shadow: 2px 2px 3px white; font-weight: bold;" ><spr:errors path="purchaseDate"/></font>
                </div>
			</td>
		</tr>
		<tr>
			<td>
				<h4 style="color: black;font-weight: bolder; text-shadow: 2px 2px 3px red;">Expiry Date:</h4>
			</td>
			<td>
				<div class="form-group">
                  <spr:input class="form-control" type="date" placeholder="Enter Quantity" path="expiryDate"/>
                   <font style="color: red;text-shadow: 2px 2px 3px white; font-weight: bold;" ><spr:errors path="expiryDate"/></font>
                </div>
			</td>
		</tr>
		
		<tr>
			<td>
				
			</td>
			<td>
				<input type="submit"  value="Add" class="btn btn-primary btn-block" >
			</td>
		</tr>
	</table>
	</spr:form>
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