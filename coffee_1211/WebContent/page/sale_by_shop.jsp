<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<h3>매장별 판매액</h3>
<table border = "1">
<tr>
	<td>매장코드</td>
	<td>매장명</td>
	<td>매장별 판매액</td>
</tr>
<%
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection
		("jdbc:oracle:thin:@//122.128.169.32:1521/xe", "system", "1234");
		Statement stmt = conn.createStatement();
		String query = "SELECT " +
			    "SHOP.SCODE, SHOP.SNAME, TO_CHAR(SUM(PRODUCT.COST * SALELIST.AMOUNT), '999,999,999,999') " +
			    "FROM " +
			        "TBL_SHOP_01 SHOP, TBL_SALELIST_01 SALELIST, TBL_PRODUCT_01 PRODUCT " +
			    "WHERE " +
			        "SHOP.SCODE = SALELIST.SCODE AND " +
			        "PRODUCT.PCODE = SALELIST.PCODE " +
			    "GROUP BY " +
			        "SHOP.SCODE, SHOP.SNAME " +
			    "ORDER BY " +
			        "SHOP.SCODE ASC ";
				
		ResultSet rs = stmt.executeQuery(query);
		
		while (rs.next()) {
			
			%>
				<tr>
					<td><%= rs.getString(1)%></td>
					<td><%= rs.getString(2)%></td>
					<td><%= rs.getString(3)%></td>
				</tr>
			<%
		}
		stmt.close();
		conn.close();
	}
	catch (Exception e) {
		e.printStackTrace();
	}
%>
</table> 