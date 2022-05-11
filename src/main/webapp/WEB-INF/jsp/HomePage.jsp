<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>	
<jsp:include page="Header.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="../../webjars/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" />
<script src="../../webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="../../webjars/jquery/3.0.0/js/jquery.min.js"></script>
<meta charset="UTF-8">
<title>HomePage</title>
</head>
<body>
	<div class="btn-group-vertical-center gap-2 col-6 mx-auto" style="margin-bottom: 10px">
		<p class="text-center" style="font-size: 50px">Welcome to the academy management app</p>
		<div class="container" style="display:flex; width: 500px; margin-top: 20px;">
			<spring:url value="/academiesHP" var="AccademyURL" />
				<form:form method="post" action="${AccademyURL}">
					<button type="submit" class="btn btn-success" data-bs-toggle="button" autocomplete="off" type="button" style="flex: 1; margin-right: 50px; width: 200px; display: inline-block;">Go to Academy HomePage</button>
				</form:form>
			<spring:url value="/report" var="ReportURL" />
				<form:form method="post" action="${ReportURL}">
		 			<button type="submit" class="btn btn-success" data-bs-toggle="button" autocomplete="off" type="button" style="flex: 1; margin-left: 10px; width: 200px; display: inline-block;">Go to Global Report</button>
				</form:form>
		</div>
	</div>
<jsp:include page="Footer.jsp" />
</body>
</html>