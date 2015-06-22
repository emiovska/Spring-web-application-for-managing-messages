<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%@page import="java.util.Date"%>

<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<head>
	
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		
		
		<title>Send Message</title>
	</head>
	<script type="text/javascript">
	$(document).ready(function() {
	    var panels = $('.user-infos');
	    var panelsButton = $('.dropdown-user');
	    panels.hide();

	    //Click dropdown
	    panelsButton.click(function() {
	        //get data-for attribute
	        var dataFor = $(this).attr('data-for');
	        var idFor = $(dataFor);

	        //current button
	        var currentButton = $(this);
	        idFor.slideToggle(400, function() {
	            //Completed slidetoggle
	            if(idFor.is(':visible'))
	            {
	                currentButton.html('<i class="glyphicon glyphicon-chevron-up text-muted"></i>');
	            }
	            else
	            {
	                currentButton.html('<i class="glyphicon glyphicon-chevron-down text-muted"></i>');
	            }
	        })
	    });


	    $('[data-toggle="tooltip"]').tooltip();

	   
	
	   
	});
	
	
	</script>

<style type="text/css">

.user-row {
    margin-bottom: 14px;
}

.user-row:last-child {
    margin-bottom: 0;
}

.dropdown-user {
    margin: 13px 0;
    padding: 5px;
    height: 100%;
}

.dropdown-user:hover {
    cursor: pointer;
}

.table-user-information > tbody > tr {
    border-top: 1px solid rgb(221, 221, 221);
}

.table-user-information > tbody > tr:first-child {
    border-top: 0;
}


.table-user-information > tbody > tr > td {




</style>
<br><br>
<div class="container" style="width: 1436px; margin-left: -227px; margin-bottom: -85px">
 <div class="well col-xs-8 col-sm-8 col-md-8 col-lg-8 col-xs-offset-2 col-sm-offset-2 col-md-offset-2 col-lg-offset-2">
        <div class="row user-row">
            <div class="col-xs-3 col-sm-2 col-md-1 col-lg-1">
                <img class="img-circle"
                     src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=50"
                     alt="User Pic">
            </div>
            <div class="col-xs-8 col-sm-9 col-md-10 col-lg-10">
                <br/>
                <span class="text-muted">
                <strong>Добредојдовте
                 <b style="color: green">
                ${contact.name}
                 
                 </b>
                 </strong>
                 </span>
                 
                 
                 <span class="pull-right">
                         <a href="${pageContext.request.contextPath}/sms/changeNumber">
                            <button class="btn btn-sm btn-warning" type="button"
                                    data-toggle="tooltip"
                                    data-original-title="Промени број"><i class="glyphicon glyphicon-edit"></i></button></a>
                          <a href="${pageContext.request.contextPath}/j_spring_security_logout">  <button class="btn btn-sm btn-danger" type="button"
                                    data-toggle="tooltip"
                                    data-original-title="Одјава"><i class="glyphicon glyphicon-remove"></i></button></a>
                   </span>
            </div>
            <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1 dropdown-user" data-for=".cyruxx">
                <i class="glyphicon glyphicon-chevron-down text-muted"></i>
            </div>
        </div>
        <div class="row user-infos cyruxx">
            <div class="col-xs-12 col-sm-12 col-md-10 col-lg-10 col-xs-offset-0 col-sm-offset-0 col-md-offset-1 col-lg-offset-1">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">User information</h3>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-3 col-lg-3 hidden-xs hidden-sm">
                                <img class="img-circle"
                                     src="${pageContext.request.contextPath}/img/loginphoto.png"
                                     alt="User Pic">
                            </div>
                            <div class="col-xs-2 col-sm-2 hidden-md hidden-lg">
                                <img class="img-circle"
                                     src="${pageContext.request.contextPath}/img/photo.png"
                                     alt="User Pic">
                            </div>
                            <div class="col-xs-10 col-sm-10 hidden-md hidden-lg">
                                <strong>
                                
                
                                
                                
                                </strong><br>
                                <dl>
                                    <dt>User level:</dt>
                                    <dd>Administrator</dd>
                                    <dt>Registered since:</dt>
                                    <dd>11/12/2013</dd>
                                    <dt>Topics</dt>
                                    <dd>15</dd>
                                    <dt>Warnings</dt>
                                    <dd>0</dd>
                                </dl>
                            </div>
                            <div class=" col-md-9 col-lg-9 hidden-xs hidden-sm">
                                <strong>
                          Најавени сте како:      
                  <c:if test="${pageContext.request.userPrincipal.authenticated}">
                	 ${pageContext.request.userPrincipal.principal.username}
                 </c:if>      


							</strong><br>
                                <table class="table table-user-information">
                                    <tbody>
                                    
                                    <tr>
                                        <td>Контакт</td>
                                        <td>${contact.name}</td>
                                    </tr>
                                    <tr>
                                        <td>Салдо</td>
                                        <td>${saldo}</td>
                                    </tr>
                                    <tr>
                                        <td>Моментално корисници</td>
                                        <td>${numUsers}</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>


                
        
        
        


        
        
    </div>
</div>