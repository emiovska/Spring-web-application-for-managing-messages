<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<?xml version="1.0" encoding="UTF-8" ?>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/css/bootstrap-theme.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/css/select2-bootstrap.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/css/select2.css" rel="stylesheet"/>
		
		<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
		<script src="${pageContext.request.contextPath}/js/select2.js"></script>
		<script src="${pageContext.request.contextPath}/js/count.js"></script>
		
		<title>Send Message</title>
	</head>
	<script type="text/javascript">
	$(document).ready(function() {
				
				$("#numberTo").select2({tags:[${numbers}] , placeholder: "Insert a number" });
				$("#disableInput").select2();
				
				
	});		
				
			
	
	
	</script>
		<body>
		<jsp:include page="NumberOfUsers.jsp" />
			<div style="width: 940px; margin-top:70px; margin-left: 20px;" class="well">
				
				<ul class="nav nav-tabs">
  						<li class="active"><a href="#">Нова порака</a></li>
 						 <li><a href="${pageContext.request.contextPath}/sms/sentsmstab">Пратени пораки</a></li>
 						 <li><a href="${pageContext.request.contextPath}/sms/receivesmstab">Примени пораки</a></li>
				</ul>
				
				<div style="padding-top: 30px">
				
					<form:form method="POST"  action="${pageContext.request.contextPath}/sms/newsmstab">
				<table>				
					<tbody>
						<tr>
							<td>From number:</td>
							<td><input type="text" name="numberFrom" readonly="true" class="form-control" id="disabledInput" style="width: 350px" value="${contact.phoneNumber}" /></td>
							
						</tr>
				
						<tr>
							<td>To number:</td>
							<td><input name="numberTo" multiple id="numberTo" style="width: 350px" autofocus/></td>
							
						</tr>
						<tr>							
							<td></td>
							<!--  <td><textarea rows="10" cols="118" name="content"></textarea></td>-->
							<td><textarea class="form-control counted" name="content" placeholder="Type in your message" rows="10" cols="112" style="margin-bottom:10px;"></textarea></td>
						</tr>						
						<tr>
							<td></td>
							<td>
								<input type="submit" value="Send" class="btn btn-success" style="float: right; width: 100px"/>
								<h5 class="pull-left" id="counter" style="color: #4aa9c4">160 characters remaining</h5>
							
							</td>
						</tr>
					</tbody>
				</table>
				</form:form>
				
				
				</div>
				<h4 style="color: #ee5f5b">${message}</h4>
				</div>
		</body>
		
	
</html>