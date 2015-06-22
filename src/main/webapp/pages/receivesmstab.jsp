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
		
		<title>Receive Messages</title>
	</head>
	<script type="text/javascript">
	
		
	
	
	</script>
		<body>
		<jsp:include page="NumberOfUsers.jsp" />
		<div style="width: 940px; margin-top:70px; margin-left: 20px;" class="well">
				
				<ul class="nav nav-tabs">
  						<li><a href="${pageContext.request.contextPath}/sms/newsmstab">Нова порака</a></li>
 						 <li><a href="${pageContext.request.contextPath}/sms/sentsmstab">Пратени пораки</a></li>
 						 <li class="active"><a href="#">Примени пораки</a></li>
				</ul>
				
<div style="padding-top: 30px">
				
	<div class="col-md-3" style="padding-bottom: 10px; width: 500px; margin-left: -15px">
           
                <div class="input-group">
                    <!-- USE TWITTER TYPEAHEAD JSON WITH API TO SEARCH -->
                    <input class="form-control" id="system-search" name="q" placeholder="Search for" required style="width: 500px" autofocus/>
                   
                </div>
            
       </div>
   
  
   	
	<table border="1px" cellpadding="0" cellspacing="0" class="table table-bordered table-list-search table-condensed table-hover">
			<thead>
				<tr>
					
					<th width="30%">Испраќач</th>
					<th width="70%">Content</th>
			
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${allSms}">
					<tr>
					
						<td> <a href="${pageContext.request.contextPath}/sms/msg/${item.contactFrom.phoneNumber}">${item.contactFrom.name}</a> </td>
						
						<td>${item.content}</td>
						
						
						
						
					</tr>
				</c:forEach>
			</tbody>
		</table>
	
				
</div>
				
		</div>
		</body>
		
	
</html>