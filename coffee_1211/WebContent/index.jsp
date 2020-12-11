<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href = "css/style.css">
<%
String section = request.getParameter("section") != null ? request.getParameter("section") : "";
%>
</head>
<body>
	<%@include file = "static/header.jsp" %>
	<%@include file = "static/nav.jsp" %>
	
	<%
	switch(section){
	case "register_sale":
		%><%@include file = "page/register_sale.jsp"%><%
		break;
	case "confirm_sale":
		%><%@include file = "page/confirm_sale.jsp"%><%
		break;
	case "sale_by_shop":
		%><%@include file = "page/sale_by_shop.jsp"%><%
		break;
	case "sale_by_product":
		%><%@include file = "page/sale_by_product.jsp"%><%
		break;
	default:
		%><%@include file = "static/index.jsp" %><%
	}
	%>
	<%@include file ="static/footer.jsp" %>
</body>
</html>