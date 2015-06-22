<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
		<script src="${pageContext.request.contextPath}/js/search.js"></script>
		
		<title>Message</title>
	</head>
	<script type="text/javascript">

	
	
	</script>
		<body>
		<jsp:include page="NumberOfUsers.jsp" />
		<div style="width: 940px; margin-top:70px; margin-left: 20px;" class="well">
				
				
				
				<div style="padding-top: 30px">
	
	<a href="${pageContext.request.contextPath}/sms/receivesmstab"><input type="button" value="Take me home" class="btn btn-success" style="float: rigth; margin-bottom: 5px; margin-left: 190px"/></a>			
	
	<div class="col-md-3" style="padding-bottom: 10px; width: 500px; margin-left: -15px; float: left">
           
                <div class="input-group">
                    <!-- USE TWITTER TYPEAHEAD JSON WITH API TO SEARCH -->
                    <input class="form-control" id="system-search" name="q" placeholder="Search for" required style="width: 500px" autofocus>
                   
                </div>
            
       </div>
	
	<table border="1px" cellpadding="0" cellspacing="0" class="table table-bordered table-list-search table-condensed table-hover">
			<thead>
				<tr style="background-color: #c9c7c7">
					<th width="25%">Примил</th>
					
					<th width="50%">Порака</th>
					
					<th width="25%">Пратил</th>
					
			
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${msgTo}">
				
					<tr>
					
					
						<td>${receiver}</td>					
						<td>${item.content}</td>
						<td>${item.contactFrom.name}</td>
						
						
						
						
					</tr>
					
				</c:forEach>
			</tbody>
		</table>
		
				
			<br/>
			<br/>
				
				<table border="1px" cellpadding="0" cellspacing="0" class="table table-bordered table-list-search table-condensed table-hover">
			<thead>
				<tr style="background-color: #c9c7c7">
					<th width="25%">Праќач</th>
					
					<th width="50%">Порака</th>
					
					<th width="25%">Примил</th>
			
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${msgFrom}">
				
					<tr>
					
					
						<td>${item.contactFrom.name}</td>
					
						<td>${item.content}</td>
						
						<td>${sender}</td>
						
						
						
						
					</tr>
					
				</c:forEach>
			</tbody>
		</table>
		
				
				
				
				
				</div>
			
				
		</div>
		
		
		<br/>
		<br/>
		
		
		
		
		
		
		
		
		</body>
		
	
</html>