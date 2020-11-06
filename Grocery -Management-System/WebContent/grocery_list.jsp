<%@page import="com.cdac.dto.Grocery"%>
<%@page import="java.util.List"%>
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
    <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    <script>
    $(document).ready(function() {
		$("#myInput").on("keyup", function() {
			var value = $(this).val().toLowerCase();
			$("#myTableBody tr").filter(function() {
				$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
			});
		});
	});
    </script>
    <script>
		function alertBox(){
			if(confirm("Are you sure , You want to delete?"));
		}
		var d = new Date();
		document.getElementById("demo").innerHTML = d;
	</script>
  </head>
<body>
	<div class="container-fluid d-flex justify-content-center" style="height: 100vh ;background: linear-gradient(rgba(0, 0, 0, 0.2),rgba(0, 0, 0, 0.1)),url(gro1.jpg);
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
   <br>
    
    <div class="container-fluid" style="margin-top: 80px">
		<div class="row content">
			<div class=" col-sm-12">
				<h3 class="text-center" style="color: black ;text-shadow: 2px 2px 5px white">
					<b>Grocery List</b>
				</h3>
				<div class="container">
					<div class="row">				
						<div class="col-3 form-group ml-0 pl-0 float-left"><input class="form-control  float-center" id="myInput" type="text" placeholder="Search"></div>
						<div class="col-7 form-group float-left">														
						</div>
						<div class="col-2 form-group ">
						<a href="AddFlightForm.jsp">
							<a class="btn btn-dark btn-small btn-block" href="prep_grocery_add_form.htm" role="button">Add Grocery</a>
						</a>
						</div>
					</div>
				</div>
				<div class="table-responsive" id="myTable"></div>
				<div class="container-fluid" style="margin-top:20px">
     		<spr:form action="grocery_add.htm" method="post" commandName="grocery" >
				<table class="table  table-striped ">
					<thead class="table-dark">
						<tr>
							<th class="align-middle">Grocery Id</th>
							<th class="align-middle">Grocery Name</th>
							<th class="align-middle">Quantity(Kg)</th>
							<th class="align-middle">Price</th>
							<th class="align-middle">Purchase Date</th> 
							<th class="align-middle">Expiry Date</th>
 							<th class="align-middle">Modify</th> 
						</tr>
					</thead>
					<tbody id="myTableBody">
					<% 
					List<Grocery> glist = (List<Grocery>)request.getAttribute("groceryList");
					for(Grocery g: glist){
					%>
						<tr style="color: black;font-weight: bold; font-size: 20px">
							<td class="align-middle"><%= g.getGroceryId() %></td>
							<td class="align-middle"><%= g.getItemName() %></td>
							<td class="align-middle"><%= g.getQuantity() %></td>
							<td class="align-middle"><%= g.getPrice() %></td>
							<td class="align-middle"><%= g.getPurchaseDate()%></td>
							<td class="align-middle"><%= g.getExpiryDate() %></td>
							<td class="align-middle">
								<a class="btn btn-danger btn-small" role="button" onclick="alertBox()" href="grocery_delete.htm?groceryId=<%=g.getGroceryId()%>">Delete</a>
								<a class="btn btn-primary btn-small" role="button" href="grocery_update_form.htm?groceryId=<%=g.getGroceryId()%>">Update</a>
							</td>
							
						</tr>
						<% } %>
						
					</tbody>
				</table>
				</spr:form>
				</div>
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