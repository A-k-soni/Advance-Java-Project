
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="spr" %> 
<%@page import="com.cdac.dto.User"%>
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

<%
	User user = (User)session.getAttribute("user");
	String firstName = "", profilePic = "";
	if(user!=null){
		firstName = user.getFirstName();
		profilePic = user.getProfilePic();
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
    
   
  </head>
<body>
	<div class="container-fluid d-flex justify-content-center" style="height: 100vh ;background: linear-gradient(rgba(0, 0, 0, 0.5),rgba(0, 0, 0, 0.2)),url(dd.jpg);
 		background-size:cover;background-position:center; background-repeat:no-repeat">
	
	<nav
      class="row navbar navbar-expand fixed-top text-light navbar-dark bg-dark "
    >
      <div class="col-3 nav navbar-nav">
        
                 <a href="file_upload_form.html" style="color:white;font-weight: bolder;font-size: 20px;text-shadow: 2px 2px 5px red">Profile Picture</a>
         
      </div>
      <div class="col-6 nav navbar-nav d-flex justify-content-center" style="font-family: cursive; font-size: 30px; text-shadow: 2px 2px 5px red">
        <b> Grocery Management System
        </b>
      </div>
      <div class="col-3 nav navbar-nav d-flex justify-content-end">
        <a class="nav-item nav-link active" href="logout.htm" style="font-weight: bolder;font-size: 20px;text-shadow: 2px 2px 5px red">Logout </a>
      </div>
      
    </nav>
   
    <div class="container-fluid" style="margin-top:130px">
     	
      <table align="center" >
		<tr><td>&nbsp;&nbsp;</td></tr>
		<tr style="font-size: 50px;font-style: italic;font-weight: bold; text-shadow: 2px 2px 5px white; color:white">
			<td style="color: blue ; font-size: 65px"> Welcome <%=(session.getAttribute("user")!=null) ? ((User)session.getAttribute("user")).getFirstName() : "!!!!!!!!" %> <img alt="no pic" src="<%="images/"+profilePic%>" height="150" width="150" ></td>
		</tr>
		
		

	</table>
	<div class="row justify-content-center" style="margin-top: 15vh">
	<div class="col-3"></div>
	<div class="col-3 d-flex justify-content-center">
		<a class="btn btn-warning btn-small btn-block d-flex justify-content-center align-items-center " href="prep_grocery_add_form.htm" role="button" style="height: 150px"><p style="color:red ;font-weight: bold; font-size: 48px;text-shadow: 2px 2px 5px black">Add Grocery</p></a> 
	</div>
	<div class="col-3 d-flex justify-content-center">
		<a class="btn btn-warning btn-small btn-block d-flex justify-content-center align-items-center " href="grocery_list.htm" role="button" style="height: 150px"><p style="color:red ;font-weight: bold; font-size: 48px ;text-shadow: 2px 2px 5px black">Grocery List</p></a> 
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