<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="Header.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="../../webjars/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" />
<script src="../../webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="../../webjars/jquery/3.0.0/js/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Update Academy Approved</title>
</head>
<body>
	<div class="btn-group-vertical-center gap-2 col-6 mx-auto" style="margin-bottom: 10px; margin-top: 10px">
	<spring:url value="/academies" var="AcademiesURL" />
	<form:form modelAttribute="academy" method="post" action="${AcademiesURL}" cssClass="form">
		<p class="text-center" style="font-size: 50px;">the academy selected is now updated:</p>
		<div class="form-group">
			<label>Academy Code</label>
			<form:input path="codeId" cssClass="form-control" id="codeId" readonly="true"/>
		</div>
		<div class="form-group">
			<label>Academy Title</label>
			<form:input path="title" cssClass="form-control" id="title" readonly="true"/>
		</div>
		<div class="form-group">
			<label>Location</label>
			<form:input path="location" cssClass="form-control" id="location" readonly="true"/>
		</div>
		<div class="form-group">
		<label>Starting Date</label>
            <div class="form-group">
                <div class="input-group date" id="datepicker1">
                    <form:input path="startDate" type="text" class="form-control" id="startDate" readonly="true"/>
                    <span class="input-group-append">
                        <span class="input-group-text bg-white d-block">
                            <i class="fa fa-calendar"></i>
                        </span>
                    </span>
                </div>
            </div>
           </div>
		<div class="form-group">
		<label>Ending Date</label>
               <div class="form-group">
                   <div class="input-group date" id="datepicker2">
                       <form:input path="endDate" type="text" class="form-control" id="endDate" readonly="true"/>
                       <span class="input-group-append">
                           <span class="input-group-text bg-white d-block">
                               <i class="fa fa-calendar"></i>
                           </span>
                       </span>
                   </div>
               </div>
       	</div>
		<div class="container" style="display:flex; width: 500px; margin-top: 20px;">
		<button type="submit" class="btn btn-success" data-bs-toggle="button" autocomplete="off" type="button" style="flex: 1; margin-left: 10px; width: 200px; display: inline-block;">Go to Academy's list</button>
		</div>
		</form:form>
		</div>
	<jsp:include page="Footer.jsp" />
</body>
</html>