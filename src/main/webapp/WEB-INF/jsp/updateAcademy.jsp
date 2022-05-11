<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="Header.jsp" />
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Academy</title>
<link href="../../webjars/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" />
<script src="../../webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="../../webjars/jquery/3.0.0/js/jquery.min.js"></script>
</head>
<body>
	<div class="container" style="margin-bottom: 10px; margin-top: 10px">
		<spring:url value="/AcademyApproved" var="addURL" />
		<h2>Update Academy</h2>
		<!--ModelAttribute=n collegamento tra model e view     -->
		<form:form modelAttribute="academy" method="post" action="${addURL}"
			cssClass="form">
			<div class="form-group">
				<label>Academy Code:</label>
				<form:input path="codeId" cssClass="form-control" id="codeId" readonly="true"/>
			</div>
			<div class="form-group">
				<label>Academy Title</label>
				<form:input path="title" cssClass="form-control" id="title" pattern="[a-zA-Z0-9\s]+"/>
			</div>
			<div class="form-group">
				<label>Location</label>
				<form:input path="location" cssClass="form-control" id="location" pattern="[a-zA-Z0-9\s]+"/>
			</div>
			<div class="form-group">
			<label>Starting Date</label>
	            <div class="form-group">
	                <div class="input-group date" id="datepicker1">
	                    <form:input path="startDate" type="text" class="form-control" id="startDate"/>
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
                        <form:input path="endDate" type="text" class="form-control" id="endDate" />
                        <span class="input-group-append">
                            <span class="input-group-text bg-white d-block">
                                <i class="fa fa-calendar"></i>
                            </span>
                        </span>
                    </div>
                </div>
        	</div>
			<button type="submit" class="btn btn-success">Update Academy</button>
		</form:form>

	</div>
<jsp:include page="Footer.jsp" />
	
	<script type="text/javascript">
        $(function() {
            $('#datepicker1').datepicker({
            	format: "dd/mm/yyyy"
            });
            $('#datepicker2').datepicker({
            	format: "dd/mm/yyyy"
            });
        });
    </script>
</body>
</html>