<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<h3>판매등록</h3>
<%
try {
	Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = DriverManager.getConnection
		("jdbc:oracle:thin:@//122.128.169.32:1521/xe", "system", "1234");
	Statement stmt = conn.createStatement();
%>
<script>
	function submit_from(){
		if (document.input_form.sale_no.value === ""){
			alert("비번호를 입력해야 합니다."); 
			document.input_form.sale_no.focus();
			return;
		}
		if (document.input_form.sale_pcode.value === ""){
			alert("상품코드를 입력해야 합니다"); 
			document.input_form.sale_pcode.focus();
			return;
		}
		if (document.input_form.sale_date.value === ""){
			alert("판매일자를 입력해야 합니다");
			document.input_form.sale_date.focus();
			return;
		}
		if (document.input_form.sale_scode.value === ""){
			alert("매장코드를 입력해야 합니다");
			document.input_form.sale_scode.focus();
			return;
		}
		if (document.input_form.sale_amount.value === ""){
			alert("판매수량을 입력해야 합니다");
			document.input_form.sale_amount.focus();
			return;
		}
			alert("정상적으로 처리되었습니다!");
			document.input_form.submit();
	}
	function reset_form(){
		alert("정보를 지우고 처음부터 다시 입력합니다!")
		document.input_form.reset();
	}
</script>

<form action="action/register_salelist.jsp" method="post" name="input_form">

	<table border = "1">
		<tr>
			<td>비번호</td>
			<td><input type="number" name="sale_no"/></td>
		</tr>
		<tr>
			<td>상품코드</td>
			<td><input type="text" name="sale_pcode"/></td>
		</tr>
		<tr>
			<td>판매일자</td>
			<td><input type="text" name="sale_date"/></td>
		</tr>
		<tr>
			<td>매장코드</td>
			<td><input type="text" name="sale_scode"/></td>
		</tr>
		<tr>
			<td>판매수량</td>
			<td><input type="number" name="sale_amount"/></td>
		</tr>
		<tr> 
			<td colspan ="2">
				<input type="button" value="등록하기" onclick="submit_from()">
				<input type="button" value="다시쓰기" onclick="reset_form()">
			</td>
		</tr>
	</table>
</form>

<%
	conn.close();
	}	
	catch (Exception e) {
		e.printStackTrace();
	}
%> 