<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<h3>상품별 판매액</h3>
<table border = "1">
<tr>
	<td>상품코드</td>
	<td>상품명</td>
	<td>상품별 판매액</td>
</tr>
<%
try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection conn = DriverManager.getConnection
		("jdbc:oracle:thin:@//122.128.169.32:1521/xe", "system", "1234");
		Statement stmt = conn.createStatement();
		String query = "SELECT " + 
			    "PRODUCT.PCODE, PRODUCT.NAME, " + 
			    "TO_CHAR(SUM(PRODUCT.COST * SALELIST.AMOUNT), '999,999,999,999') " +
			"FROM " + 
			    "TBL_PRODUCT_01 PRODUCT, " +
			    "TBL_SALELIST_01 SALELIST " +
			"WHERE " + 
			    "PRODUCT.PCODE = SALELIST.PCODE " +
			"GROUP BY " + 
			    "PRODUCT.PCODE, PRODUCT.NAME " +
			"ORDER BY " +
			    "SUM(PRODUCT.COST * SALELIST.AMOUNT) DESC ";
				
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