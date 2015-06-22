<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/css/bootstrap-theme.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/css/select2-bootstrap.css" rel="stylesheet"/>
		<link href="${pageContext.request.contextPath}/css/select2.css" rel="stylesheet"/>
		
		<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
		<script src="${pageContext.request.contextPath}/js/select2.js"></script>
<title>Login Page</title>
</head>
 <body>
	<div class="container" style="margin-top: 50px">
    <div class="row">
        <div class="col-sm-6 col-md-4 col-md-offset-4 well well-small">
            <h1 class="text-center login-title">Sign in to continue</h1>
            <div class="account-wall">
                <img class="profile-img" src="${pageContext.request.contextPath}/img/loginphoto.png"
                    alt="" style="margin-left: 110px; margin-top: 20px; margin-bottom: 20px">
                 <p style="color: red">${error}</p>   
                <form class="form-signin" name='f' action="<c:url value='${pageContext.request.contextPath}/j_spring_security_check' />" method='post'>
                <input type="text" class="form-control" placeholder="Username" name='j_username' style="margin-bottom:  5px" required autofocus>
                <input type="password" class="form-control" placeholder="Password" name='j_password'style="margin-bottom:  15px" required>
                <button class="btn btn-lg btn-primary btn-block" type="submit">
                    Sign in</button>
                
               
                </form>
            </div>
           
        </div>
    </div>
</div>
</body>
</html>