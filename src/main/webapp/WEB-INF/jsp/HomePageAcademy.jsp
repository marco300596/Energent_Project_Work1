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
<title>Academy's HomePage</title>
</head>
<body>
	<div class="btn-group-horizontal-center" style="margin-bottom: 10px; margin-top: 10px">
		<spring:url value="/academy" var="AccademyURL" />
		<form:form ModelAttribute="academy" method="post" action="${AccademyURL}">
	 		<button type="submit" class="btn btn-success" data-bs-toggle="button" autocomplete="off" style="display: block; margin: 0 auto; margin-bottom: 10px; width: 200px;">Add New Accademy</button>
		</form:form>
		<spring:url value="/academies" var="AccademiesURL" />
		<form:form ModelAttribute="academy" method="post" action="${AccademiesURL}">
			<button type="submit" class="btn btn-success" data-bs-toggle="button" autocomplete="off" style="display: block; margin: 0 auto; margin-top: 10px; width: 200px;">Go to Academy's list</button>
		</form:form>
	</div>
<jsp:include page="Footer.jsp" />
</body>
</html>