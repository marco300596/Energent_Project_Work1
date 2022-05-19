<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product List</title>
<link href="../../webjars/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" />
<script src="../../webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="../../webjars/jquery/3.0.0/js/jquery.min.js"></script>
</head>
<body>
	<div class="container">
		<table class="table table-striped">
			<tbody>
			<!--< item="${academy}" var="academy">-->
				<c:forEach items="${students}" var="student">
					<tr>
						<td>${student.FiscalCode}</td>
						<td>${student.FirstName}</td>
						<td>${student.LastName}</td>
						<td>${student.Age}</td>
						<td><spring:url value="/academies/${academy.codeId}/students/${student.FiscalCode}"
								var="editURL" /> <a class="btn btn-info" href="${editURL}" role="button">Update</a></td>
						<td><spring:url value="/students/remove/${student.FiscalCode}"
								var="deleteURL" /> <a class="btn btn-danger"
							href="${deleteURL}" role="button">Delete</a></td>
					</tr>
				</c:forEach>
				</form>
			</tbody>
		</table>
		<spring:url value="/academy" var="addURL" />
		
		<a class="btn btn-success" href="${addURL}" role="button">Add New Student</a>
	</div>
</body>
</html>