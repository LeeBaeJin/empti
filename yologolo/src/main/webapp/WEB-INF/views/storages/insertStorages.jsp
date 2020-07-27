<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
		<h1>창고 입력</h1>
			<form action="setInsertStorages">
				
				<label>창고번호</label>	<input name="strg_no"><br/>
				<label>창고유형</label>	<input name="strg_category"><br/>
				<label>담당사원</label>	
						<select name="emp_id">
							<option value="" selected>==사원 선택==</option>
							<c:forEach items="${emps}" var="emps"> 
							<option>${emps.emp_id}</option>
							</c:forEach>
						</select><br/>
			<button type="submit">등록</button>
			</form>
</body>
</html>