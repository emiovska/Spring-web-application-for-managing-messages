<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%@page import="java.util.Date"%>

<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<head>
	
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/css/bootstrap-theme.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/css/select2-bootstrap.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/css/select2.css" rel="stylesheet"/>
		
		<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
		<script src="${pageContext.request.contextPath}/js/select2.js"></script>
		
		<title>Error view</title>
	</head>
<div  style="margin-left: auto;margin-right: auto; width:50%;">
	<img src="${pageContext.request.contextPath}/img/error403.gif" style="margin-bottom: 20px"/>
	<a href="${pageContext.request.contextPath}/sms/insertPhoneNumber" class="btn btn-danger btn-large"><i class="icon-share icon-white"></i> Take Me Home</a>
	<a href="${pageContext.request.contextPath}/j_spring_security_logout" class="btn btn-large btn-info" ><i class="icon-home icon-white"></i> Sign in with a different account</a>
</div>
<div>
	
	


</div>