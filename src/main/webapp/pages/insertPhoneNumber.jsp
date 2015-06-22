
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert number</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/css/bootstrap-theme.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/css/select2-bootstrap.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/css/select2.css" rel="stylesheet"/>
		
		<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
		<script src="${pageContext.request.contextPath}/js/select2.js"></script>





</head>
<body>
<div style="margin-top: 10px">
<!--<jsp:include page="logininfo.jsp"/>-->
</div>
<div>
<div style="width: 40%; margin-left: 150px; padding-top: 50px; float:left; " >

    <div class="row">
		<div class="span4 offset4 well">
			<legend >Внесете го вашиот телефонски број</legend>
          	
			<form action="${pageContext.request.contextPath}/sms/number" method="post" style="padding-top:5px">
	<table>
	<tr>
		<td>Телефонски број</td>
		<td><input type="text" class="form-control" placeholder="Text input" name="number" id="focusedInput" required="required" style="width: 280px"></td>
	</tr>
	
	<tr>
		<td></td>
		<td><input type="checkbox" name="remember"> Remember me </td>
	
	</tr>	
	<tr>
		<td></td>
		<td></td>
	
	</tr>
	<tr>
		<td></td>
		<td><input type="submit" value="Продолжи" class="btn btn-success" style="float: right"/></td>
	
	</tr>
		</table>
	</form>   
	<div class="alert alert-error" style="color: red;">
                <a class="close" data-dismiss="alert" href="#" style="color: green"></a>${error}
            </div>
	</div>
	
	</div>

</div>





<div class="well well-small" style="width: 30%; float: right; margin-top: 50px; margin-right: 240px; height: 248px">
    <div class="" style="margin-left: 5px">
        <div class="">
           
            <div class="account-wall">
                <img class="profile-img" src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=120"
                    alt="" style="margin-left: 120px">
                    
                <p class="profile-name" style="margin-left: 93px; margin-top: 10px">
                
                <c:if test="${pageContext.request.userPrincipal.authenticated}">
			<p style="font-size: 19px; margin-left: 70px">Најавени сте како: <b style="color: green">${pageContext.request.userPrincipal.principal.username}</b> 
			
	</c:if>
                
                
                </p>
                
                
            </div>
         <c:if test="${pageContext.request.userPrincipal.authenticated}">
			
			 <a href="${pageContext.request.contextPath}/j_spring_security_logout" class="text-center new-account" style="float: right">Sign in with a different account</a>
			
	</c:if>
            
            
           
        </div>
    </div>
</div>
</div>

</body>
</html>
