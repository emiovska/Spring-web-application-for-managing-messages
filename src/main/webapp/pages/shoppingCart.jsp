<%-- 
    Document   : Kosnicka
    Created on : 6.12.2010, 00:29:
    Author     : ristes
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@page import="mk.ukim.finki.mp.stateful.model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<div>
    <h3>Производни во вашата кошничка:</h3>
    <br/>
    <!-- Proizvodite gi prikazuvame vo lista so bullets -->
    <ul>
    <c:forEach var="product" items="${shoppingCart}">
  		<li>${product.name} - $ ${product.price }</li>
  	</c:forEach>
    </ul>
    
    <br/>
    Сумата изнесува: <b> ${total} </b>
</div>