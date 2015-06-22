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
				
				
				$("#disableInput").select2();
			
				
			});
	
	function submit(){
		
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/sms/receive",
			contentType : "application/json",
			data : formToJSON(),
			dataType : 'json',
			success: (function (data){
			//	alert(data.name);
			
			if(data.status==1){
				$("#status").html("Пораката беше успешно пратена ");
				$("input#from").val("");
				$('#numberTo').val("");
			    $('#content').val("");
			}
			else{
				
				$("#status").html("Пораката не беше успешно пратена. Некој од броевите се невалидни");
				
			}
			
			
			})
			
			
		});
		
	}
	
		
	
	function formToJSON() {
		
			return JSON.stringify({
				"sender" : $("input#from").val(),
				"receiver" : $('#numberTo').val(),
				"body" : $('#content').val()
				
			});
			
		
		
		}
		
	
	
	</script>
		<body>
		<jsp:include page="NumberOfUsers.jsp"/>
			<div style="width: 940px; margin-top:70px; margin-left: 20px;" class="well">
				
				<ul class="nav nav-tabs">
  						<li class="active"><a href="#">Нова порака</a></li>
 						 
				</ul>
				
				<div style="padding-top: 30px">
				
				<table>				
					<tbody>
						<tr>
							<td>From number:</td>
							<td><input  path="numberFrom"  id="from" class="form-control" id="disabledInput" style="width: 350px"  required="required" autofocus/></td>
							
						</tr>
				
						<tr>
							<td>To number:</td>
							<td><input path="numberTo"  id="numberTo" style="width: 350px" required="required" class="form-control"/></td>
							
						</tr>
						<tr>							
							<td></td>
							<!--  <td><textarea rows="10" cols="118" name="content"></textarea></td>-->
							<td><textarea class="form-control counted" id="content" path="content" placeholder="Type in your message" rows="10" cols="100" style="margin-bottom:10px;" ></textarea></td>
						</tr>						
						<tr>
							<td></td>
							<td>
								<input type="button" value="Send" class="btn btn-success" style="float: right" onclick="submit()"/>
								<h5 class="pull-left" id="counter" style="color: #4aa9c4"></h5>
							
							</td>
						</tr>
					</tbody>
				</table>
				
				
				
				</div>
				
				<h4 id="status" style="color: #ee5f5b "></h4>
				
				</div>
		</body>
		
	
</html>