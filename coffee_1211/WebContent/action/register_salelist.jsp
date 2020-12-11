<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
request.setCharacterEncoding("UTF-8");
int sale_no = Integer.parseInt(request.getParameter("sale_no"));
String sale_pcode = request.getParameter("sale_pcode");
String sale_date = request.getParameter("sale_date");
String sale_scode = request.getParameter("sale_scode");
int sale_amount = Integer.parseInt(request.getParameter("sale_amount"));
try {
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection
		("jdbc:oracle:thin:@//122.128.169.32:1521/xe", "system", "1234");
	Statement stmt = conn.createStatement();
	
	String query = "INSERT INTO TBL_SALELIST_01(SALENO, PCODE, SALEDATE, SCODE, AMOUNT) " +
				   "VALUES(%d, '%s', '%s', '%s', %d) ";
	
	ResultSet rs = stmt.executeQuery(String.format(query, sale_no, sale_pcode, sale_date, sale_scode, sale_amount));
	
	conn.commit();
	stmt.close();
	conn.close();
}
catch (Exception e) {
	e.printStackTrace();
}
response.sendRedirect("../index.jsp");
%> 