<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<h3>판매현황</h3>
<table border = "1">
<tr>
	<td>비번호</td>
	<td>상품코드</td>
	<td>판매날짜</td>
	<td>매장코드</td>
	<td>상품명</td>
	<td>판매수량</td>
	<td>총매출액</td>
</tr>
<%
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection
		("jdbc:oracle:thin:@//122.128.169.32:1521/xe", "system", "1234");
		Statement stmt = conn.createStatement();
		String query = "SELECT " + 
			    "SALELIST.SALENO, SHOP.SCODE, SALELIST.SALEDATE, PRODUCT.PCODE, " +
			    "PRODUCT.NAME, SALELIST.AMOUNT, TO_CHAR(SUM(PRODUCT.COST * SALELIST.AMOUNT), '999,999,999,999') " +
			"FROM " +
			    "TBL_SALELIST_01 SALELIST, TBL_PRODUCT_01 PRODUCT, TBL_SHOP_01 SHOP " +
			"WHERE " +
			    "SALELIST.PCODE = PRODUCT.PCODE AND " +
			    "SHOP.SCODE = SALELIST.SCODE " +
			"GROUP BY " +
			    "SALELIST.SALENO, SHOP.SCODE, SHOP.SNAME, SALELIST.SALEDATE, PRODUCT.PCODE, " +
			    "PRODUCT.NAME, SALELIST.AMOUNT " +
			"ORDER BY " +
			    "SALELIST.SALENO ASC ";
				
		ResultSet rs = stmt.executeQuery(query);
		
		while (rs.next()) {
			
			%>
				<tr>
					<td><%= rs.getInt(1)%></td>
					<td><%= rs.getString(2)%></td>
					<td><%= rs.getString(3) %></td>
					<td><%= rs.getString(4)%></td>
					<td><%= rs.getString(5)%></td>
					<td><%= rs.getString(6)%></td>
					<td><%= rs.getString(7)%></td>
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