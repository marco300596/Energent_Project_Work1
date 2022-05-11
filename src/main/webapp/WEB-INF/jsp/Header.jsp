<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse"  id="navbarTogglerDemo01">
  <a href=/home>
  	<img src ="/Image/logo-energent-colored.png" height="50" width="200" />
  </a>
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0" style="margin-left: 20px; height: 100%">
      <li class="nav-item" style="margin-right: 10px">
		<spring:url value="/academies" var="listURL" />
		<form:form method="post" action="${listURL}" cssClass="form">
      		<button type="submit" class="btn btn-dark text-nowrap" >
      			<img src ="/Image/academy.png" height="25" width="30" style="margin-right: 10px"/>Academy's List
      		</button>
      	</form:form>
      </li>
      <li class="nav-item">
      	<spring:url value="/academiesHP" var="okURL" />
		<form:form method="post" action="${okURL}" cssClass="form">
      		<button type="submit" class="btn btn-dark text-nowrap">
	      		<img src ="/Image/homepage.png" height="25" width="30" style="margin-right: 10px"/>Academies Home Page
	      	</button>
      	</form:form>
      </li>
      <li class="nav-item" style="margin-right: 10px">
        <spring:url value="/report" var="reportURL" />
		<form:form method="post" action="${reportURL}" cssClass="form">
      		<button type="submit" class="btn btn-dark text-nowrap">
      			<img src ="/Image/report.png" height="25" width="30" style="margin-right: 10px"/>report
      		</button>
      	</form:form>
      </li>
    </ul>
   
  </div>
</nav>
</body>
</html>